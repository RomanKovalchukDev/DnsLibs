# Third-Party Licenses

This product includes the NerdDnsProxy DNS library (a static library / framework
derived from AdGuard DnsLibs and NativeLibsCommon) and the open-source components
listed below, all of which are statically linked into the shipped binary.

Any application that bundles this static library must reproduce this document
(or an equivalent notice carrying the same information) in a place its own users
can read it, for example an in-app "Acknowledgements" or "Licenses" screen.

All components below are used under permissive terms (Apache-2.0, MIT, BSD, ISC,
OpenSSL) or, for the Public Suffix List, the Mozilla Public License 2.0 (a
file-level license that imposes no obligation on the code that merely uses the
data). None of these licenses restrict commercial or closed-source distribution;
they require attribution only.

Version and copyright lines reflect the upstream projects. Reconcile the exact
year/holder text against the specific versions you ship if your compliance
process requires it.

--------------------------------------------------------------------------------
## Components

### NerdDnsProxy (derived from AdGuard DnsLibs)
- Source: https://github.com/AdguardTeam/DnsLibs
- License: Apache License 2.0
- Copyright (c) AdGuard Software Ltd.
- Modifications: portions of DnsLibs were modified by Roman Kovalchuk in 2025 and
  2026 (see "Modifications" below). The modifications are licensed under the same
  Apache License 2.0.

### NativeLibsCommon (AdGuard)
- Source: https://github.com/AdguardTeam/NativeLibsCommon
- License: Apache License 2.0
- Copyright (c) AdGuard Software Ltd.
- Modifications: the bundled ldns recipe was modified by Roman Kovalchuk in 2025
  and 2026. The modifications are licensed under the same Apache License 2.0.

### ldns
- Source: https://github.com/NLnetLabs/ldns
- License: BSD 3-Clause
- Copyright (c) 2005-2024 NLnet Labs. All rights reserved.

### libevent
- Source: https://github.com/libevent/libevent
- License: BSD 3-Clause
- Copyright (c) 2000-2007 Niels Provos and 2007-2012 Niels Provos and Nick Mathewson.

### libsodium
- Source: https://github.com/jedisct1/libsodium
- License: ISC
- Copyright (c) 2013-2024 Frank Denis <j at pureftpd dot org>.

### PCRE2
- Source: https://github.com/PCRE2Project/pcre2
- License: BSD 3-Clause (PCRE2 license)
- Copyright (c) 1997-2024 University of Cambridge.

### ngtcp2
- Source: https://github.com/ngtcp2/ngtcp2
- License: MIT
- Copyright (c) 2016-2024 ngtcp2 contributors.

### nghttp2 / nghttp3
- Source: https://github.com/nghttp2/nghttp2 , https://github.com/ngtcp2/nghttp3
- License: MIT
- Copyright (c) 2012-2024 Tatsuhiro Tsujikawa and contributors.

### BoringSSL (with OpenSSL-derived code)
- Source: https://boringssl.googlesource.com/boringssl
- License: OpenSSL License, SSLeay License, and ISC (mixed)
- Copyright (c) 1995-1998 Eric Young, (c) 1998-2011 The OpenSSL Project,
  and (c) Google Inc.

### ada (URL parser)
- Source: https://github.com/ada-url/ada
- License: Apache License 2.0 OR MIT
- Copyright (c) 2023 Yagiz Nizipli and Daniel Lemire.

### fmt
- Source: https://github.com/fmtlib/fmt
- License: MIT
- Copyright (c) 2012-present Victor Zverovich and contributors.

### spdlog
- Source: https://github.com/gabime/spdlog
- License: MIT
- Copyright (c) 2016 Gabi Melman.

### llhttp
- Source: https://github.com/nodejs/llhttp
- License: MIT
- Copyright (c) Fedor Indutny and contributors.

### cxxopts
- Source: https://github.com/jarro2783/cxxopts
- License: MIT
- Copyright (c) 2014 Jarryd Beck.

### magic_enum
- Source: https://github.com/Neargye/magic_enum
- License: MIT
- Copyright (c) 2019-2024 Daniil Goncharov.

### klib
- Source: https://github.com/attractivechaos/klib
- License: MIT
- Copyright (c) Attractive Chaos <attractor@live.co.uk>.

### Public Suffix List (tldregistry data)
- Source: https://github.com/publicsuffix/list
- License: Mozilla Public License 2.0
- Copyright (c) Mozilla Foundation and contributors.
- This component is data, used unmodified. See the MPL-2.0 notice below.

--------------------------------------------------------------------------------
## Modifications (Apache-2.0 Section 4(b))

The DnsLibs and NativeLibsCommon sources were modified by Roman Kovalchuk in 2025
and 2026, relative to DnsLibs v2.8.54 and NativeLibsCommon v8.1.33. Changes
include extended DNS error (EDE) and EDNS0 device/subscriber identifier options,
optional DNS64 fixed-prefix synthesis, a force-fallback-only upstream mode,
DNSSEC-OK handling, framework build/identity/hardening changes, and an updated
and repackaged ldns dependency. These modifications are licensed under the
Apache License, Version 2.0.

================================================================================
## Full License Texts
================================================================================

--------------------------------------------------------------------------------
### Apache License 2.0
(applies to: NerdDnsProxy/DnsLibs, NativeLibsCommon, ada)
--------------------------------------------------------------------------------

                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

--------------------------------------------------------------------------------
### MIT License
(applies to: ngtcp2, nghttp2, nghttp3, fmt, spdlog, llhttp, cxxopts,
magic_enum, klib, and ada when used under MIT)
--------------------------------------------------------------------------------

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--------------------------------------------------------------------------------
### BSD 3-Clause License
(applies to: ldns, libevent, PCRE2)
--------------------------------------------------------------------------------

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

--------------------------------------------------------------------------------
### ISC License
(applies to: libsodium)
--------------------------------------------------------------------------------

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.

--------------------------------------------------------------------------------
### OpenSSL / SSLeay License
(applies to: BoringSSL and OpenSSL-derived code)
--------------------------------------------------------------------------------

This product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit (http://www.openssl.org/), software written by Eric Young
(eay@cryptsoft.com), and software developed by Google Inc.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the copyright notices and this
permission notice appear in all copies, and that the name of the copyright
holders is not used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE.

(The full OpenSSL and SSLeay license texts, and the BoringSSL LICENSE file,
should be reproduced verbatim from the version of BoringSSL you ship.)

--------------------------------------------------------------------------------
### Mozilla Public License 2.0
(applies to: Public Suffix List data)
--------------------------------------------------------------------------------

This Source Code Form is subject to the terms of the Mozilla Public License,
v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.

The Public Suffix List data is used unmodified. Under MPL-2.0, only
modifications to MPL-licensed files must be disclosed; using the unmodified data
imposes no obligation on the surrounding application code. The full text of the
Mozilla Public License 2.0 should be included alongside this notice (available
at https://www.mozilla.org/en-US/MPL/2.0/).
