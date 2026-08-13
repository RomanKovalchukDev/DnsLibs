#!/bin/sh

set -e
set -x

HELP_MSG="
Usage: build_dnsproxy_framework.sh [options...|clean]
    --os       Target os (valid values: macos-{x86_64,arm64}, ios, iphonesimulator-{x86_64,arm64}, all)
               'all' - by default
    --tn       Target framework name
    --bp       Build directory path
    --fwp      Framework cmake project path
    --debug    Build with debug configuration
"

TARGET_OS="all"
BUILD_DIR="${SRCROOT}/framework"
FRAMEWORK_DIR="${SRCROOT}/../framework"

if [ -z ${TARGETNAME+x} ]; then
    TARGET_NAME="AGDnsProxy"
else
    TARGET_NAME="${TARGETNAME}"
fi

if [ "${CONFIGURATION}" = "Debug" ]; then
    BUILD_TYPE="Debug"
else
    BUILD_TYPE="RelWithDebInfo"
fi


if [ "${1}" == "clean" ]; then
    echo "Clean Build"
    rm -Rfv "${BUILD_DIR}"
    exit 0
fi


while [[ $# -gt 0 ]]
do
    case "$1" in
    --help)
        echo "${HELP_MSG}"
        exit 0
        ;;
    --os)
        shift
        if [[ $# -gt 0 ]]; then
            TARGET_OS=$1
        else
            echo "os is not specified"
            echo "${HELP_MSG}"
            exit 1
        fi
        shift
        ;;
    --tn)
        shift
        if [[ $# -gt 0 ]]; then
            TARGET_NAME=$1
        else
            echo "target name is not specified"
            echo "${HELP_MSG}"
            exit 1
        fi
        shift
        ;;
    --bp)
        shift
        if [[ $# -gt 0 ]]; then
            BUILD_DIR="$1"
        else
            echo "build path is not specified"
            echo "${HELP_MSG}"
            exit 1
        fi
        shift
        ;;
    --fwp)
        shift
        if [[ $# -gt 0 ]]; then
            FRAMEWORK_DIR="$1"
        else
            echo "framework path is not specified"
            echo "${HELP_MSG}"
            exit 1
        fi
        shift
        ;;
    --debug)
        shift
        BUILD_TYPE="Debug"
        ;;
    *)
        echo "unknown option ${1}"
        echo "${HELP_MSG}"
        exit 1
    esac
done


# CI938 - Information Leakage: resolve paths used to harden dependency builds.
# The hardening profile is appended to the Conan host profile so third-party
# deps are compiled with -ffile-prefix-map (see conan-hardening.jinja).
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
HARDENING_PROFILE="${SCRIPT_DIR}/conan-hardening.jinja"
# Apple, non-sanitized release profile selected by cmake/conan_provider.cmake.
CONAN_PLATFORM_PROFILE="${REPO_ROOT}/conan/profiles/apple.jinja"


function build_target() {
    local 'target_name' 'target_os' 'build_dir' 'cmake_opt' 'target_arch'

    target_name=$1
    target_os=${2%-*}
    target_arch=${2#*-}
    build_dir=$3

    echo "Building ${target_name}..."

    mkdir -pv "${build_dir}"
    cd "${build_dir}"
    pwd

    case ${target_os} in
    ios)
        target_arch=arm64
        ;;
    esac

    target_name=${target_name%-*}
    echo "target_name=${target_name}"
    echo "target_os=${target_os}"

    cmake_opt="-DCMAKE_BUILD_TYPE=${BUILD_TYPE} -GNinja"
    cmake_opt="${cmake_opt} -DCMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT=\"dwarf-with-dsym\""
    cmake_opt="${cmake_opt} -DCMAKE_CXX_FLAGS=\"-stdlib=libc++\""
    cmake_opt="${cmake_opt} -DTARGET_OS:STRING=${target_os} -DCMAKE_OSX_ARCHITECTURES=${target_arch}"
    # Append the path-hardening profile on top of the platform + auto-cmake profiles.
    cmake_opt="${cmake_opt} -DCONAN_HOST_PROFILE=${CONAN_PLATFORM_PROFILE};auto-cmake;${HARDENING_PROFILE}"

    case ${target_os} in
    ios)
        cmake_opt="${cmake_opt} -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphoneos"
        ;;
    iphonesimulator)
        cmake_opt="${cmake_opt} -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphonesimulator"
        ;;
    esac

    cmake ${cmake_opt} ${FRAMEWORK_DIR}
    if [ $? != 0 ]; then
        echo "CMake error!"
        exit 1
    fi

    ninja ${target_name}
    if [ $? != 0 ]; then
        echo "make error!"
        exit 1
    fi

    cd -

    echo "Built ${target_name} successfully"
}


if [ ! -z ${TARGET_OS+x} ] && [ "${TARGET_OS}" != "all" ]
then
    build_target "${TARGET_NAME}" "${TARGET_OS}" "${BUILD_DIR}"
else
    targets=( macos-x86_64 macos-arm64 ios-arm64 iphonesimulator-x86_64 iphonesimulator-arm64 )
    for i in "${!targets[@]}"
    do
        target=${targets[$i]}
        build_target "${TARGET_NAME}" "${target}" "${BUILD_DIR}/framework-${target}"
    done

    rm -rf "${BUILD_DIR}/${TARGET_NAME}.xcframework"
    rm -rf "${BUILD_DIR}/${TARGET_NAME}.dSYMs"
    rm -rf "${BUILD_DIR}/framework-macos"
    rm -rf "${BUILD_DIR}/framework-iphonesimulator"

    mkdir -p "${BUILD_DIR}/framework-macos"
    cp -Rf "${BUILD_DIR}/framework-macos-x86_64/AGDnsProxy.framework" "${BUILD_DIR}/framework-macos/"
    rm "${BUILD_DIR}"/framework-macos/AGDnsProxy.framework/Versions/A/AGDnsProxy
    lipo -create -output "${BUILD_DIR}"/framework-macos{,-x86_64,-arm64}/AGDnsProxy.framework/Versions/A/AGDnsProxy
    mkdir -p "${BUILD_DIR}/framework-iphonesimulator"
    cp -Rf "${BUILD_DIR}/framework-iphonesimulator-x86_64/AGDnsProxy.framework" "${BUILD_DIR}/framework-iphonesimulator/"
    rm "${BUILD_DIR}"/framework-iphonesimulator/AGDnsProxy.framework/AGDnsProxy
    lipo -create -output "${BUILD_DIR}"/framework-iphonesimulator{,-x86_64,-arm64}/AGDnsProxy.framework/AGDnsProxy

    args=()
    for final_arch in macos ios-arm64 iphonesimulator; do
        dsymutil -o "${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework.dSYM" "${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework/${TARGET_NAME}"
        # CI938: debug symbols now live in the .dSYM; strip them (and local
        # symbols) from the shipped binary so debug-map source paths do not leak.
        strip -S -x "${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework/${TARGET_NAME}"
        args=(${args[@]} -framework "${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework")
        args=(${args[@]} -debug-symbols "${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework.dSYM")
    done

    xcodebuild -create-xcframework ${args[@]} -output "${BUILD_DIR}/${TARGET_NAME}.xcframework"

    # CI938 - Information Leakage: fail the build if any shipped slice still
    # embeds an absolute home/user path that reveals the developer identity or
    # build machine (e.g. /Users/<name>, /home/<name>, /root). Relative paths
    # such as .conan2/... are acceptable: they no longer carry a username, and
    # the trailing #include suffix (e.g. fmt/format.h) cannot be stripped via
    # -ffile-prefix-map without breaking assert diagnostics.
    LEAK_PATTERN='/Users/|/home/|/root/'
    echo "Verifying framework binaries for build-path leakage..."
    leak_found=0
    for final_arch in macos ios-arm64 iphonesimulator; do
        bin="${BUILD_DIR}/framework-${final_arch}/${TARGET_NAME}.framework/${TARGET_NAME}"
        if strings "${bin}" | grep -qiE "${LEAK_PATTERN}"; then
            echo "LEAK detected in ${final_arch}:"
            strings "${bin}" | grep -iE "${LEAK_PATTERN}" | sort -u | head
            leak_found=1
        fi
    done
    if [ "${leak_found}" != "0" ]; then
        echo "ERROR: build-path leakage detected in framework binaries (CI938)."
        exit 1
    fi
    echo "OK: no build-path leakage detected."
fi
