# SOURCE SNAPSHOT\n\n- Source URL: https://mas.owasp.org/MASTG/0x02b-MASVS-MASTG-Adoption/\n- Title: MASVS and MASTG adoption\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n 

[Skip to content](#owasp-masvs-and-mastg-adoption)

[![logo](../../assets/logo_circle.png)](../.. "OWASP Mobile Application Security")

OWASP Mobile Application Security

OWASP MASVS and MASTG Adoption

 

[](javascript:void\(0\) "Share")

Initializing search

*   [Home](../..)
*   [MASVS](../../MASVS/)
*   [MASWE](../../MASWE/)
*   [MASTG](../)
*   [MAS Crackmes](../../crackmes/)
*   [News](../../news/)
*   [🎙 Talks](../../talks/)
*   [⭐ Contribute](../../contributing/)
*   [💙 Donate](../../donate/)
*   [💬 Connect with Us](../../contact/)

 [![logo](../../assets/logo_circle.png)](../.. "OWASP Mobile Application Security")OWASP Mobile Application Security

*   [Home](../..)
    
    Home
    
*   [MASVS](../../MASVS/)
    
    MASVS
    
    *    Intro
        
        Intro
        
        *   [Foreword](../../MASVS/01-Foreword/)
        *   [About the Standard](../../MASVS/02-Frontispiece/)
        *   [The Mobile Application Security Verification Standard](../../MASVS/03-Using_the_MASVS/)
        *   [Assessment and Certification](../../MASVS/04-Assessment_and_Certification/)
        
    *   [MASVS-STORAGE: Storage](../../MASVS/05-MASVS-STORAGE/)
    *   [MASVS-STORAGE-1](../../MASVS/controls/MASVS-STORAGE-1/)
    *   [MASVS-STORAGE-2](../../MASVS/controls/MASVS-STORAGE-2/)
    *   [MASVS-CRYPTO: Cryptography](../../MASVS/06-MASVS-CRYPTO/)
    *   [MASVS-CRYPTO-1](../../MASVS/controls/MASVS-CRYPTO-1/)
    *   [MASVS-CRYPTO-2](../../MASVS/controls/MASVS-CRYPTO-2/)
    *   [MASVS-AUTH: Authentication and Authorization](../../MASVS/07-MASVS-AUTH/)
    *   [MASVS-AUTH-1](../../MASVS/controls/MASVS-AUTH-1/)
    *   [MASVS-AUTH-2](../../MASVS/controls/MASVS-AUTH-2/)
    *   [MASVS-AUTH-3](../../MASVS/controls/MASVS-AUTH-3/)
    *   [MASVS-NETWORK: Network Communication](../../MASVS/08-MASVS-NETWORK/)
    *   [MASVS-NETWORK-1](../../MASVS/controls/MASVS-NETWORK-1/)
    *   [MASVS-NETWORK-2](../../MASVS/controls/MASVS-NETWORK-2/)
    *   [MASVS-PLATFORM: Platform Interaction](../../MASVS/09-MASVS-PLATFORM/)
    *   [MASVS-PLATFORM-1](../../MASVS/controls/MASVS-PLATFORM-1/)
    *   [MASVS-PLATFORM-2](../../MASVS/controls/MASVS-PLATFORM-2/)
    *   [MASVS-PLATFORM-3](../../MASVS/controls/MASVS-PLATFORM-3/)
    *   [MASVS-CODE: Code Quality](../../MASVS/10-MASVS-CODE/)
    *   [MASVS-CODE-1](../../MASVS/controls/MASVS-CODE-1/)
    *   [MASVS-CODE-2](../../MASVS/controls/MASVS-CODE-2/)
    *   [MASVS-CODE-3](../../MASVS/controls/MASVS-CODE-3/)
    *   [MASVS-CODE-4](../../MASVS/controls/MASVS-CODE-4/)
    *   [MASVS-RESILIENCE: Resilience Against Reverse Engineering and Tampering](../../MASVS/11-MASVS-RESILIENCE/)
    *   [MASVS-RESILIENCE-1](../../MASVS/controls/MASVS-RESILIENCE-1/)
    *   [MASVS-RESILIENCE-2](../../MASVS/controls/MASVS-RESILIENCE-2/)
    *   [MASVS-RESILIENCE-3](../../MASVS/controls/MASVS-RESILIENCE-3/)
    *   [MASVS-RESILIENCE-4](../../MASVS/controls/MASVS-RESILIENCE-4/)
    *   [MASVS-PRIVACY: Privacy](../../MASVS/12-MASVS-PRIVACY/)
    *   [MASVS-PRIVACY-1](../../MASVS/controls/MASVS-PRIVACY-1/)
    *   [MASVS-PRIVACY-2](../../MASVS/controls/MASVS-PRIVACY-2/)
    *   [MASVS-PRIVACY-3](../../MASVS/controls/MASVS-PRIVACY-3/)
    *   [MASVS-PRIVACY-4](../../MASVS/controls/MASVS-PRIVACY-4/)
    
*   [MASWE](../../MASWE/)
    
    MASWE
    
    *    MASVS-STORAGE
        
        MASVS-STORAGE
        
        *   [MASWE-0001: Sensitive Data Stored Unencrypted in Private Storage](../../MASWE/MASVS-STORAGE/MASWE-0001/)
        *   [MASWE-0002: Sensitive Data Stored Unencrypted Outside of Private Storage](../../MASWE/MASVS-STORAGE/MASWE-0002/)
        *   [MASWE-0003: Cryptographic Keys Stored Outside of Platform Keystore](../../MASWE/MASVS-STORAGE/MASWE-0003/)
        *   [MASWE-0004: Sensitive Data Hardcoded in the App Package](../../MASWE/MASVS-STORAGE/MASWE-0004/)
        *   [MASWE-0005: Insertion of Sensitive Data into Logs](../../MASWE/MASVS-STORAGE/MASWE-0005/)
        *   [MASWE-0006: Sensitive Data Not Excluded From Backup](../../MASWE/MASVS-STORAGE/MASWE-0006/)
        
    *    MASVS-CRYPTO
        
        MASVS-CRYPTO
        
        *   [MASWE-0007: Improper Encryption](../../MASWE/MASVS-CRYPTO/MASWE-0007/)
        *   [MASWE-0008: Improper Hashing](../../MASWE/MASVS-CRYPTO/MASWE-0008/)
        *   [MASWE-0009: Improper Use of Message Authentication Code (MAC)](../../MASWE/MASVS-CRYPTO/MASWE-0009/)
        *   [MASWE-0010: Improper Generation of Cryptographic Signatures](../../MASWE/MASVS-CRYPTO/MASWE-0010/)
        *   [MASWE-0011: Improper Verification of Cryptographic Signature](../../MASWE/MASVS-CRYPTO/MASWE-0011/)
        *   [MASWE-0012: Improper Random Number Generation](../../MASWE/MASVS-CRYPTO/MASWE-0012/)
        *   [MASWE-0013: Improper Cryptographic Key Generation](../../MASWE/MASVS-CRYPTO/MASWE-0013/)
        *   [MASWE-0014: Improper Cryptographic Key Derivation](../../MASWE/MASVS-CRYPTO/MASWE-0014/)
        *   [MASWE-0015: Cryptographic Key Rotation Not Implemented](../../MASWE/MASVS-CRYPTO/MASWE-0015/)
        *   [MASWE-0016: Cryptographic Key Access Not Restricted](../../MASWE/MASVS-CRYPTO/MASWE-0016/)
        *   [MASWE-0017: Device Secure Lock Not Enforced](../../MASWE/MASVS-CRYPTO/MASWE-0017/)
        
    *    MASVS-AUTH
        
        MASVS-AUTH
        
        *   [MASWE-0018: Lack of Authentication or Authorization on App Components](../../MASWE/MASVS-AUTH/MASWE-0018/)
        *   [MASWE-0019: Lack of Auto-fill Support for Credential Providers](../../MASWE/MASVS-AUTH/MASWE-0019/)
        *   [MASWE-0020: Local Authentication Can Be Bypassed](../../MASWE/MASVS-AUTH/MASWE-0020/)
        *   [MASWE-0021: Fallback to Non-biometric Credentials Allowed for Sensitive Transactions](../../MASWE/MASVS-AUTH/MASWE-0021/)
        *   [MASWE-0022: Crypto Keys Not Invalidated on New Biometric Enrollment](../../MASWE/MASVS-AUTH/MASWE-0022/)
        *   [MASWE-0023: Step-Up Authentication Not Implemented for Sensitive Actions](../../MASWE/MASVS-AUTH/MASWE-0023/)
        *   [MASWE-0024: Sensitive Data Accessible After Session Termination](../../MASWE/MASVS-AUTH/MASWE-0024/)
        *   [MASWE-0025: Lack of Non-Repudiation for Critical Actions](../../MASWE/MASVS-AUTH/MASWE-0025/)
        
    *    MASVS-NETWORK
        
        MASVS-NETWORK
        
        *   [MASWE-0026: Network Traffic Not Encrypted](../../MASWE/MASVS-NETWORK/MASWE-0026/)
        *   [MASWE-0027: Insecure Certificate Validation](../../MASWE/MASVS-NETWORK/MASWE-0027/)
        *   [MASWE-0028: Insecure Identity Pinning](../../MASWE/MASVS-NETWORK/MASWE-0028/)
        
    *    MASVS-PLATFORM
        
        MASVS-PLATFORM
        
        *   [MASWE-0029: Insecure Deep Links](../../MASWE/MASVS-PLATFORM/MASWE-0029/)
        *   [MASWE-0030: Improper Use of the Clipboard](../../MASWE/MASVS-PLATFORM/MASWE-0030/)
        *   [MASWE-0031: Allowing Untrusted App Extensions](../../MASWE/MASVS-PLATFORM/MASWE-0031/)
        *   [MASWE-0032: Insecure Intents](../../MASWE/MASVS-PLATFORM/MASWE-0032/)
        *   [MASWE-0033: Sensitive Native Functionality Exposed in WebViews](../../MASWE/MASVS-PLATFORM/MASWE-0033/)
        *   [MASWE-0034: WebViews Allow Access to Local Resources with Untrusted Content](../../MASWE/MASVS-PLATFORM/MASWE-0034/)
        *   [MASWE-0035: WebViews Loading Untrusted Content](../../MASWE/MASVS-PLATFORM/MASWE-0035/)
        *   [MASWE-0036: Unnecessary Exposure of Sensitive Data via the User Interface](../../MASWE/MASVS-PLATFORM/MASWE-0036/)
        *   [MASWE-0037: Unnecessary Exposure of Sensitive Data via Notifications](../../MASWE/MASVS-PLATFORM/MASWE-0037/)
        *   [MASWE-0038: Insufficient Protection of Sensitive Data from Screenshots or Screen Recordings](../../MASWE/MASVS-PLATFORM/MASWE-0038/)
        *   [MASWE-0039: App Vulnerable to Overlay Attacks](../../MASWE/MASVS-PLATFORM/MASWE-0039/)
        *   [MASWE-0040: Sensitive Data Leaked via Accessibility Services](../../MASWE/MASVS-PLATFORM/MASWE-0040/)
        
    *    MASVS-CODE
        
        MASVS-CODE
        
        *   [MASWE-0041: Running on a Recent Platform Version Not Ensured](../../MASWE/MASVS-CODE/MASWE-0041/)
        *   [MASWE-0042: Latest Platform Version Not Targeted](../../MASWE/MASVS-CODE/MASWE-0042/)
        *   [MASWE-0043: Enforced Updating Not Implemented](../../MASWE/MASVS-CODE/MASWE-0043/)
        *   [MASWE-0044: Dependencies with Known Vulnerabilities](../../MASWE/MASVS-CODE/MASWE-0044/)
        *   [MASWE-0045: Compiler-Provided Security Features Not Used](../../MASWE/MASVS-CODE/MASWE-0045/)
        *   [MASWE-0046: Use of Deprecated APIs or Functionality](../../MASWE/MASVS-CODE/MASWE-0046/)
        *   [MASWE-0047: Using Non-Standard APIs for Security-Critical Functionality](../../MASWE/MASVS-CODE/MASWE-0047/)
        *   [MASWE-0048: Malicious Code Included in the App](../../MASWE/MASVS-CODE/MASWE-0048/)
        *   [MASWE-0049: Unsafe Dynamic Code Loading](../../MASWE/MASVS-CODE/MASWE-0049/)
        *   [MASWE-0050: Unsafe Handling of Untrusted Data](../../MASWE/MASVS-CODE/MASWE-0050/)
        
    *    MASVS-RESILIENCE
        
        MASVS-RESILIENCE
        
        *   [MASWE-0051: Root/Jailbreak Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0051/)
        *   [MASWE-0052: App Virtualization Environment Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0052/)
        *   [MASWE-0053: Emulated or Virtual Device Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0053/)
        *   [MASWE-0054: Device Attestation Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0054/)
        *   [MASWE-0055: Malware Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0055/)
        *   [MASWE-0056: App Attestation Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0056/)
        *   [MASWE-0057: App Resources Integrity Not Verified](../../MASWE/MASVS-RESILIENCE/MASWE-0057/)
        *   [MASWE-0058: Runtime Code Integrity Not Verified](../../MASWE/MASVS-RESILIENCE/MASWE-0058/)
        *   [MASWE-0059: Code Obfuscation Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0059/)
        *   [MASWE-0060: Resource Obfuscation Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0060/)
        *   [MASWE-0061: Debug Artifacts Not Removed](../../MASWE/MASVS-RESILIENCE/MASWE-0061/)
        *   [MASWE-0062: No Application-Level Payload Encryption](../../MASWE/MASVS-RESILIENCE/MASWE-0062/)
        *   [MASWE-0063: Debug Mechanisms Not Disabled](../../MASWE/MASVS-RESILIENCE/MASWE-0063/)
        *   [MASWE-0064: Debugger Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0064/)
        *   [MASWE-0065: Dynamic Analysis Tools Detection Not Implemented](../../MASWE/MASVS-RESILIENCE/MASWE-0065/)
        
    *    MASVS-PRIVACY
        
        MASVS-PRIVACY
        
        *   [MASWE-0066: Inadequate Permission Management](../../MASWE/MASVS-PRIVACY/MASWE-0066/)
        *   [MASWE-0067: Lack of Anonymization or Pseudonymisation Measures](../../MASWE/MASVS-PRIVACY/MASWE-0067/)
        *   [MASWE-0068: Incorrect Use of Identifiers for User Tracking](../../MASWE/MASVS-PRIVACY/MASWE-0068/)
        *   [MASWE-0069: Usage of Non-Privacy-Preserving Functionality](../../MASWE/MASVS-PRIVACY/MASWE-0069/)
        *   [MASWE-0070: Inadequate Awareness for Privacy Relevant Actions](../../MASWE/MASVS-PRIVACY/MASWE-0070/)
        *   [MASWE-0071: Inadequate Defaults for Privacy Relevant Actions](../../MASWE/MASVS-PRIVACY/MASWE-0071/)
        *   [MASWE-0072: Inadequate Privacy Policy](../../MASWE/MASVS-PRIVACY/MASWE-0072/)
        *   [MASWE-0073: Inadequate Data Collection Declarations](../../MASWE/MASVS-PRIVACY/MASWE-0073/)
        *   [MASWE-0074: Inadequate Tracking Domains Declarations](../../MASWE/MASVS-PRIVACY/MASWE-0074/)
        *   [MASWE-0075: Non-Reproducible Builds](../../MASWE/MASVS-PRIVACY/MASWE-0075/)
        *   [MASWE-0076: Lack of Proper Data Management Controls](../../MASWE/MASVS-PRIVACY/MASWE-0076/)
        *   [MASWE-0077: Inadequate Data Visibility Controls](../../MASWE/MASVS-PRIVACY/MASWE-0077/)
        *   [MASWE-0078: Inadequate or Ambiguous User Consent Mechanisms](../../MASWE/MASVS-PRIVACY/MASWE-0078/)
        
    
*   [MASTG](../)
    
    MASTG
    
    *    Intro
        
        Intro
        
        *   [Foreword](../0x01-Foreword/)
        *   [Frontispiece](../0x02a-Frontispiece/)
        *    OWASP MASVS and MASTG Adoption [OWASP MASVS and MASTG Adoption](./)
            
            Table of contents
            
            *   [Mobile Platform Providers](#mobile-platform-providers)
                
                *   [Google Android](#google-android)
                
            *   [Certification Institutions](#certification-institutions)
                
                *   [CREST](#crest)
                
            *   [Standardization Institutions](#standardization-institutions)
                
                *   [NIST (National Institute of Standards and Technology, United States)](#nist-national-institute-of-standards-and-technology-united-states)
                *   [BSI (Bundesamt für Sicherheit in der Informationstechnik, Germany)](#bsi-bundesamt-fur-sicherheit-in-der-informationstechnik-germany)
                *   [ioXt](#ioxt)
                
            *   [Governmental Institutions](#governmental-institutions)
            *   [Educational Institutions](#educational-institutions)
            *   [Application in Scientific Research](#application-in-scientific-research)
            *   [Books](#books)
            *   [Industry Case Studies](#industry-case-studies)
            
        *   [Acknowledgments](../0x02c-Acknowledgements/)
        *   [Suggested Reading](../0x09-Suggested-Reading/)
        
    *    General Concepts
        
        General Concepts
        
        *   [Mobile Application Taxonomy](../0x04a-Mobile-App-Taxonomy/)
        *   [Mobile Application Security Testing](../0x04b-Mobile-App-Security-Testing/)
        *   [Mobile App Tampering and Reverse Engineering](../0x04c-Tampering-and-Reverse-Engineering/)
        *   [Mobile App Authentication Architectures](../0x04e-Testing-Authentication-and-Session-Management/)
        *   [Mobile App Network Communication](../0x04f-Testing-Network-Communication/)
        *   [Mobile App Cryptography](../0x04g-Testing-Cryptography/)
        *   [Mobile App Code Quality](../0x04h-Testing-Code-Quality/)
        *   [Mobile App User Privacy Protection](../0x04i-Testing-User-Privacy-Protection/)
        *   [MAS Testing Profiles](../0x03b-Testing-Profiles/)
        
    *    Android Security Testing
        
        Android Security Testing
        
        *   [Android Platform Overview](../0x05a-Platform-Overview/)
        *   [Android Security Testing](../0x05b-Android-Security-Testing/)
        *   [Android Data Storage](../0x05d-Testing-Data-Storage/)
        *   [Android Cryptographic APIs](../0x05e-Testing-Cryptography/)
        *   [Android Local Authentication](../0x05f-Testing-Local-Authentication/)
        *   [Android Network Communication](../0x05g-Testing-Network-Communication/)
        *   [Android Platform APIs](../0x05h-Testing-Platform-Interaction/)
        *   [Android Code Quality and Build Settings](../0x05i-Testing-Code-Quality-and-Build-Settings/)
        *   [Android Anti-Reversing Defenses](../0x05j-Testing-Resiliency-Against-Reverse-Engineering/)
        
    *    iOS Security Testing
        
        iOS Security Testing
        
        *   [iOS Platform Overview](../0x06a-Platform-Overview/)
        *   [iOS Security Testing](../0x06b-iOS-Security-Testing/)
        *   [iOS Data Storage](../0x06d-Testing-Data-Storage/)
        *   [iOS Cryptographic APIs](../0x06e-Testing-Cryptography/)
        *   [iOS Local Authentication](../0x06f-Testing-Local-Authentication/)
        *   [iOS Network Communication](../0x06g-Testing-Network-Communication/)
        *   [iOS Platform APIs](../0x06h-Testing-Platform-Interaction/)
        *   [iOS Code Quality and Build Settings](../0x06i-Testing-Code-Quality-and-Build-Settings/)
        *   [iOS Anti-Reversing Defenses](../0x06j-Testing-Resiliency-Against-Reverse-Engineering/)
        
    *   [Best Practices](../best-practices/)
        
        Best Practices
        
        *   [MASTG-BEST-0001: Use Secure Random Number Generator APIs](../best-practices/MASTG-BEST-0001/)
        *   [MASTG-BEST-0002: Remove Logging Code](../best-practices/MASTG-BEST-0002/)
        *   [MASTG-BEST-0003: Comply with Privacy Regulations and Best Practices](../best-practices/MASTG-BEST-0003/)
        *   [MASTG-BEST-0004: Exclude Sensitive Data from Backups](../best-practices/MASTG-BEST-0004/)
        *   [MASTG-BEST-0005: Use Secure Encryption Modes](../best-practices/MASTG-BEST-0005/)
        *   [MASTG-BEST-0006: Use Up-to-Date APK Signing Schemes](../best-practices/MASTG-BEST-0006/)
        *   [MASTG-BEST-0007: Debuggable Flag Disabled in the AndroidManifest](../best-practices/MASTG-BEST-0007/)
        *   [MASTG-BEST-0008: Debugging Disabled for WebViews](../best-practices/MASTG-BEST-0008/)
        *   [MASTG-BEST-0009: Use Secure Encryption Algorithms](../best-practices/MASTG-BEST-0009/)
        *   [MASTG-BEST-0010: Use Up-to-Date minSdkVersion](../best-practices/MASTG-BEST-0010/)
        *   [MASTG-BEST-0011: Securely Load File Content in a WebView](../best-practices/MASTG-BEST-0011/)
        *   [MASTG-BEST-0012: Disable JavaScript in WebViews](../best-practices/MASTG-BEST-0012/)
        *   [MASTG-BEST-0013: Disable Content Provider Access in WebViews](../best-practices/MASTG-BEST-0013/)
        *   [MASTG-BEST-0014: Preventing Screenshots and Screen Recording](../best-practices/MASTG-BEST-0014/)
        *   [MASTG-BEST-0015: Use \`setRecentsScreenshotEnabled\` to Prevent Screenshots When Backgrounded](../best-practices/MASTG-BEST-0015/)
        *   [MASTG-BEST-0016: Use \`SECURE\_FLAG\` to Prevent Screenshots and Screen Recording](../best-practices/MASTG-BEST-0016/)
        *   [MASTG-BEST-0017: Use \`setSecure\` to Prevent Screenshots in SurfaceViews](../best-practices/MASTG-BEST-0017/)
        *   [MASTG-BEST-0018: Use \`SecureFlagPolicy.SecureOn\` to Prevent Screenshots in Compose Components](../best-practices/MASTG-BEST-0018/)
        *   [MASTG-BEST-0019: Use Non-Caching Input Types for Sensitive Fields](../best-practices/MASTG-BEST-0019/)
        *   [MASTG-BEST-0020: Update the GMS Security Provider](../best-practices/MASTG-BEST-0020/)
        *   [MASTG-BEST-0021: Ensure Proper Error and Exception Handling](../best-practices/MASTG-BEST-0021/)
        *   [MASTG-BEST-0022: Disable Verbose and Debug Logging in Production Builds](../best-practices/MASTG-BEST-0022/)
        *   [MASTG-BEST-0023: Exclude Sensitive Information from Backups](../best-practices/MASTG-BEST-0023/)
        *   [MASTG-BEST-0024: Store Data Encrypted in App Sandbox Directory](../best-practices/MASTG-BEST-0024/)
        *   [MASTG-BEST-0025: Use Secure Random Number Generator APIs](../best-practices/MASTG-BEST-0025/)
        *   [MASTG-BEST-0026: Preventing Keyboard Caching for Sensitive Text Inputs](../best-practices/MASTG-BEST-0026/)
        *   [MASTG-BEST-0027: Preventing Sensitive Data Exposure in Notifications](../best-practices/MASTG-BEST-0027/)
        *   [MASTG-BEST-0028: WebViews Cache Cleanup](../best-practices/MASTG-BEST-0028/)
        *   [MASTG-BEST-0029: Implementing Resilience and RASP Signals](../best-practices/MASTG-BEST-0029/)
        *   [MASTG-BEST-0030: Implementing Root Detection](../best-practices/MASTG-BEST-0030/)
        *   [MASTG-BEST-0031: Enforce Strong Biometrics for Sensitive Operations](../best-practices/MASTG-BEST-0031/)
        *   [MASTG-BEST-0032: Migrate from UIWebView to WKWebView](../best-practices/MASTG-BEST-0032/)
        *   [MASTG-BEST-0033: Securely Load File Content in a WebView](../best-practices/MASTG-BEST-0033/)
        *   [MASTG-BEST-0034: Validate WebView Input](../best-practices/MASTG-BEST-0034/)
        *   [MASTG-BEST-0035: Prefer Origin Scoped Messaging Over Legacy JavaScript Bridges](../best-practices/MASTG-BEST-0035/)
        *   [MASTG-BEST-0036: Use Cryptographic Binding for Biometric Authentication](../best-practices/MASTG-BEST-0036/)
        *   [MASTG-BEST-0037: Invalidate Biometric Keys on Enrollment Changes](../best-practices/MASTG-BEST-0037/)
        *   [MASTG-BEST-0038: Require Explicit User Confirmation for Biometric Authentication](../best-practices/MASTG-BEST-0038/)
        *   [MASTG-BEST-0039: Prevent SQL Injection in ContentProviders](../best-practices/MASTG-BEST-0039/)
        *   [MASTG-BEST-0040: Preventing Overlay Attacks](../best-practices/MASTG-BEST-0040/)
        *   [MASTG-BEST-0041: Hardening Against Runtime Hooking](../best-practices/MASTG-BEST-0041/)
        *   [MASTG-BEST-0042: Use Strong TLS Settings in ATS Configuration](../best-practices/MASTG-BEST-0042/)
        *   [MASTG-BEST-0043: Enforce Strong TLS Settings When ATS Doesn't Apply](../best-practices/MASTG-BEST-0043/)
        *   [MASTG-BEST-0044: Mask Sensitive Data in Text Input Fields](../best-practices/MASTG-BEST-0044/)
        *   [MASTG-BEST-0045: Limit Sensitive Data Exposure Through iOS IPC Channels](../best-practices/MASTG-BEST-0045/)
        *   [MASTG-BEST-0046: Hardening Against Emulation](../best-practices/MASTG-BEST-0046/)
        *   [MASTG-BEST-0047: Continuous Anti-Debugging Checks](../best-practices/MASTG-BEST-0047/)
        *   [MASTG-BEST-0048: Hardening Against Reverse Engineering Tools](../best-practices/MASTG-BEST-0048/)
        *   [MASTG-BEST-0049: Restrict and Validate Access to Exported Content Providers](../best-practices/MASTG-BEST-0049/)
        *   [MASTG-BEST-0050: Store Data Encrypted in App Sandbox Directory](../best-practices/MASTG-BEST-0050/)
        *   [MASTG-BEST-0051: Minimize iOS Permissions and Entitlements](../best-practices/MASTG-BEST-0051/)
        *   [MASTG-BEST-0052: Restrict Access to Android App Components](../best-practices/MASTG-BEST-0052/)
        *   [MASTG-BEST-0053: Hardening Against Virtual Devices](../best-practices/MASTG-BEST-0053/)
        *   [MASTG-BEST-0054: Validate Input Parameters in Custom URL Scheme Handlers](../best-practices/MASTG-BEST-0054/)
        *   [MASTG-BEST-0055: Validate Source Application in Custom URL Scheme Handlers](../best-practices/MASTG-BEST-0055/)
        *   [MASTG-BEST-0056: Use Explicit Intents for Internal IPC](../best-practices/MASTG-BEST-0056/)
        *   [MASTG-BEST-0057: Sanitize Data Coming from External Components](../best-practices/MASTG-BEST-0057/)
        *   [MASTG-BEST-0058: Restrict Native Functionality Exposed Through WebView Bridges](../best-practices/MASTG-BEST-0058/)
        *   [MASTG-BEST-0059: Render Sensitive UI as Native Views Over the WebView](../best-practices/MASTG-BEST-0059/)
        *   [MASTG-BEST-0060: Use Native Views for Sensitive Text Entry Over a WebView](../best-practices/MASTG-BEST-0060/)
        *   [MASTG-BEST-0061: Use WKContentWorld Isolation for DOM Inspection Scripts](../best-practices/MASTG-BEST-0061/)
        *   [MASTG-BEST-0062: Use WKScriptMessageHandlerWithReply to Return Data to JavaScript](../best-practices/MASTG-BEST-0062/)
        *   [MASTG-BEST-0063: Use Immutable PendingIntents with Explicit Intents](../best-practices/MASTG-BEST-0063/)
        *   [MASTG-BEST-0064: Use Safe APIs for Object Deserialization](../best-practices/MASTG-BEST-0064/)
        *   [MASTG-BEST-0065: Implementing Storage Integrity Checks on iOS](../best-practices/MASTG-BEST-0065/)
        *   [MASTG-BEST-0066: Implementing Storage Integrity Checks on Android](../best-practices/MASTG-BEST-0066/)
        *   [MASTG-BEST-0067: Implementing Source Code Integrity Checks on iOS](../best-practices/MASTG-BEST-0067/)
        *   [MASTG-BEST-0068: Secure Data Sharing Between App Extensions and Containing Apps](../best-practices/MASTG-BEST-0068/)
        *   [MASTG-BEST-0069: Keep Sensitive Input on the System Keyboard](../best-practices/MASTG-BEST-0069/)
        *   [MASTG-BEST-0070: Verify Android App Links with autoVerify and Digital Asset Links](../best-practices/MASTG-BEST-0070/)
        *   [MASTG-BEST-0071: Validate Input Parameters in Deep Link and Custom URL Scheme Handlers](../best-practices/MASTG-BEST-0071/)
        *   [MASTG-BEST-0072: Validate Input Parameters in Universal Link Handlers](../best-practices/MASTG-BEST-0072/)
        *   [MASTG-BEST-0073: Properly Validate Server Trust in URLSessionDelegate and WKNavigationDelegate](../best-practices/MASTG-BEST-0073/)
        *   [MASTG-BEST-0074: Implementing Anti-Debugging Checks on iOS](../best-practices/MASTG-BEST-0074/)
        
    *   [Knowledge](../knowledge/)
        
        Knowledge
        
        *    Android
            
            Android
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-KNOW-0036: Shared Preferences](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0036/)
                *   [MASTG-KNOW-0037: SQLite Database](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0037/)
                *   [MASTG-KNOW-0038: SQLCipher Database](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0038/)
                *   [MASTG-KNOW-0039: Firebase Real-time Databases](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0039/)
                *   [MASTG-KNOW-0040: Realm Databases](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0040/)
                *   [MASTG-KNOW-0041: Internal Storage](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0041/)
                *   [MASTG-KNOW-0042: External Storage](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0042/)
                *   [MASTG-KNOW-0043: Android KeyStore](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0043/)
                *   [MASTG-KNOW-0044: Key Attestation](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0044/)
                *   [MASTG-KNOW-0045: Secure Key Import into Keystore](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0045/)
                *   [MASTG-KNOW-0046: BouncyCastle KeyStore](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0046/)
                *   [MASTG-KNOW-0047: Cryptographic Key Storage](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0047/)
                *   [MASTG-KNOW-0048: KeyChain](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0048/)
                *   [MASTG-KNOW-0049: Logs](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0049/)
                *   [MASTG-KNOW-0050: Backups](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0050/)
                *   [MASTG-KNOW-0051: Process Memory](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0051/)
                *   [MASTG-KNOW-0052: User Interface Components](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0052/)
                *   [MASTG-KNOW-0053: Screenshots](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0053/)
                *   [MASTG-KNOW-0054: App Notifications](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0054/)
                *   [MASTG-KNOW-0055: Keyboard Cache](../knowledge/android/MASVS-STORAGE/MASTG-KNOW-0055/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-KNOW-0011: Security Provider](../knowledge/android/MASVS-CRYPTO/MASTG-KNOW-0011/)
                *   [MASTG-KNOW-0012: Key Generation](../knowledge/android/MASVS-CRYPTO/MASTG-KNOW-0012/)
                *   [MASTG-KNOW-0013: Random Number Generation](../knowledge/android/MASVS-CRYPTO/MASTG-KNOW-0013/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-KNOW-0001: Biometric Authentication](../knowledge/android/MASVS-AUTH/MASTG-KNOW-0001/)
                *   [MASTG-KNOW-0002: FingerprintManager](../knowledge/android/MASVS-AUTH/MASTG-KNOW-0002/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-KNOW-0014: Android Network Security Configuration](../knowledge/android/MASVS-NETWORK/MASTG-KNOW-0014/)
                *   [MASTG-KNOW-0015: Certificate Pinning](../knowledge/android/MASVS-NETWORK/MASTG-KNOW-0015/)
                *   [MASTG-KNOW-0016: TBD](../knowledge/android/MASVS-NETWORK/MASTG-KNOW-0016/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-KNOW-0017: App Permissions](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0017/)
                *   [MASTG-KNOW-0018: WebViews](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0018/)
                *   [MASTG-KNOW-0019: Deep Links](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0019/)
                *   [MASTG-KNOW-0020: Inter-Process Communication (IPC) Mechanisms](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0020/)
                *   [MASTG-KNOW-0021: Object Serialization](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0021/)
                *   [MASTG-KNOW-0022: Overlay Attacks](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0022/)
                *   [MASTG-KNOW-0023: Enforced Updating](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0023/)
                *   [MASTG-KNOW-0024: Pending Intents](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0024/)
                *   [MASTG-KNOW-0025: Explicit vs Implicit Intents](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0025/)
                *   [MASTG-KNOW-0105: User-Initiated Screenshots and Screen Recording](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0105/)
                *   [MASTG-KNOW-0106: App-Initiated Screenshots and Screen Recording](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0106/)
                *   [MASTG-KNOW-0107: Screenshots and Screen Recording Detection](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0107/)
                *   [MASTG-KNOW-0132: Android Activities](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0132/)
                *   [MASTG-KNOW-0133: Android Services](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0133/)
                *   [MASTG-KNOW-0134: Android Broadcast Receivers](../knowledge/android/MASVS-PLATFORM/MASTG-KNOW-0134/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-KNOW-0004: Third-Party Libraries](../knowledge/android/MASVS-CODE/MASTG-KNOW-0004/)
                *   [MASTG-KNOW-0005: Memory Corruption Bugs](../knowledge/android/MASVS-CODE/MASTG-KNOW-0005/)
                *   [MASTG-KNOW-0006: Binary Protection Mechanisms](../knowledge/android/MASVS-CODE/MASTG-KNOW-0006/)
                *   [MASTG-KNOW-0008: Debugging Information and Debug Symbols](../knowledge/android/MASVS-CODE/MASTG-KNOW-0008/)
                *   [MASTG-KNOW-0009: StrictMode](../knowledge/android/MASVS-CODE/MASTG-KNOW-0009/)
                *   [MASTG-KNOW-0010: Exception Handling](../knowledge/android/MASVS-CODE/MASTG-KNOW-0010/)
                *   [MASTG-KNOW-0117: Android ContentProvider](../knowledge/android/MASVS-CODE/MASTG-KNOW-0117/)
                *   [MASTG-KNOW-0138: URI Schemes in Android Intent Results](../knowledge/android/MASVS-CODE/MASTG-KNOW-0138/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-KNOW-0003: App Signing](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0003/)
                *   [MASTG-KNOW-0007: Debuggable Apps](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0007/)
                *   [MASTG-KNOW-0027: Root Detection](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0027/)
                *   [MASTG-KNOW-0028: Anti-Debugging](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0028/)
                *   [MASTG-KNOW-0029: File Integrity Checks](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0029/)
                *   [MASTG-KNOW-0030: Reverse Engineering Tool Detection](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0030/)
                *   [MASTG-KNOW-0031: Emulator Detection](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0031/)
                *   [MASTG-KNOW-0032: Runtime Integrity Verification](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0032/)
                *   [MASTG-KNOW-0033: Obfuscation](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0033/)
                *   [MASTG-KNOW-0034: Device Binding](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0034/)
                *   [MASTG-KNOW-0035: Google Play Integrity API](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0035/)
                *   [MASTG-KNOW-0118: Runtime Application Self-Protection (RASP)](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0118/)
                *   [MASTG-KNOW-0119: Key Attestation](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0119/)
                *   [MASTG-KNOW-0120: Device Attestation](../knowledge/android/MASVS-RESILIENCE/MASTG-KNOW-0120/)
                
            *    MASVS-PRIVACY
                
                MASVS-PRIVACY
                
                *   [MASTG-KNOW-0026: Third-party Services Embedded in the App](../knowledge/android/MASVS-PRIVACY/MASTG-KNOW-0026/)
                
            
        *    iOS
            
            iOS
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-KNOW-0091: File System APIs](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0091/)
                *   [MASTG-KNOW-0092: Binary Data Storage](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0092/)
                *   [MASTG-KNOW-0093: UserDefaults](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0093/)
                *   [MASTG-KNOW-0094: CoreData](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0094/)
                *   [MASTG-KNOW-0095: Firebase Real-time Databases](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0095/)
                *   [MASTG-KNOW-0096: Realm Databases](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0096/)
                *   [MASTG-KNOW-0097: Other Third-Party Databases](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0097/)
                *   [MASTG-KNOW-0098: User Interface Components](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0098/)
                *   [MASTG-KNOW-0099: Screenshots](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0099/)
                *   [MASTG-KNOW-0100: Keyboard Cache](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0100/)
                *   [MASTG-KNOW-0101: Logs](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0101/)
                *   [MASTG-KNOW-0102: Backups](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0102/)
                *   [MASTG-KNOW-0103: Process Memory](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0103/)
                *   [MASTG-KNOW-0108: App Sandbox Directories](../knowledge/ios/MASVS-STORAGE/MASTG-KNOW-0108/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-KNOW-0066: CryptoKit](../knowledge/ios/MASVS-CRYPTO/MASTG-KNOW-0066/)
                *   [MASTG-KNOW-0067: CommonCrypto, SecKey and Wrapper libraries](../knowledge/ios/MASVS-CRYPTO/MASTG-KNOW-0067/)
                *   [MASTG-KNOW-0068: Cryptographic Third-Party libraries](../knowledge/ios/MASVS-CRYPTO/MASTG-KNOW-0068/)
                *   [MASTG-KNOW-0069: Key Management](../knowledge/ios/MASVS-CRYPTO/MASTG-KNOW-0069/)
                *   [MASTG-KNOW-0070: Random Number Generator](../knowledge/ios/MASVS-CRYPTO/MASTG-KNOW-0070/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-KNOW-0056: Local Authentication Framework](../knowledge/ios/MASVS-AUTH/MASTG-KNOW-0056/)
                *   [MASTG-KNOW-0057: Keychain Services](../knowledge/ios/MASVS-AUTH/MASTG-KNOW-0057/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-KNOW-0071: iOS App Transport Security](../knowledge/ios/MASVS-NETWORK/MASTG-KNOW-0071/)
                *   [MASTG-KNOW-0072: Server Trust Evaluation](../knowledge/ios/MASVS-NETWORK/MASTG-KNOW-0072/)
                *   [MASTG-KNOW-0073: iOS Network APIs](../knowledge/ios/MASVS-NETWORK/MASTG-KNOW-0073/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-KNOW-0074: Enforced Updating](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0074/)
                *   [MASTG-KNOW-0075: Object Serialization](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0075/)
                *   [MASTG-KNOW-0076: WebViews](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0076/)
                *   [MASTG-KNOW-0077: App Permissions](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0077/)
                *   [MASTG-KNOW-0078: Inter-Process Communication (IPC)](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0078/)
                *   [MASTG-KNOW-0079: Custom URL Schemes](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0079/)
                *   [MASTG-KNOW-0080: Universal Links](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0080/)
                *   [MASTG-KNOW-0081: UIActivity Sharing](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0081/)
                *   [MASTG-KNOW-0082: App Extensions](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0082/)
                *   [MASTG-KNOW-0083: Pasteboard](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0083/)
                *   [MASTG-KNOW-0104: Low-Level System IPC Mechanisms](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0104/)
                *   [MASTG-KNOW-0121: Text Input Field Masking in iOS](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0121/)
                *   [MASTG-KNOW-0122: Document Picker, Document Interaction, and Open in Place](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0122/)
                *   [MASTG-KNOW-0123: Handoff](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0123/)
                *   [MASTG-KNOW-0124: SiriKit and Siri Shortcuts](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0124/)
                *   [MASTG-KNOW-0125: App Groups](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0125/)
                *   [MASTG-KNOW-0126: Keychain Access Groups](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0126/)
                *   [MASTG-KNOW-0127: File Coordination APIs](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0127/)
                *   [MASTG-KNOW-0128: Bonjour](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0128/)
                *   [MASTG-KNOW-0129: App Intents and AI Agent Exposure](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0129/)
                *   [MASTG-KNOW-0130: Core Bluetooth](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0130/)
                *   [MASTG-KNOW-0131: Core NFC](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0131/)
                *   [MASTG-KNOW-0139: WKContentWorld](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0139/)
                *   [MASTG-KNOW-0141: Custom Keyboards](../knowledge/ios/MASVS-PLATFORM/MASTG-KNOW-0141/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-KNOW-0058: App Signing](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0058/)
                *   [MASTG-KNOW-0059: Third-Party Libraries](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0059/)
                *   [MASTG-KNOW-0060: Memory Corruption Bugs](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0060/)
                *   [MASTG-KNOW-0061: Binary Protection Mechanisms](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0061/)
                *   [MASTG-KNOW-0062: Debuggable Apps](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0062/)
                *   [MASTG-KNOW-0063: Debugging Information and Debug Symbols](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0063/)
                *   [MASTG-KNOW-0064: Non-Production Resources](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0064/)
                *   [MASTG-KNOW-0065: Exception Handling](../knowledge/ios/MASVS-CODE/MASTG-KNOW-0065/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-KNOW-0084: Jailbreak Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0084/)
                *   [MASTG-KNOW-0085: Anti-Debugging Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0085/)
                *   [MASTG-KNOW-0086: Storage Integrity Checks](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0086/)
                *   [MASTG-KNOW-0087: Reverse Engineering Tools Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0087/)
                *   [MASTG-KNOW-0088: iOS Simulator Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0088/)
                *   [MASTG-KNOW-0089: Obfuscation](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0089/)
                *   [MASTG-KNOW-0090: Device Binding](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0090/)
                *   [MASTG-KNOW-0135: Virtual Devices Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0135/)
                *   [MASTG-KNOW-0136: iOS Apps Running on macOS Detection](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0136/)
                *   [MASTG-KNOW-0140: Source Code Integrity Checks](../knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0140/)
                
            *   [MASVS-PRIVACY](../..)
            
        
    *   [Tests](../tests/)
        
        Tests
        
        *    Android
            
            Android
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-TEST-0001: Testing Local Storage for Sensitive Data](../tests/android/MASVS-STORAGE/MASTG-TEST-0001/)
                *   [MASTG-TEST-0003: Testing Logs for Sensitive Data](../tests/android/MASVS-STORAGE/MASTG-TEST-0003/)
                *   [MASTG-TEST-0004: Determining Whether Sensitive Data Is Shared with Third Parties via Embedded Services](../tests/android/MASVS-STORAGE/MASTG-TEST-0004/)
                *   [MASTG-TEST-0005: Determining Whether Sensitive Data Is Shared with Third Parties via Notifications](../tests/android/MASVS-STORAGE/MASTG-TEST-0005/)
                *   [MASTG-TEST-0006: Determining Whether the Keyboard Cache Is Disabled for Text Input Fields](../tests/android/MASVS-STORAGE/MASTG-TEST-0006/)
                *   [MASTG-TEST-0009: Testing Backups for Sensitive Data](../tests/android/MASVS-STORAGE/MASTG-TEST-0009/)
                *   [MASTG-TEST-0011: Testing Memory for Sensitive Data](../tests/android/MASVS-STORAGE/MASTG-TEST-0011/)
                *   [MASTG-TEST-0012: Testing the Device-Access-Security Policy](../tests/android/MASVS-STORAGE/MASTG-TEST-0012/)
                *   [MASTG-TEST-0200: Files Written to External Storage](../tests/android/MASVS-STORAGE/MASTG-TEST-0200/)
                *   [MASTG-TEST-0201: Runtime Use of APIs to Access External Storage](../tests/android/MASVS-STORAGE/MASTG-TEST-0201/)
                *   [MASTG-TEST-0202: References to APIs and Permissions for Accessing External Storage](../tests/android/MASVS-STORAGE/MASTG-TEST-0202/)
                *   [MASTG-TEST-0203: Runtime Use of Logging APIs](../tests/android/MASVS-STORAGE/MASTG-TEST-0203/)
                *   [MASTG-TEST-0207: Runtime Storage of Unencrypted Data in the App Sandbox](../tests/android/MASVS-STORAGE/MASTG-TEST-0207/)
                *   [MASTG-TEST-0216: Sensitive Data Not Excluded From Backup](../tests/android/MASVS-STORAGE/MASTG-TEST-0216/)
                *   [MASTG-TEST-0231: References to Logging APIs](../tests/android/MASVS-STORAGE/MASTG-TEST-0231/)
                *   [MASTG-TEST-0262: References to Backup Configurations Not Excluding Sensitive Data](../tests/android/MASVS-STORAGE/MASTG-TEST-0262/)
                *   [MASTG-TEST-0287: Runtime Storage of Unencrypted Data via the SharedPreferences API](../tests/android/MASVS-STORAGE/MASTG-TEST-0287/)
                *   [MASTG-TEST-0304: References to Sensitive Data Unencrypted via Android Room Database](../tests/android/MASVS-STORAGE/MASTG-TEST-0304/)
                *   [MASTG-TEST-0305: Sensitive Data Stored Unencrypted via DataStore](../tests/android/MASVS-STORAGE/MASTG-TEST-0305/)
                *   [MASTG-TEST-0306: References to Sensitive Data Stored Unencrypted via Android Room DB](../tests/android/MASVS-STORAGE/MASTG-TEST-0306/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-TEST-0013: Testing Symmetric Cryptography](../tests/android/MASVS-CRYPTO/MASTG-TEST-0013/)
                *   [MASTG-TEST-0014: Testing the Configuration of Cryptographic Standard Algorithms](../tests/android/MASVS-CRYPTO/MASTG-TEST-0014/)
                *   [MASTG-TEST-0015: Testing the Purposes of Keys](../tests/android/MASVS-CRYPTO/MASTG-TEST-0015/)
                *   [MASTG-TEST-0016: Testing Random Number Generation](../tests/android/MASVS-CRYPTO/MASTG-TEST-0016/)
                *   [MASTG-TEST-0204: Insecure Random API Usage](../tests/android/MASVS-CRYPTO/MASTG-TEST-0204/)
                *   [MASTG-TEST-0205: Non-random Sources Usage](../tests/android/MASVS-CRYPTO/MASTG-TEST-0205/)
                *   [MASTG-TEST-0208: Insufficient Key Sizes](../tests/android/MASVS-CRYPTO/MASTG-TEST-0208/)
                *   [MASTG-TEST-0212: Use of Hardcoded Cryptographic Keys in Code](../tests/android/MASVS-CRYPTO/MASTG-TEST-0212/)
                *   [MASTG-TEST-0221: Broken Symmetric Encryption Algorithms](../tests/android/MASVS-CRYPTO/MASTG-TEST-0221/)
                *   [MASTG-TEST-0232: Broken Symmetric Encryption Modes](../tests/android/MASVS-CRYPTO/MASTG-TEST-0232/)
                *   [MASTG-TEST-0307: References to Asymmetric Key Pairs Used For Multiple Purposes](../tests/android/MASVS-CRYPTO/MASTG-TEST-0307/)
                *   [MASTG-TEST-0308: Runtime Use of Asymmetric Key Pairs Used For Multiple Purposes](../tests/android/MASVS-CRYPTO/MASTG-TEST-0308/)
                *   [MASTG-TEST-0309: References to Reused Initialization Vectors in Symmetric Encryption](../tests/android/MASVS-CRYPTO/MASTG-TEST-0309/)
                *   [MASTG-TEST-0310: Runtime Use of Reused Initialization Vectors in Symmetric Encryption](../tests/android/MASVS-CRYPTO/MASTG-TEST-0310/)
                *   [MASTG-TEST-0312: References to Explicit Security Provider in Cryptographic APIs](../tests/android/MASVS-CRYPTO/MASTG-TEST-0312/)
                *   [MASTG-TEST-0350: Runtime Use of Broken Symmetric Encryption Modes](../tests/android/MASVS-CRYPTO/MASTG-TEST-0350/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-TEST-0017: Testing Confirm Credentials](../tests/android/MASVS-AUTH/MASTG-TEST-0017/)
                *   [MASTG-TEST-0018: Testing Biometric Authentication](../tests/android/MASVS-AUTH/MASTG-TEST-0018/)
                *   [MASTG-TEST-0326: References to APIs Allowing Fallback to Non-Biometric Authentication](../tests/android/MASVS-AUTH/MASTG-TEST-0326/)
                *   [MASTG-TEST-0327: References to APIs for Event-Bound Biometric Authentication](../tests/android/MASVS-AUTH/MASTG-TEST-0327/)
                *   [MASTG-TEST-0328: References to APIs Detecting Biometric Enrollment Changes](../tests/android/MASVS-AUTH/MASTG-TEST-0328/)
                *   [MASTG-TEST-0329: References to APIs Enforcing Authentication without Explicit User Action](../tests/android/MASVS-AUTH/MASTG-TEST-0329/)
                *   [MASTG-TEST-0330: References to APIs for Keys used in Biometric Authentication with Extended Validity Duration](../tests/android/MASVS-AUTH/MASTG-TEST-0330/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-TEST-0019: Testing Data Encryption on the Network](../tests/android/MASVS-NETWORK/MASTG-TEST-0019/)
                *   [MASTG-TEST-0020: Testing the TLS Settings](../tests/android/MASVS-NETWORK/MASTG-TEST-0020/)
                *   [MASTG-TEST-0021: Testing Endpoint Identify Verification](../tests/android/MASVS-NETWORK/MASTG-TEST-0021/)
                *   [MASTG-TEST-0022: Testing Custom Certificate Stores and Certificate Pinning](../tests/android/MASVS-NETWORK/MASTG-TEST-0022/)
                *   [MASTG-TEST-0023: Testing the Security Provider](../tests/android/MASVS-NETWORK/MASTG-TEST-0023/)
                *   [MASTG-TEST-0217: Insecure TLS Protocols Explicitly Allowed in Code](../tests/android/MASVS-NETWORK/MASTG-TEST-0217/)
                *   [MASTG-TEST-0218: Insecure TLS Protocols in Network Traffic](../tests/android/MASVS-NETWORK/MASTG-TEST-0218/)
                *   [MASTG-TEST-0233: Hardcoded HTTP URLs](../tests/android/MASVS-NETWORK/MASTG-TEST-0233/)
                *   [MASTG-TEST-0234: Missing Implementation of Server Hostname Verification with SSLSockets](../tests/android/MASVS-NETWORK/MASTG-TEST-0234/)
                *   [MASTG-TEST-0235: Android App Configurations Allowing Cleartext Traffic](../tests/android/MASVS-NETWORK/MASTG-TEST-0235/)
                *   [MASTG-TEST-0236: Cleartext Traffic Observed on the Network](../tests/android/MASVS-NETWORK/MASTG-TEST-0236/)
                *   [MASTG-TEST-0237: Cross-Platform Framework Configurations Allowing Cleartext Traffic](../tests/android/MASVS-NETWORK/MASTG-TEST-0237/)
                *   [MASTG-TEST-0238: Runtime Use of Network APIs Transmitting Cleartext Traffic](../tests/android/MASVS-NETWORK/MASTG-TEST-0238/)
                *   [MASTG-TEST-0239: Using low-level APIs (e.g. Socket) to set up a custom HTTP connection](../tests/android/MASVS-NETWORK/MASTG-TEST-0239/)
                *   [MASTG-TEST-0242: Missing Certificate Pinning in Network Security Configuration](../tests/android/MASVS-NETWORK/MASTG-TEST-0242/)
                *   [MASTG-TEST-0243: Expired Certificate Pins in the Network Security Configuration](../tests/android/MASVS-NETWORK/MASTG-TEST-0243/)
                *   [MASTG-TEST-0244: Missing Certificate Pinning in Network Traffic](../tests/android/MASVS-NETWORK/MASTG-TEST-0244/)
                *   [MASTG-TEST-0282: Unsafe Custom Trust Evaluation](../tests/android/MASVS-NETWORK/MASTG-TEST-0282/)
                *   [MASTG-TEST-0283: Incorrect Implementation of Server Hostname Verification](../tests/android/MASVS-NETWORK/MASTG-TEST-0283/)
                *   [MASTG-TEST-0284: Incorrect SSL Error Handling in WebViews](../tests/android/MASVS-NETWORK/MASTG-TEST-0284/)
                *   [MASTG-TEST-0285: Outdated Android Version Allowing Trust in User-Provided CAs](../tests/android/MASVS-NETWORK/MASTG-TEST-0285/)
                *   [MASTG-TEST-0286: Network Security Configuration Allowing Trust in User-Provided CAs](../tests/android/MASVS-NETWORK/MASTG-TEST-0286/)
                *   [MASTG-TEST-0295: GMS Security Provider Not Updated](../tests/android/MASVS-NETWORK/MASTG-TEST-0295/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-TEST-0007: Determining Whether Sensitive Stored Data Has Been Exposed via IPC Mechanisms](../tests/android/MASVS-PLATFORM/MASTG-TEST-0007/)
                *   [MASTG-TEST-0008: Checking for Sensitive Data Disclosure Through the User Interface](../tests/android/MASVS-PLATFORM/MASTG-TEST-0008/)
                *   [MASTG-TEST-0010: Finding Sensitive Information in Auto-Generated Screenshots](../tests/android/MASVS-PLATFORM/MASTG-TEST-0010/)
                *   [MASTG-TEST-0024: Testing for App Permissions](../tests/android/MASVS-PLATFORM/MASTG-TEST-0024/)
                *   [MASTG-TEST-0028: Testing Deep Links](../tests/android/MASVS-PLATFORM/MASTG-TEST-0028/)
                *   [MASTG-TEST-0029: Testing for Sensitive Functionality Exposure Through IPC](../tests/android/MASVS-PLATFORM/MASTG-TEST-0029/)
                *   [MASTG-TEST-0030: Testing for Vulnerable Implementation of PendingIntent](../tests/android/MASVS-PLATFORM/MASTG-TEST-0030/)
                *   [MASTG-TEST-0031: Testing JavaScript Execution in WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0031/)
                *   [MASTG-TEST-0032: Testing WebView Protocol Handlers](../tests/android/MASVS-PLATFORM/MASTG-TEST-0032/)
                *   [MASTG-TEST-0033: Testing for Java Objects Exposed Through WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0033/)
                *   [MASTG-TEST-0035: Testing for Overlay Attacks](../tests/android/MASVS-PLATFORM/MASTG-TEST-0035/)
                *   [MASTG-TEST-0037: Testing WebViews Cleanup](../tests/android/MASVS-PLATFORM/MASTG-TEST-0037/)
                *   [MASTG-TEST-0250: References to Content Provider Access in WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0250/)
                *   [MASTG-TEST-0251: Runtime Use of Content Provider Access APIs in WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0251/)
                *   [MASTG-TEST-0252: References to Local File Access in WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0252/)
                *   [MASTG-TEST-0253: Runtime Use of Local File Access APIs in WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0253/)
                *   [MASTG-TEST-0258: References to Keyboard Caching Attributes in UI Elements](../tests/android/MASVS-PLATFORM/MASTG-TEST-0258/)
                *   [MASTG-TEST-0289: Runtime Verification of Sensitive Content Exposure in Screenshots During App Backgrounding](../tests/android/MASVS-PLATFORM/MASTG-TEST-0289/)
                *   [MASTG-TEST-0291: References to Screen Capturing Prevention APIs](../tests/android/MASVS-PLATFORM/MASTG-TEST-0291/)
                *   [MASTG-TEST-0292: \`setRecentsScreenshotEnabled\` Not Used to Prevent Screenshots When Backgrounded](../tests/android/MASVS-PLATFORM/MASTG-TEST-0292/)
                *   [MASTG-TEST-0293: \`setSecure\` Not Used to Prevent Screenshots in SurfaceViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0293/)
                *   [MASTG-TEST-0294: \`SecureOn\` Not Used to Prevent Screenshots in Compose Dialogs](../tests/android/MASVS-PLATFORM/MASTG-TEST-0294/)
                *   [MASTG-TEST-0315: Sensitive Data Exposed via Notifications](../tests/android/MASVS-PLATFORM/MASTG-TEST-0315/)
                *   [MASTG-TEST-0316: App Exposing User Authentication Data in Text Input Fields](../tests/android/MASVS-PLATFORM/MASTG-TEST-0316/)
                *   [MASTG-TEST-0320: WebViews Not Cleaning Up Sensitive Data](../tests/android/MASVS-PLATFORM/MASTG-TEST-0320/)
                *   [MASTG-TEST-0334: Native Code Exposed Through WebViews](../tests/android/MASVS-PLATFORM/MASTG-TEST-0334/)
                *   [MASTG-TEST-0340: References to Overlay Attack Protections](../tests/android/MASVS-PLATFORM/MASTG-TEST-0340/)
                *   [MASTG-TEST-0355: References to Unauthorized Database Access through Content Providers](../tests/android/MASVS-PLATFORM/MASTG-TEST-0355/)
                *   [MASTG-TEST-0356: Runtime Verification of Unauthorized Database Access through Content Providers](../tests/android/MASVS-PLATFORM/MASTG-TEST-0356/)
                *   [MASTG-TEST-0357: References to Oversharing of File-Based Content Providers](../tests/android/MASVS-PLATFORM/MASTG-TEST-0357/)
                *   [MASTG-TEST-0364: Exported And Unprotected Activities That Expose Sensitive Functionality](../tests/android/MASVS-PLATFORM/MASTG-TEST-0364/)
                *   [MASTG-TEST-0365: Exported And Unprotected Services That Expose Sensitive Functionality](../tests/android/MASVS-PLATFORM/MASTG-TEST-0365/)
                *   [MASTG-TEST-0366: Exported And Unprotected Broadcast Receivers That Expose Sensitive Functionality](../tests/android/MASVS-PLATFORM/MASTG-TEST-0366/)
                *   [MASTG-TEST-0381: References to Insecure PendingIntent Creation](../tests/android/MASVS-PLATFORM/MASTG-TEST-0381/)
                *   [MASTG-TEST-0393: Use of Unverified App Links](../tests/android/MASVS-PLATFORM/MASTG-TEST-0393/)
                *   [MASTG-TEST-0394: Missing Input Validation in Custom URL Scheme Handlers](../tests/android/MASVS-PLATFORM/MASTG-TEST-0394/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-TEST-0002: Testing Local Storage for Input Validation](../tests/android/MASVS-CODE/MASTG-TEST-0002/)
                *   [MASTG-TEST-0025: Testing for Injection Flaws](../tests/android/MASVS-CODE/MASTG-TEST-0025/)
                *   [MASTG-TEST-0026: Testing Implicit Intents](../tests/android/MASVS-CODE/MASTG-TEST-0026/)
                *   [MASTG-TEST-0027: Testing for URL Loading in WebViews](../tests/android/MASVS-CODE/MASTG-TEST-0027/)
                *   [MASTG-TEST-0034: Testing Object Persistence](../tests/android/MASVS-CODE/MASTG-TEST-0034/)
                *   [MASTG-TEST-0036: Testing Enforced Updating](../tests/android/MASVS-CODE/MASTG-TEST-0036/)
                *   [MASTG-TEST-0042: Checking for Weaknesses in Third Party Libraries](../tests/android/MASVS-CODE/MASTG-TEST-0042/)
                *   [MASTG-TEST-0043: Memory Corruption Bugs](../tests/android/MASVS-CODE/MASTG-TEST-0043/)
                *   [MASTG-TEST-0044: Make Sure That Free Security Features Are Activated](../tests/android/MASVS-CODE/MASTG-TEST-0044/)
                *   [MASTG-TEST-0222: Position Independent Code (PIC) Not Enabled](../tests/android/MASVS-CODE/MASTG-TEST-0222/)
                *   [MASTG-TEST-0223: Stack Canaries Not Enabled](../tests/android/MASVS-CODE/MASTG-TEST-0223/)
                *   [MASTG-TEST-0245: References to Platform Version APIs](../tests/android/MASVS-CODE/MASTG-TEST-0245/)
                *   [MASTG-TEST-0272: Identify Dependencies with Known Vulnerabilities in the Android Project](../tests/android/MASVS-CODE/MASTG-TEST-0272/)
                *   [MASTG-TEST-0274: Dependencies with Known Vulnerabilities in the App's SBOM](../tests/android/MASVS-CODE/MASTG-TEST-0274/)
                *   [MASTG-TEST-0337: References to Object Deserialization of Untrusted Data](../tests/android/MASVS-CODE/MASTG-TEST-0337/)
                *   [MASTG-TEST-0339: SQL Injection in Content Providers](../tests/android/MASVS-CODE/MASTG-TEST-0339/)
                *   [MASTG-TEST-0372: Implicit Intents Used for Internal App Communication](../tests/android/MASVS-CODE/MASTG-TEST-0372/)
                *   [MASTG-TEST-0374: References to Implicit Intents Carrying Sensitive Extras](../tests/android/MASVS-CODE/MASTG-TEST-0374/)
                *   [MASTG-TEST-0375: Missing Validation of Data Returned from Implicit Intents](../tests/android/MASVS-CODE/MASTG-TEST-0375/)
                *   [MASTG-TEST-0382: Runtime Use of Enforced Updating APIs](../tests/android/MASVS-CODE/MASTG-TEST-0382/)
                *   [MASTG-TEST-0392: References to Enforced Updating APIs](../tests/android/MASVS-CODE/MASTG-TEST-0392/)
                *   [MASTG-TEST-0398: References to WebViewClient URL Loading Handlers](../tests/android/MASVS-CODE/MASTG-TEST-0398/)
                *   [MASTG-TEST-0399: SafeBrowsing Disabled](../tests/android/MASVS-CODE/MASTG-TEST-0399/)
                *   [MASTG-TEST-0400: Runtime Use of WebViewClient URL Loading Handlers](../tests/android/MASVS-CODE/MASTG-TEST-0400/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-TEST-0038: Making Sure that the App is Properly Signed](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0038/)
                *   [MASTG-TEST-0039: Testing whether the App is Debuggable](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0039/)
                *   [MASTG-TEST-0040: Testing for Debugging Symbols](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0040/)
                *   [MASTG-TEST-0041: Testing for Debugging Code and Verbose Error Logging](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0041/)
                *   [MASTG-TEST-0045: Testing Root Detection](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0045/)
                *   [MASTG-TEST-0046: Testing Anti-Debugging Detection](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0046/)
                *   [MASTG-TEST-0047: Testing File Integrity Checks](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0047/)
                *   [MASTG-TEST-0048: Testing Reverse Engineering Tools Detection](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0048/)
                *   [MASTG-TEST-0049: Testing Emulator Detection](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0049/)
                *   [MASTG-TEST-0050: Testing Runtime Integrity Checks](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0050/)
                *   [MASTG-TEST-0051: Testing Obfuscation](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0051/)
                *   [MASTG-TEST-0224: Usage of Insecure APK Signature Version](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0224/)
                *   [MASTG-TEST-0225: Usage of Insecure APK Signature Key Size](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0225/)
                *   [MASTG-TEST-0226: Debuggable Flag Enabled in the AndroidManifest](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0226/)
                *   [MASTG-TEST-0227: Debugging Enabled for WebViews](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0227/)
                *   [MASTG-TEST-0247: References to APIs for Detecting Secure Screen Lock](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0247/)
                *   [MASTG-TEST-0249: Runtime Use of Secure Screen Lock Detection APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0249/)
                *   [MASTG-TEST-0263: Logging of StrictMode Violations](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0263/)
                *   [MASTG-TEST-0264: Runtime Use of StrictMode APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0264/)
                *   [MASTG-TEST-0265: References to StrictMode APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0265/)
                *   [MASTG-TEST-0288: Debugging Symbols in Native Binaries](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0288/)
                *   [MASTG-TEST-0324: References to Root Detection Mechanisms](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0324/)
                *   [MASTG-TEST-0325: Runtime Use of Root Detection Techniques](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0325/)
                *   [MASTG-TEST-0338: References to Storage Integrity Check APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0338/)
                *   [MASTG-TEST-0341: Runtime Use of Hook Detection Techniques](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0341/)
                *   [MASTG-TEST-0351: Runtime Use of Emulator Detection Techniques](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0351/)
                *   [MASTG-TEST-0352: References to Debugging Detection APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0352/)
                *   [MASTG-TEST-0353: Runtime Use of Debugging Detection APIs](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0353/)
                *   [MASTG-TEST-0368: Insufficient Obfuscation of Security-Relevant Java/Kotlin Code](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0368/)
                *   [MASTG-TEST-0369: Insufficient Obfuscation of Security-Relevant Native Code](../tests/android/MASVS-RESILIENCE/MASTG-TEST-0369/)
                
            *    MASVS-PRIVACY
                
                MASVS-PRIVACY
                
                *   [MASTG-TEST-0206: Undeclared PII in Network Traffic Capture](../tests/android/MASVS-PRIVACY/MASTG-TEST-0206/)
                *   [MASTG-TEST-0254: Dangerous App Permissions](../tests/android/MASVS-PRIVACY/MASTG-TEST-0254/)
                *   [MASTG-TEST-0255: Permission Requests Not Minimized](../tests/android/MASVS-PRIVACY/MASTG-TEST-0255/)
                *   [MASTG-TEST-0256: Missing Permission Rationale](../tests/android/MASVS-PRIVACY/MASTG-TEST-0256/)
                *   [MASTG-TEST-0257: Not Resetting Unused Permissions](../tests/android/MASVS-PRIVACY/MASTG-TEST-0257/)
                *   [MASTG-TEST-0318: References to SDK APIs Known to Handle Sensitive User Data](../tests/android/MASVS-PRIVACY/MASTG-TEST-0318/)
                *   [MASTG-TEST-0319: Runtime Use of SDK APIs Known to Handle Sensitive User Data](../tests/android/MASVS-PRIVACY/MASTG-TEST-0319/)
                
            
        *    iOS
            
            iOS
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-TEST-0052: Testing Local Data Storage](../tests/ios/MASVS-STORAGE/MASTG-TEST-0052/)
                *   [MASTG-TEST-0053: Checking Logs for Sensitive Data](../tests/ios/MASVS-STORAGE/MASTG-TEST-0053/)
                *   [MASTG-TEST-0054: Determining Whether Sensitive Data Is Shared with Third Parties](../tests/ios/MASVS-STORAGE/MASTG-TEST-0054/)
                *   [MASTG-TEST-0055: Finding Sensitive Data in the Keyboard Cache](../tests/ios/MASVS-STORAGE/MASTG-TEST-0055/)
                *   [MASTG-TEST-0058: Testing Backups for Sensitive Data](../tests/ios/MASVS-STORAGE/MASTG-TEST-0058/)
                *   [MASTG-TEST-0060: Testing Memory for Sensitive Data](../tests/ios/MASVS-STORAGE/MASTG-TEST-0060/)
                *   [MASTG-TEST-0215: Sensitive Data Not Marked For Backup Exclusion](../tests/ios/MASVS-STORAGE/MASTG-TEST-0215/)
                *   [MASTG-TEST-0296: Sensitive Data Exposure in Logs](../tests/ios/MASVS-STORAGE/MASTG-TEST-0296/)
                *   [MASTG-TEST-0297: Sensitive Data Exposure Through Logging APIs](../tests/ios/MASVS-STORAGE/MASTG-TEST-0297/)
                *   [MASTG-TEST-0298: Runtime Monitoring of Files Eligible for Backup](../tests/ios/MASVS-STORAGE/MASTG-TEST-0298/)
                *   [MASTG-TEST-0299: Data Protection Classes for Files in Private Storage](../tests/ios/MASVS-STORAGE/MASTG-TEST-0299/)
                *   [MASTG-TEST-0300: References to APIs for Storing Unencrypted Data in Private Storage](../tests/ios/MASVS-STORAGE/MASTG-TEST-0300/)
                *   [MASTG-TEST-0301: Runtime Use of APIs for Storing Unencrypted Data in Private Storage](../tests/ios/MASVS-STORAGE/MASTG-TEST-0301/)
                *   [MASTG-TEST-0302: Sensitive Data Unencrypted in Private Storage Files](../tests/ios/MASVS-STORAGE/MASTG-TEST-0302/)
                *   [MASTG-TEST-0303: References to APIs for Storing Unencrypted Data in Shared Storage](../tests/ios/MASVS-STORAGE/MASTG-TEST-0303/)
                *   [MASTG-TEST-0313: References to APIs for Preventing Keyboard Caching of Text Fields](../tests/ios/MASVS-STORAGE/MASTG-TEST-0313/)
                *   [MASTG-TEST-0314: Runtime Monitoring of Text Fields Eligible for Keyboard Caching](../tests/ios/MASVS-STORAGE/MASTG-TEST-0314/)
                *   [MASTG-TEST-0388: References to Sensitive Data Stored Unprotected in Shared App Group Containers](../tests/ios/MASVS-STORAGE/MASTG-TEST-0388/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-TEST-0061: Verifying the Configuration of Cryptographic Standard Algorithms](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0061/)
                *   [MASTG-TEST-0062: Testing Key Management](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0062/)
                *   [MASTG-TEST-0063: Testing Random Number Generation](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0063/)
                *   [MASTG-TEST-0209: Insufficient Key Sizes](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0209/)
                *   [MASTG-TEST-0210: Broken Symmetric Encryption Algorithms](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0210/)
                *   [MASTG-TEST-0211: Broken Hashing Algorithms](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0211/)
                *   [MASTG-TEST-0213: Use of Hardcoded Cryptographic Keys in Code](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0213/)
                *   [MASTG-TEST-0214: Hardcoded Cryptographic Keys in Files](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0214/)
                *   [MASTG-TEST-0311: Insecure Random API Usage](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0311/)
                *   [MASTG-TEST-0317: Broken Symmetric Encryption Modes](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0317/)
                *   [MASTG-TEST-0349: Runtime Use of Insecure Random APIs](../tests/ios/MASVS-CRYPTO/MASTG-TEST-0349/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-TEST-0064: Testing Biometric Authentication](../tests/ios/MASVS-AUTH/MASTG-TEST-0064/)
                *   [MASTG-TEST-0266: References to APIs for Event-Bound Biometric Authentication](../tests/ios/MASVS-AUTH/MASTG-TEST-0266/)
                *   [MASTG-TEST-0267: Runtime Use Of Event-Bound Biometric Authentication](../tests/ios/MASVS-AUTH/MASTG-TEST-0267/)
                *   [MASTG-TEST-0268: References to APIs Allowing Fallback to Non-Biometric Authentication](../tests/ios/MASVS-AUTH/MASTG-TEST-0268/)
                *   [MASTG-TEST-0269: Runtime Use Of APIs Allowing Fallback to Non-Biometric Authentication](../tests/ios/MASVS-AUTH/MASTG-TEST-0269/)
                *   [MASTG-TEST-0270: References to APIs Detecting Biometric Enrollment Changes](../tests/ios/MASVS-AUTH/MASTG-TEST-0270/)
                *   [MASTG-TEST-0271: Runtime Use Of APIs Detecting Biometric Enrollment Changes](../tests/ios/MASVS-AUTH/MASTG-TEST-0271/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-TEST-0065: Testing Data Encryption on the Network](../tests/ios/MASVS-NETWORK/MASTG-TEST-0065/)
                *   [MASTG-TEST-0066: Testing the TLS Settings](../tests/ios/MASVS-NETWORK/MASTG-TEST-0066/)
                *   [MASTG-TEST-0067: Testing Endpoint Identity Verification](../tests/ios/MASVS-NETWORK/MASTG-TEST-0067/)
                *   [MASTG-TEST-0068: Testing Custom Certificate Stores and Certificate Pinning](../tests/ios/MASVS-NETWORK/MASTG-TEST-0068/)
                *   [MASTG-TEST-0321: Hardcoded HTTP URLs](../tests/ios/MASVS-NETWORK/MASTG-TEST-0321/)
                *   [MASTG-TEST-0322: App Transport Security Configurations Allowing Cleartext Traffic](../tests/ios/MASVS-NETWORK/MASTG-TEST-0322/)
                *   [MASTG-TEST-0323: Uses of Low-Level Networking APIs for Cleartext Traffic](../tests/ios/MASVS-NETWORK/MASTG-TEST-0323/)
                *   [MASTG-TEST-0342: References to Weak ATS TLS Policy Exceptions in Info.plist](../tests/ios/MASVS-NETWORK/MASTG-TEST-0342/)
                *   [MASTG-TEST-0343: URLSession TLS Protocol Configuration](../tests/ios/MASVS-NETWORK/MASTG-TEST-0343/)
                *   [MASTG-TEST-0344: Network.framework TLS Protocol Configuration](../tests/ios/MASVS-NETWORK/MASTG-TEST-0344/)
                *   [MASTG-TEST-0345: Embedded or Third-party TLS Stack Configuration](../tests/ios/MASVS-NETWORK/MASTG-TEST-0345/)
                *   [MASTG-TEST-0348: Insecure TLS Protocols in Network Traffic](../tests/ios/MASVS-NETWORK/MASTG-TEST-0348/)
                *   [MASTG-TEST-0385: Missing Certificate Pinning in ATS](../tests/ios/MASVS-NETWORK/MASTG-TEST-0385/)
                *   [MASTG-TEST-0396: References to URLSessionDelegate Bypassing Certificate Validation](../tests/ios/MASVS-NETWORK/MASTG-TEST-0396/)
                *   [MASTG-TEST-0397: References to WKNavigationDelegate Bypassing Certificate Validation](../tests/ios/MASVS-NETWORK/MASTG-TEST-0397/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-TEST-0056: Determining Whether Sensitive Data Is Exposed via IPC Mechanisms](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0056/)
                *   [MASTG-TEST-0057: Checking for Sensitive Data Disclosed Through the User Interface](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0057/)
                *   [MASTG-TEST-0059: Testing Auto-Generated Screenshots for Sensitive Information](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0059/)
                *   [MASTG-TEST-0069: Testing App Permissions](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0069/)
                *   [MASTG-TEST-0070: Testing Universal Links](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0070/)
                *   [MASTG-TEST-0071: Testing UIActivity Sharing](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0071/)
                *   [MASTG-TEST-0072: Testing App Extensions](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0072/)
                *   [MASTG-TEST-0073: Testing UIPasteboard](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0073/)
                *   [MASTG-TEST-0075: Testing Custom URL Schemes](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0075/)
                *   [MASTG-TEST-0076: Testing iOS WebViews](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0076/)
                *   [MASTG-TEST-0077: Testing WebView Protocol Handlers](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0077/)
                *   [MASTG-TEST-0078: Determining Whether Native Methods Are Exposed Through WebViews](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0078/)
                *   [MASTG-TEST-0276: Use of the iOS General Pasteboard](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0276/)
                *   [MASTG-TEST-0277: Sensitive Data in the iOS General Pasteboard at Runtime](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0277/)
                *   [MASTG-TEST-0278: Pasteboard Contents Not Cleared After Use](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0278/)
                *   [MASTG-TEST-0279: Pasteboard Contents Not Expiring](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0279/)
                *   [MASTG-TEST-0280: Pasteboard Contents Not Restricted to Local Device](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0280/)
                *   [MASTG-TEST-0290: Runtime Verification of Sensitive Content Exposure in Screenshots During App Backgrounding](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0290/)
                *   [MASTG-TEST-0331: Use of Deprecated WebView APIs](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0331/)
                *   [MASTG-TEST-0332: Attacker-Controlled URI in WebViews](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0332/)
                *   [MASTG-TEST-0333: Overly Broad File Read Access in WebViews](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0333/)
                *   [MASTG-TEST-0335: WebView File Origin Access Relaxed by Configuration](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0335/)
                *   [MASTG-TEST-0336: Runtime Setting of Relaxed WebView File Origin Policies](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0336/)
                *   [MASTG-TEST-0346: References to APIs Hiding Sensitive Data in Text Input Fields](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0346/)
                *   [MASTG-TEST-0347: Runtime Use of APIs Hiding Sensitive Data in Text Input Fields](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0347/)
                *   [MASTG-TEST-0370: Missing Input Validation in Custom URL Scheme Handlers](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0370/)
                *   [MASTG-TEST-0371: Missing Source Validation in Custom URL Scheme Handlers](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0371/)
                *   [MASTG-TEST-0376: References to Native Bridge APIs in WebViews](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0376/)
                *   [MASTG-TEST-0377: References to \`evaluateJavaScript\` Used as Bridge Reply in \`WKScriptMessageHandler\`](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0377/)
                *   [MASTG-TEST-0378: References to Password Fields in WebView-Loaded HTML](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0378/)
                *   [MASTG-TEST-0379: References to \`evaluateJavaScript\` Without Content World Isolation](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0379/)
                *   [MASTG-TEST-0380: References to \`evaluateJavaScript\` Writing Sensitive Data into WebView DOM](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0380/)
                *   [MASTG-TEST-0389: References to the App-Wide Restriction of Custom Keyboards](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0389/)
                *   [MASTG-TEST-0390: Full Access Requested by a Custom Keyboard Extension](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0390/)
                *   [MASTG-TEST-0395: Missing Input Validation in Universal Link Handlers](../tests/ios/MASVS-PLATFORM/MASTG-TEST-0395/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-TEST-0079: Testing Object Persistence](../tests/ios/MASVS-CODE/MASTG-TEST-0079/)
                *   [MASTG-TEST-0080: Testing Enforced Updating](../tests/ios/MASVS-CODE/MASTG-TEST-0080/)
                *   [MASTG-TEST-0085: Checking for Weaknesses in Third Party Libraries](../tests/ios/MASVS-CODE/MASTG-TEST-0085/)
                *   [MASTG-TEST-0086: Memory Corruption Bugs](../tests/ios/MASVS-CODE/MASTG-TEST-0086/)
                *   [MASTG-TEST-0087: Make Sure That Free Security Features Are Activated](../tests/ios/MASVS-CODE/MASTG-TEST-0087/)
                *   [MASTG-TEST-0228: Position Independent Code (PIC) not Enabled](../tests/ios/MASVS-CODE/MASTG-TEST-0228/)
                *   [MASTG-TEST-0229: Stack Canaries Not enabled](../tests/ios/MASVS-CODE/MASTG-TEST-0229/)
                *   [MASTG-TEST-0230: Automatic Reference Counting (ARC) not enabled](../tests/ios/MASVS-CODE/MASTG-TEST-0230/)
                *   [MASTG-TEST-0273: Identify Dependencies with Known Vulnerabilities by Scanning Dependency Managers Artifacts](../tests/ios/MASVS-CODE/MASTG-TEST-0273/)
                *   [MASTG-TEST-0275: Dependencies with Known Vulnerabilities in the App's SBOM](../tests/ios/MASVS-CODE/MASTG-TEST-0275/)
                *   [MASTG-TEST-0383: References to Enforced Updating APIs](../tests/ios/MASVS-CODE/MASTG-TEST-0383/)
                *   [MASTG-TEST-0384: Runtime Use of Enforced Updating APIs](../tests/ios/MASVS-CODE/MASTG-TEST-0384/)
                *   [MASTG-TEST-0386: References to Object Deserialization of Untrusted Data](../tests/ios/MASVS-CODE/MASTG-TEST-0386/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-TEST-0081: Making Sure that the App Is Properly Signed](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0081/)
                *   [MASTG-TEST-0082: Testing whether the App is Debuggable](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0082/)
                *   [MASTG-TEST-0083: Testing for Debugging Symbols](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0083/)
                *   [MASTG-TEST-0084: Testing for Debugging Code and Verbose Error Logging](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0084/)
                *   [MASTG-TEST-0088: Testing Jailbreak Detection](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0088/)
                *   [MASTG-TEST-0089: Testing Anti-Debugging Detection](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0089/)
                *   [MASTG-TEST-0090: Testing File Integrity Checks](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0090/)
                *   [MASTG-TEST-0091: Testing Reverse Engineering Tools Detection](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0091/)
                *   [MASTG-TEST-0092: Testing Emulator Detection](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0092/)
                *   [MASTG-TEST-0093: Testing Obfuscation](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0093/)
                *   [MASTG-TEST-0219: Testing for Debugging Symbols](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0219/)
                *   [MASTG-TEST-0220: Usage of Outdated Code Signature Format](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0220/)
                *   [MASTG-TEST-0240: Jailbreak Detection in Code](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0240/)
                *   [MASTG-TEST-0241: Runtime Use of Jailbreak Detection Techniques](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0241/)
                *   [MASTG-TEST-0246: Runtime Use of Secure Screen Lock Detection APIs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0246/)
                *   [MASTG-TEST-0248: References to APIs for Detecting Secure Screen Lock](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0248/)
                *   [MASTG-TEST-0261: Debuggable Entitlement Enabled in the entitlements.plist](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0261/)
                *   [MASTG-TEST-0354: Runtime Use of Hook Detection Techniques](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0354/)
                *   [MASTG-TEST-0358: Implementation Details Exposure Through Logging APIs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0358/)
                *   [MASTG-TEST-0359: Implementation Details Exposure in Logs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0359/)
                *   [MASTG-TEST-0367: Runtime Use of Virtual Device Detection Techniques](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0367/)
                *   [MASTG-TEST-0387: References to Storage Integrity Check APIs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0387/)
                *   [MASTG-TEST-0391: Insufficient Obfuscation of Security-Relevant Native Code](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0391/)
                *   [MASTG-TEST-0401: References to Debugging Detection APIs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0401/)
                *   [MASTG-TEST-0402: Runtime Use of Debugging Detection APIs](../tests/ios/MASVS-RESILIENCE/MASTG-TEST-0402/)
                
            *    MASVS-PRIVACY
                
                MASVS-PRIVACY
                
                *   [MASTG-TEST-0281: Undeclared Known Tracking Domains](../tests/ios/MASVS-PRIVACY/MASTG-TEST-0281/)
                *   [MASTG-TEST-0360: Purpose String Accuracy for Reachable Protected Resource Access](../tests/ios/MASVS-PRIVACY/MASTG-TEST-0360/)
                *   [MASTG-TEST-0361: Runtime Use of Protected Resource APIs Without Accurate Purpose Strings](../tests/ios/MASVS-PRIVACY/MASTG-TEST-0361/)
                *   [MASTG-TEST-0362: Entitlements for Unjustified Capability Exposure](../tests/ios/MASVS-PRIVACY/MASTG-TEST-0362/)
                *   [MASTG-TEST-0363: Runtime Use of Entitlement-Backed APIs for Unjustified Capability Exposure](../tests/ios/MASVS-PRIVACY/MASTG-TEST-0363/)
                
            
        
    *   [Demos](../demos/)
        
        Demos
        
        *    Android
            
            Android
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-DEMO-0001: File System Snapshots from External Storage](../demos/android/MASVS-STORAGE/MASTG-DEMO-0001/MASTG-DEMO-0001/)
                *   [MASTG-DEMO-0002: External Storage APIs Tracing with Frida](../demos/android/MASVS-STORAGE/MASTG-DEMO-0002/MASTG-DEMO-0002/)
                *   [MASTG-DEMO-0003: App Writing to External Storage without Scoped Storage Restrictions](../demos/android/MASVS-STORAGE/MASTG-DEMO-0003/MASTG-DEMO-0003/)
                *   [MASTG-DEMO-0004: App Writing to External Storage with Scoped Storage Restrictions](../demos/android/MASVS-STORAGE/MASTG-DEMO-0004/MASTG-DEMO-0004/)
                *   [MASTG-DEMO-0005: App Writing to External Storage via the MediaStore API](../demos/android/MASVS-STORAGE/MASTG-DEMO-0005/MASTG-DEMO-0005/)
                *   [MASTG-DEMO-0006: Tracing Common Logging APIs Looking for Secrets](../demos/android/MASVS-STORAGE/MASTG-DEMO-0006/MASTG-DEMO-0006/)
                *   [MASTG-DEMO-0010: File System Snapshots from Internal Storage](../demos/android/MASVS-STORAGE/MASTG-DEMO-0010/MASTG-DEMO-0010/)
                *   [MASTG-DEMO-0020: Data Exclusion using backup\_rules.xml with Backup Manager](../demos/android/MASVS-STORAGE/MASTG-DEMO-0020/MASTG-DEMO-0020/)
                *   [MASTG-DEMO-0034: Backup and Restore App Data with semgrep](../demos/android/MASVS-STORAGE/MASTG-DEMO-0034/MASTG-DEMO-0034/)
                *   [MASTG-DEMO-0035: Data Exclusion using backup\_rules.xml with adb backup](../demos/android/MASVS-STORAGE/MASTG-DEMO-0035/MASTG-DEMO-0035/)
                *   [MASTG-DEMO-0059: Using SharedPreferences to Write Sensitive Data Unencrypted to the App Sandbox](../demos/android/MASVS-STORAGE/MASTG-DEMO-0059/MASTG-DEMO-0059/)
                *   [MASTG-DEMO-0060: App Writing Sensitive Data to Sandbox using EncryptedSharedPreferences](../demos/android/MASVS-STORAGE/MASTG-DEMO-0060/MASTG-DEMO-0060/)
                *   [MASTG-DEMO-0064: Uses of Caching UI Elements with semgrep](../demos/android/MASVS-STORAGE/MASTG-DEMO-0064/MASTG-DEMO-0064/)
                *   [MASTG-DEMO-0068: Sensitive Data in Unencrypted SQLite](../demos/android/MASVS-STORAGE/MASTG-DEMO-0068/MASTG-DEMO-0068/)
                *   [MASTG-DEMO-0069: Sensitive Data Stored Unencrypted via DataStore](../demos/android/MASVS-STORAGE/MASTG-DEMO-0069/MASTG-DEMO-0069/)
                *   [MASTG-DEMO-0070: Sensitive Data Stored Unencrypted via Room Database](../demos/android/MASVS-STORAGE/MASTG-DEMO-0070/MASTG-DEMO-0070/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-DEMO-0007: Common Uses of Insecure Random APIs](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0007/MASTG-DEMO-0007/)
                *   [MASTG-DEMO-0008: Uses of Non-random Sources](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0008/MASTG-DEMO-0008/)
                *   [MASTG-DEMO-0012: Cryptographic Key Generation With Insufficient Key Length](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0012/MASTG-DEMO-0012/)
                *   [MASTG-DEMO-0017: Use of Hardcoded AES Key in SecretKeySpec with semgrep](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0017/MASTG-DEMO-0017/)
                *   [MASTG-DEMO-0022: Uses of Broken Symmetric Encryption Algorithms in Cipher with semgrep](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0022/MASTG-DEMO-0022/)
                *   [MASTG-DEMO-0023: Uses of Broken Encryption Modes in Cipher with semgrep](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0023/MASTG-DEMO-0023/)
                *   [MASTG-DEMO-0058: Using KeyGenParameterSpec with a Broken ECB Block Mode](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0058/MASTG-DEMO-0058/)
                *   [MASTG-DEMO-0071: References to Asymmetric Key Pairs Used For Multiple Purposes with Semgrep](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0071/MASTG-DEMO-0071/)
                *   [MASTG-DEMO-0072: Runtime Use of Asymmetric Key Pairs Used For Multiple Purposes With Frida](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0072/MASTG-DEMO-0072/)
                *   [MASTG-DEMO-0075: Uses of Explicit Security Providers in Cryptographic APIs with semgrep](../demos/android/MASVS-CRYPTO/MASTG-DEMO-0075/MASTG-DEMO-0075/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-DEMO-0089: Uses of BiometricPrompt with Device Credential Fallback with semgrep](../demos/android/MASVS-AUTH/MASTG-DEMO-0089/MASTG-DEMO-0089/)
                *   [MASTG-DEMO-0090: Uses of BiometricPrompt with Event-Bound Authentication with semgrep](../demos/android/MASVS-AUTH/MASTG-DEMO-0090/MASTG-DEMO-0090/)
                *   [MASTG-DEMO-0091: Uses of setInvalidatedByBiometricEnrollment with semgrep](../demos/android/MASVS-AUTH/MASTG-DEMO-0091/MASTG-DEMO-0091/)
                *   [MASTG-DEMO-0092: Uses of BiometricPrompt without Explicit User Confirmation with semgrep](../demos/android/MASVS-AUTH/MASTG-DEMO-0092/MASTG-DEMO-0092/)
                *   [MASTG-DEMO-0093: Uses of Extended Validity Duration in setUserAuthenticationParameters with semgrep](../demos/android/MASVS-AUTH/MASTG-DEMO-0093/MASTG-DEMO-0093/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-DEMO-0048: SSLSocket Connection to Wrong Host Server Allowed by Lack of HostnameVerifier](../demos/android/MASVS-NETWORK/MASTG-DEMO-0048/MASTG-DEMO-0048/)
                *   [MASTG-DEMO-0049: SSLSocket Connection to Wrong Host Server Blocked by HostnameVerifier](../demos/android/MASVS-NETWORK/MASTG-DEMO-0049/MASTG-DEMO-0049/)
                *   [MASTG-DEMO-0054: Use of a TrustManager that Does Not Validate Certificate Chains](../demos/android/MASVS-NETWORK/MASTG-DEMO-0054/MASTG-DEMO-0054/)
                *   [MASTG-DEMO-0055: Use of the HostnameVerifier that Allows Any Hostname](../demos/android/MASVS-NETWORK/MASTG-DEMO-0055/MASTG-DEMO-0055/)
                *   [MASTG-DEMO-0056: WebView Ignoring TLS Errors in onReceivedSslError](../demos/android/MASVS-NETWORK/MASTG-DEMO-0056/MASTG-DEMO-0056/)
                *   [MASTG-DEMO-0057: Network Security Configuration Allows User-Added Certificates](../demos/android/MASVS-NETWORK/MASTG-DEMO-0057/MASTG-DEMO-0057/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-DEMO-0029: Uses of WebViews Allowing Content Access with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0029/MASTG-DEMO-0029/)
                *   [MASTG-DEMO-0030: Uses of WebViews Allowing Content Access with Frida](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0030/MASTG-DEMO-0030/)
                *   [MASTG-DEMO-0031: Uses of WebViews Allowing Local File Access with Frida](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0031/MASTG-DEMO-0031/)
                *   [MASTG-DEMO-0032: Uses of WebViews Allowing Local File Access with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0032/MASTG-DEMO-0032/)
                *   [MASTG-DEMO-0040: Debuggable Flag Enabled in the AndroidManifest with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0040/MASTG-DEMO-0040/)
                *   [MASTG-DEMO-0061: Uses of FLAG\_SECURE with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0061/MASTG-DEMO-0061/)
                *   [MASTG-DEMO-0062: Enabling Screenshots in Recents via setRecentsScreenshotEnabled with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0062/MASTG-DEMO-0062/)
                *   [MASTG-DEMO-0063: Incorrectly Preventing Screenshots with SecureFlagPolicy in Compose Dialogs with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0063/MASTG-DEMO-0063/)
                *   [MASTG-DEMO-0078: App Leaking Sensitive Data via Notifications](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0078/MASTG-DEMO-0078/)
                *   [MASTG-DEMO-0079: App Exposing Access and Verification Codes in Text Input Fields](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0079/MASTG-DEMO-0079/)
                *   [MASTG-DEMO-0082: WebView WebStorage Cleanup](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0082/MASTG-DEMO-0082/)
                *   [MASTG-DEMO-0097: Sensitive Data and Functionality Exposed Through WebView JavaScript Bridges](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0097/MASTG-DEMO-0097/)
                *   [MASTG-DEMO-0103: Missing Overlay Protection on a Sensitive View](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0103/MASTG-DEMO-0103/)
                *   [MASTG-DEMO-0104: App Requesting SYSTEM\_ALERT\_WINDOW Permission](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0104/MASTG-DEMO-0104/)
                *   [MASTG-DEMO-0105: Activity-Level Overlay Protection Using setHideOverlayWindows](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0105/MASTG-DEMO-0105/)
                *   [MASTG-DEMO-0120: Uses of Unauthorized Access to Exported Content Providers](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0120/MASTG-DEMO-0120/)
                *   [MASTG-DEMO-0121: Unauthorized Access to Database Records through Exported Content Provider](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0121/MASTG-DEMO-0121/)
                *   [MASTG-DEMO-0122: Oversharing via FileProvider with Unrestricted Path Configuration](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0122/MASTG-DEMO-0122/)
                *   [MASTG-DEMO-0123: Exfiltration of Private Files via FileProvider URI Grant Oversharing](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0123/MASTG-DEMO-0123/)
                *   [MASTG-DEMO-0128: Sensitive Data Exposed Through an Unprotected Activity](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0128/MASTG-DEMO-0128/)
                *   [MASTG-DEMO-0129: Sensitive Action Exposed Through an Unprotected Service](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0129/MASTG-DEMO-0129/)
                *   [MASTG-DEMO-0130: Sensitive Action Exposed Through an Unprotected Manifest-Declared Broadcast Receiver](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0130/MASTG-DEMO-0130/)
                *   [MASTG-DEMO-0147: Uses of Insecure PendingIntent](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0147/MASTG-DEMO-0147/)
                *   [MASTG-DEMO-0151: Deep Link Intent Filter Missing android:autoVerify with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0151/MASTG-DEMO-0151/)
                *   [MASTG-DEMO-0152: Custom URL Scheme Handler Without Input Validation with semgrep](../demos/android/MASVS-PLATFORM/MASTG-DEMO-0152/MASTG-DEMO-0152/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-DEMO-0025: Uses of Build.VERSION.SDK\_INT with semgrep](../demos/android/MASVS-CODE/MASTG-DEMO-0025/MASTG-DEMO-0025/)
                *   [MASTG-DEMO-0050: Identifying Insecure Dependencies in Android Studio](../demos/android/MASVS-CODE/MASTG-DEMO-0050/MASTG-DEMO-0050/)
                *   [MASTG-DEMO-0051: Identifying Insecure Dependencies through SBOM Creation](../demos/android/MASVS-CODE/MASTG-DEMO-0051/MASTG-DEMO-0051/)
                *   [MASTG-DEMO-0100: Object Deserialization Using Serializable with semgrep](../demos/android/MASVS-CODE/MASTG-DEMO-0100/MASTG-DEMO-0100/)
                *   [MASTG-DEMO-0102: SQL Injection via URI Path and Selection in Android Content Providers](../demos/android/MASVS-CODE/MASTG-DEMO-0102/MASTG-DEMO-0102/)
                *   [MASTG-DEMO-0136: Internal Activity Communication via Implicit Intent](../demos/android/MASVS-CODE/MASTG-DEMO-0136/MASTG-DEMO-0136/)
                *   [MASTG-DEMO-0138: Leaking Sensitive Information via Implicit Intents](../demos/android/MASVS-CODE/MASTG-DEMO-0138/MASTG-DEMO-0138/)
                *   [MASTG-DEMO-0139: Path Traversal via Malicious ContentProvider Filename](../demos/android/MASVS-CODE/MASTG-DEMO-0139/MASTG-DEMO-0139/)
                *   [MASTG-DEMO-0140: Attacker App Registering for Internal Implicit Intent](../demos/android/MASVS-CODE/MASTG-DEMO-0140/MASTG-DEMO-0140/)
                *   [MASTG-DEMO-0141: Attacker App Returning Malicious ContentProvider Filename](../demos/android/MASVS-CODE/MASTG-DEMO-0141/MASTG-DEMO-0141/)
                *   [MASTG-DEMO-0156: SafeBrowsing Disabled Detection with semgrep](../demos/android/MASVS-CODE/MASTG-DEMO-0156/MASTG-DEMO-0156/)
                *   [MASTG-DEMO-0157: Uses of WebViewClient URL Loading Handlers with semgrep](../demos/android/MASVS-CODE/MASTG-DEMO-0157/MASTG-DEMO-0157/)
                *   [MASTG-DEMO-0158: Runtime Use of WebViewClient URL Loading Handlers with Frida](../demos/android/MASVS-CODE/MASTG-DEMO-0158/MASTG-DEMO-0158/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-DEMO-0027: Runtime Use of KeyguardManager.isDeviceSecure and BiometricManager.canAuthenticate APIs with Frida](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0027/MASTG-DEMO-0027/)
                *   [MASTG-DEMO-0028: Uses of KeyguardManager.isDeviceSecure and BiometricManager.canAuthenticate with semgrep](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0028/MASTG-DEMO-0028/)
                *   [MASTG-DEMO-0037: App Leaking Information about Unclosed SQL Cursor via StrictMode](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0037/MASTG-DEMO-0037/)
                *   [MASTG-DEMO-0038: Detecting StrictMode Uses with Frida](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0038/MASTG-DEMO-0038/)
                *   [MASTG-DEMO-0039: Detecting StrictMode PenaltyLog Usage with Semgrep](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0039/MASTG-DEMO-0039/)
                *   [MASTG-DEMO-0087: Uses of Root Detection Techniques with Semgrep](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0087/MASTG-DEMO-0087/)
                *   [MASTG-DEMO-0088: Runtime Detection of Root Detection Mechanisms](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0088/MASTG-DEMO-0088/)
                *   [MASTG-DEMO-0101: References to Storage Integrity Check APIs with semgrep](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0101/MASTG-DEMO-0101/)
                *   [MASTG-DEMO-0106: Extracting Sensitive Data from Cipher.doFinal via Frida Hooking](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0106/MASTG-DEMO-0106/)
                *   [MASTG-DEMO-0107: Detecting Frida hooks and terminating the application on response](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0107/MASTG-DEMO-0107/)
                *   [MASTG-DEMO-0108: Bypassing Frida Detection in /proc/self/maps to Extract Sensitive Data](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0108/MASTG-DEMO-0108/)
                *   [MASTG-DEMO-0114: Detecting Emulator Detection Checks with Frida](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0114/MASTG-DEMO-0114/)
                *   [MASTG-DEMO-0115: JDWP Debugging Checks in App Code](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0115/MASTG-DEMO-0115/)
                *   [MASTG-DEMO-0116: Native Anti-Debugging Checks with TracerPid and ptrace](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0116/MASTG-DEMO-0116/)
                *   [MASTG-DEMO-0132: Root Detection Logic in Java/Kotlin Layer Only Protected by Identifier Renaming](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0132/MASTG-DEMO-0132/)
                *   [MASTG-DEMO-0133: Root Detection Logic in Native Layer with Insufficient Obfuscation](../demos/android/MASVS-RESILIENCE/MASTG-DEMO-0133/MASTG-DEMO-0133/)
                
            *    MASVS-PRIVACY
                
                MASVS-PRIVACY
                
                *   [MASTG-DEMO-0009: Detecting Undeclared PII in Network Traffic](../demos/android/MASVS-PRIVACY/MASTG-DEMO-0009/MASTG-DEMO-0009/)
                *   [MASTG-DEMO-0033: Dangerous Permissions in the AndroidManifest with semgrep](../demos/android/MASVS-PRIVACY/MASTG-DEMO-0033/MASTG-DEMO-0033/)
                *   [MASTG-DEMO-0081: Sensitive User Data Sent to Firebase Analytics with Frida](../demos/android/MASVS-PRIVACY/MASTG-DEMO-0081/MASTG-DEMO-0081/)
                
            
        *    iOS
            
            iOS
            
            *    MASVS-STORAGE
                
                MASVS-STORAGE
                
                *   [MASTG-DEMO-0019: Uses of isExcludedFromBackupKey with r2](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0019/MASTG-DEMO-0019/)
                *   [MASTG-DEMO-0065: Uses of Logging APIs with r2](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0065/MASTG-DEMO-0065/)
                *   [MASTG-DEMO-0066: Sensitive Data Logging with idevicesyslog](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0066/MASTG-DEMO-0066/)
                *   [MASTG-DEMO-0067: Runtime Tracking of Files Eligible for Backup with Frida](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0067/MASTG-DEMO-0067/)
                *   [MASTG-DEMO-0076: Keyboard Caching Not Prevented for Sensitive Data with r2](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0076/MASTG-DEMO-0076/)
                *   [MASTG-DEMO-0077: Runtime Monitoring of Text Fields Eligible for Keyboard Caching with Frida](../demos/ios/MASVS-STORAGE/MASTG-DEMO-0077/MASTG-DEMO-0077/)
                
            *    MASVS-CRYPTO
                
                MASVS-CRYPTO
                
                *   [MASTG-DEMO-0011: Uses of Insufficient Key Size in SecKeyCreateRandomKey with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0011/MASTG-DEMO-0011/)
                *   [MASTG-DEMO-0013: Use of Hardcoded RSA Private Key in SecKeyCreateWithData with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0013/MASTG-DEMO-0013/)
                *   [MASTG-DEMO-0014: Use of Hardcoded ECDSA Private Key in CryptoKit with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0014/MASTG-DEMO-0014/)
                *   [MASTG-DEMO-0015: Uses of Broken Hashing Algorithms in CommonCrypto with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0015/MASTG-DEMO-0015/)
                *   [MASTG-DEMO-0016: Uses of Broken Hashing Algorithms in CryptoKit with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0016/MASTG-DEMO-0016/)
                *   [MASTG-DEMO-0018: Uses of Broken Encryption Algorithms in CommonCrypto with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0018/MASTG-DEMO-0018/)
                *   [MASTG-DEMO-0073: Uses of Insecure Random Number Generation with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0073/MASTG-DEMO-0073/)
                *   [MASTG-DEMO-0074: Uses of Insecure Random Number Generation with frida-trace](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0074/MASTG-DEMO-0074/)
                *   [MASTG-DEMO-0080: Uses of Broken Encryption Modes in CommonCrypto with r2](../demos/ios/MASVS-CRYPTO/MASTG-DEMO-0080/MASTG-DEMO-0080/)
                
            *    MASVS-AUTH
                
                MASVS-AUTH
                
                *   [MASTG-DEMO-0041: Uses of LAContext.evaluatePolicy with r2](../demos/ios/MASVS-AUTH/MASTG-DEMO-0041/MASTG-DEMO-0041/)
                *   [MASTG-DEMO-0042: Runtime Use of LAContext.evaluatePolicy with Frida](../demos/ios/MASVS-AUTH/MASTG-DEMO-0042/MASTG-DEMO-0042/)
                *   [MASTG-DEMO-0043: Uses of kSecAccessControlUserPresence with r2](../demos/ios/MASVS-AUTH/MASTG-DEMO-0043/MASTG-DEMO-0043/)
                *   [MASTG-DEMO-0044: Runtime Use of kSecAccessControlUserPresence with Frida](../demos/ios/MASVS-AUTH/MASTG-DEMO-0044/MASTG-DEMO-0044/)
                *   [MASTG-DEMO-0045: Uses of kSecAccessControlBiometryCurrentSet with r2](../demos/ios/MASVS-AUTH/MASTG-DEMO-0045/MASTG-DEMO-0045/)
                *   [MASTG-DEMO-0046: Runtime Use of kSecAccessControlBiometryCurrentSet with Frida](../demos/ios/MASVS-AUTH/MASTG-DEMO-0046/MASTG-DEMO-0046/)
                *   [MASTG-DEMO-0047: Runtime Use of the Keychain Not Requiring User Presence with Frida](../demos/ios/MASVS-AUTH/MASTG-DEMO-0047/MASTG-DEMO-0047/)
                
            *    MASVS-NETWORK
                
                MASVS-NETWORK
                
                *   [MASTG-DEMO-0083: Insecure ATS Configuration Allowing Cleartext Traffic](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0083/MASTG-DEMO-0083/)
                *   [MASTG-DEMO-0084: Hardcoded HTTP URLs in iOS Binary](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0084/MASTG-DEMO-0084/)
                *   [MASTG-DEMO-0085: Uses of Network Framework Bypassing ATS](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0085/MASTG-DEMO-0085/)
                *   [MASTG-DEMO-0086: Uses of BSD Sockets Bypassing ATS](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0086/MASTG-DEMO-0086/)
                *   [MASTG-DEMO-0109: ATS TLS Policy Exceptions in Info.plist](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0109/MASTG-DEMO-0109/)
                *   [MASTG-DEMO-0110: URLSession Minimum TLS Version Lowered in Code](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0110/MASTG-DEMO-0110/)
                *   [MASTG-DEMO-0111: Network.framework TLS Minimum Version Lowered via sec\_protocol\_options](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0111/MASTG-DEMO-0111/)
                *   [MASTG-DEMO-0148: Missing Certificate Pinning in ATS](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0148/MASTG-DEMO-0148/)
                *   [MASTG-DEMO-0154: URLSessionDelegate Accepting Any Server Certificate](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0154/MASTG-DEMO-0154/)
                *   [MASTG-DEMO-0155: WKNavigationDelegate Accepting Any Server Certificate](../demos/ios/MASVS-NETWORK/MASTG-DEMO-0155/MASTG-DEMO-0155/)
                
            *    MASVS-PLATFORM
                
                MASVS-PLATFORM
                
                *   [MASTG-DEMO-0094: Use of the Deprecated UIWebView](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0094/MASTG-DEMO-0094/)
                *   [MASTG-DEMO-0095: Attacker-Controlled Input in a WebView Leading to Unintended Navigation](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0095/MASTG-DEMO-0095/)
                *   [MASTG-DEMO-0096: HTML Injection in a Local WebView Leading to Local File Access](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0096/MASTG-DEMO-0096/)
                *   [MASTG-DEMO-0098: References to File Access in WebViews with radare2](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0098/MASTG-DEMO-0098/)
                *   [MASTG-DEMO-0099: Runtime Monitoring of WebView File Access with Frida](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0099/MASTG-DEMO-0099/)
                *   [MASTG-DEMO-0112: Text Input Fields Not Hiding Sensitive Data](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0112/MASTG-DEMO-0112/)
                *   [MASTG-DEMO-0113: Runtime Monitoring of Text Input Fields Not Hiding Sensitive Data](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0113/MASTG-DEMO-0113/)
                *   [MASTG-DEMO-0134: Custom URL Scheme Handler Without Input Validation](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0134/MASTG-DEMO-0134/)
                *   [MASTG-DEMO-0135: Custom URL Scheme Handler with Source Validation](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0135/MASTG-DEMO-0135/)
                *   [MASTG-DEMO-0142: Sensitive Data and Functionality Exposed Through a WKWebView Native Bridge](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0142/MASTG-DEMO-0142/)
                *   [MASTG-DEMO-0143: Sensitive Data Returned to Page JavaScript via evaluateJavaScript in a WKScriptMessageHandler](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0143/MASTG-DEMO-0143/)
                *   [MASTG-DEMO-0144: Password Field Rendered in WebView DOM Without Native Overlay](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0144/MASTG-DEMO-0144/)
                *   [MASTG-DEMO-0145: DOM Inspection Using evaluateJavaScript Without Content World Isolation](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0145/MASTG-DEMO-0145/)
                *   [MASTG-DEMO-0146: Sensitive Data Written into WebView DOM via evaluateJavaScript](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0146/MASTG-DEMO-0146/)
                *   [MASTG-DEMO-0153: Universal Link Handler Without Input Validation](../demos/ios/MASVS-PLATFORM/MASTG-DEMO-0153/MASTG-DEMO-0153/)
                
            *    MASVS-CODE
                
                MASVS-CODE
                
                *   [MASTG-DEMO-0052: Scanning Package Manager Artifacts for Insecure iOS Dependencies](../demos/ios/MASVS-CODE/MASTG-DEMO-0052/MASTG-DEMO-0052/)
                *   [MASTG-DEMO-0053: Identifying Insecure Dependencies in SwiftPM through SBOM creation](../demos/ios/MASVS-CODE/MASTG-DEMO-0053/MASTG-DEMO-0053/)
                *   [MASTG-DEMO-0149: References to Object Deserialization of a URL Scheme Payload with r2](../demos/ios/MASVS-CODE/MASTG-DEMO-0149/MASTG-DEMO-0149/)
                
            *    MASVS-RESILIENCE
                
                MASVS-RESILIENCE
                
                *   [MASTG-DEMO-0021: Uses of Jailbreak Detection Techniques with r2](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0021/MASTG-DEMO-0021/)
                *   [MASTG-DEMO-0024: Uses of LAContext.canEvaluatePolicy with r2](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0024/MASTG-DEMO-0024/)
                *   [MASTG-DEMO-0026: Runtime Use of LAContext.canEvaluatePolicy with Frida](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0026/MASTG-DEMO-0026/)
                *   [MASTG-DEMO-0036: Debuggable Entitlement Enabled in the entitlements.plist with rabin2](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0036/MASTG-DEMO-0036/)
                *   [MASTG-DEMO-0117: Extracting Sensitive Data from CCCrypt via Frida Hooking](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0117/MASTG-DEMO-0117/)
                *   [MASTG-DEMO-0118: Detecting Frida Hooks Before Sensitive Cryptographic Operations](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0118/MASTG-DEMO-0118/)
                *   [MASTG-DEMO-0119: Bypassing Frida D-Bus Port Detection to Extract Sensitive Data](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0119/MASTG-DEMO-0119/)
                *   [MASTG-DEMO-0124: Logging APIs Exposing Implementation Details with r2](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0124/MASTG-DEMO-0124/)
                *   [MASTG-DEMO-0125: Implementation Details Exposed in App Logs](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0125/MASTG-DEMO-0125/)
                *   [MASTG-DEMO-0131: Detecting Virtual Device Detection Checks with Frida](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0131/MASTG-DEMO-0131/)
                *   [MASTG-DEMO-0150: References to Storage Integrity Check APIs with radare2](../demos/ios/MASVS-RESILIENCE/MASTG-DEMO-0150/MASTG-DEMO-0150/)
                
            
        
    *   [Techniques](../techniques/)
        
        Techniques
        
        *    Generic
            
            Generic
            
            *   [MASTG-TECH-0047: Reverse Engineering](../techniques/generic/MASTG-TECH-0047/)
            *   [MASTG-TECH-0048: Static Analysis](../techniques/generic/MASTG-TECH-0048/)
            *   [MASTG-TECH-0049: Dynamic Analysis](../techniques/generic/MASTG-TECH-0049/)
            *   [MASTG-TECH-0050: Binary Analysis](../techniques/generic/MASTG-TECH-0050/)
            *   [MASTG-TECH-0051: Tampering and Runtime Instrumentation](../techniques/generic/MASTG-TECH-0051/)
            *   [MASTG-TECH-0071: Retrieving Strings](../techniques/generic/MASTG-TECH-0071/)
            *   [MASTG-TECH-0119: Intercepting HTTP Traffic by Hooking Network APIs at the Application Layer](../techniques/generic/MASTG-TECH-0119/)
            *   [MASTG-TECH-0120: Intercepting HTTP Traffic Using an Interception Proxy](../techniques/generic/MASTG-TECH-0120/)
            *   [MASTG-TECH-0121: Intercepting Non-HTTP Traffic Using an Interception Proxy](../techniques/generic/MASTG-TECH-0121/)
            *   [MASTG-TECH-0122: Passive Eavesdropping](../techniques/generic/MASTG-TECH-0122/)
            *   [MASTG-TECH-0123: Achieving a MITM Position via ARP Spoofing](../techniques/generic/MASTG-TECH-0123/)
            *   [MASTG-TECH-0124: Achieving a MITM Position Using a Rogue Access Point](../techniques/generic/MASTG-TECH-0124/)
            *   [MASTG-TECH-0125: Intercepting Xamarin Traffic](../techniques/generic/MASTG-TECH-0125/)
            
        *    Android
            
            Android
            
            *   [MASTG-TECH-0001: Accessing the Device Shell](../techniques/android/MASTG-TECH-0001/)
            *   [MASTG-TECH-0002: Host-Device Data Transfer](../techniques/android/MASTG-TECH-0002/)
            *   [MASTG-TECH-0003: Obtaining and Extracting Apps](../techniques/android/MASTG-TECH-0003/)
            *   [MASTG-TECH-0004: Repackaging Apps](../techniques/android/MASTG-TECH-0004/)
            *   [MASTG-TECH-0005: Installing Apps](../techniques/android/MASTG-TECH-0005/)
            *   [MASTG-TECH-0006: Listing Installed Apps](../techniques/android/MASTG-TECH-0006/)
            *   [MASTG-TECH-0007: Exploring the App Package](../techniques/android/MASTG-TECH-0007/)
            *   [MASTG-TECH-0008: Accessing App Data Directories](../techniques/android/MASTG-TECH-0008/)
            *   [MASTG-TECH-0009: Monitoring System Logs](../techniques/android/MASTG-TECH-0009/)
            *   [MASTG-TECH-0010: Basic Network Monitoring/Sniffing](../techniques/android/MASTG-TECH-0010/)
            *   [MASTG-TECH-0011: Setting Up an Interception Proxy](../techniques/android/MASTG-TECH-0011/)
            *   [MASTG-TECH-0012: Bypassing Certificate Pinning](../techniques/android/MASTG-TECH-0012/)
            *   [MASTG-TECH-0013: Reverse Engineering Android Apps](../techniques/android/MASTG-TECH-0013/)
            *   [MASTG-TECH-0014: Static Analysis on Android](../techniques/android/MASTG-TECH-0014/)
            *   [MASTG-TECH-0015: Dynamic Analysis on Android](../techniques/android/MASTG-TECH-0015/)
            *   [MASTG-TECH-0016: Disassembling Code to Smali](../techniques/android/MASTG-TECH-0016/)
            *   [MASTG-TECH-0017: Decompiling Java Code](../techniques/android/MASTG-TECH-0017/)
            *   [MASTG-TECH-0018: Disassembling Native Code](../techniques/android/MASTG-TECH-0018/)
            *   [MASTG-TECH-0019: Retrieving Strings](../techniques/android/MASTG-TECH-0019/)
            *   [MASTG-TECH-0020: Retrieving Cross References](../techniques/android/MASTG-TECH-0020/)
            *   [MASTG-TECH-0021: Information Gathering - API Usage](../techniques/android/MASTG-TECH-0021/)
            *   [MASTG-TECH-0022: Information Gathering - Network Communication](../techniques/android/MASTG-TECH-0022/)
            *   [MASTG-TECH-0023: Reviewing Decompiled Java Code](../techniques/android/MASTG-TECH-0023/)
            *   [MASTG-TECH-0024: Reviewing Disassembled Native Code](../techniques/android/MASTG-TECH-0024/)
            *   [MASTG-TECH-0025: Automated Static Analysis](../techniques/android/MASTG-TECH-0025/)
            *   [MASTG-TECH-0026: Dynamic Analysis on Non-Rooted Devices](../techniques/android/MASTG-TECH-0026/)
            *   [MASTG-TECH-0027: Get Open Files](../techniques/android/MASTG-TECH-0027/)
            *   [MASTG-TECH-0028: Get Open Connections](../techniques/android/MASTG-TECH-0028/)
            *   [MASTG-TECH-0029: Listing Loaded Native Libraries](../techniques/android/MASTG-TECH-0029/)
            *   [MASTG-TECH-0030: Sandbox Inspection](../techniques/android/MASTG-TECH-0030/)
            *   [MASTG-TECH-0031: Debugging](../techniques/android/MASTG-TECH-0031/)
            *   [MASTG-TECH-0032: Execution Tracing](../techniques/android/MASTG-TECH-0032/)
            *   [MASTG-TECH-0033: Method Tracing](../techniques/android/MASTG-TECH-0033/)
            *   [MASTG-TECH-0034: Native Code Tracing](../techniques/android/MASTG-TECH-0034/)
            *   [MASTG-TECH-0035: JNI Tracing](../techniques/android/MASTG-TECH-0035/)
            *   [MASTG-TECH-0036: Emulation-based Analysis](../techniques/android/MASTG-TECH-0036/)
            *   [MASTG-TECH-0037: Symbolic Execution](../techniques/android/MASTG-TECH-0037/)
            *   [MASTG-TECH-0038: Patching](../techniques/android/MASTG-TECH-0038/)
            *   [MASTG-TECH-0039: Repackaging & Re-Signing](../techniques/android/MASTG-TECH-0039/)
            *   [MASTG-TECH-0040: Waiting for the Debugger](../techniques/android/MASTG-TECH-0040/)
            *   [MASTG-TECH-0041: Library Injection](../techniques/android/MASTG-TECH-0041/)
            *   [MASTG-TECH-0042: Getting Loaded Classes and Methods Dynamically](../techniques/android/MASTG-TECH-0042/)
            *   [MASTG-TECH-0043: Method Hooking](../techniques/android/MASTG-TECH-0043/)
            *   [MASTG-TECH-0044: Process Exploration](../techniques/android/MASTG-TECH-0044/)
            *   [MASTG-TECH-0045: Runtime Reverse Engineering](../techniques/android/MASTG-TECH-0045/)
            *   [MASTG-TECH-0100: Logging Sensitive Data from Network Traffic](../techniques/android/MASTG-TECH-0100/)
            *   [MASTG-TECH-0108: Taint Analysis](../techniques/android/MASTG-TECH-0108/)
            *   [MASTG-TECH-0109: Intercepting Flutter HTTPS Traffic](../techniques/android/MASTG-TECH-0109/)
            *   [MASTG-TECH-0115: Obtaining Compiler-Provided Security Features](../techniques/android/MASTG-TECH-0115/)
            *   [MASTG-TECH-0116: Obtaining Information about the APK Signature](../techniques/android/MASTG-TECH-0116/)
            *   [MASTG-TECH-0117: Obtaining Information from the AndroidManifest](../techniques/android/MASTG-TECH-0117/)
            *   [MASTG-TECH-0126: Obtaining App Permissions](../techniques/android/MASTG-TECH-0126/)
            *   [MASTG-TECH-0127: Inspecting an App's Backup Data](../techniques/android/MASTG-TECH-0127/)
            *   [MASTG-TECH-0128: Performing a Backup and Restore of App Data](../techniques/android/MASTG-TECH-0128/)
            *   [MASTG-TECH-0129: Verifying Android Dependencies at Runtime](../techniques/android/MASTG-TECH-0129/)
            *   [MASTG-TECH-0130: Software Composition Analysis (SCA) of Android Dependencies by Creating a SBOM](../techniques/android/MASTG-TECH-0130/)
            *   [MASTG-TECH-0131: Software Composition Analysis (SCA) of Android Dependencies at Build Time](../techniques/android/MASTG-TECH-0131/)
            *   [MASTG-TECH-0140: Obtaining Debugging Information and Symbols](../techniques/android/MASTG-TECH-0140/)
            *   [MASTG-TECH-0141: Inspecting the Merged AndroidManifest](../techniques/android/MASTG-TECH-0141/)
            *   [MASTG-TECH-0142: Inspecting WebView Storage](../techniques/android/MASTG-TECH-0142/)
            *   [MASTG-TECH-0143: Monitor File System Operations in WebViews](../techniques/android/MASTG-TECH-0143/)
            *   [MASTG-TECH-0144: Bypassing Root Detection](../techniques/android/MASTG-TECH-0144/)
            *   [MASTG-TECH-0145: Working with XAPK Files](../techniques/android/MASTG-TECH-0145/)
            *   [MASTG-TECH-0148: Interacting with Android ContentProviders](../techniques/android/MASTG-TECH-0148/)
            *   [MASTG-TECH-0150: Analyzing the AndroidManifest](../techniques/android/MASTG-TECH-0150/)
            *   [MASTG-TECH-0151: Analyzing the Network Security Configuration](../techniques/android/MASTG-TECH-0151/)
            *   [MASTG-TECH-0156: Reverse Engineering Flutter Applications](../techniques/android/MASTG-TECH-0156/)
            *   [MASTG-TECH-0157: Extracting Bundled Native Libraries](../techniques/android/MASTG-TECH-0157/)
            *   [MASTG-TECH-0159: Verify Usage of File-Based Content Providers](../techniques/android/MASTG-TECH-0159/)
            *   [MASTG-TECH-0160: Enumerating Activities](../techniques/android/MASTG-TECH-0160/)
            *   [MASTG-TECH-0161: Enumerating Services](../techniques/android/MASTG-TECH-0161/)
            *   [MASTG-TECH-0162: Enumerating Broadcast Receivers](../techniques/android/MASTG-TECH-0162/)
            *   [MASTG-TECH-0163: Enumerating Content Providers](../techniques/android/MASTG-TECH-0163/)
            *   [MASTG-TECH-0164: Sniffing Implicit Intents and Broadcasts](../techniques/android/MASTG-TECH-0164/)
            *   [MASTG-TECH-0165: Identifying Compilers, Obfuscators, and Packers in Android Apps](../techniques/android/MASTG-TECH-0165/)
            *   [MASTG-TECH-0172: Listing Deep Links](../techniques/android/MASTG-TECH-0172/)
            *   [MASTG-TECH-0173: Monitoring Deep Link Handlers at Runtime with Frida](../techniques/android/MASTG-TECH-0173/)
            *   [MASTG-TECH-0174: Verifying App Link Website Association](../techniques/android/MASTG-TECH-0174/)
            
        *    iOS
            
            iOS
            
            *   [MASTG-TECH-0052: Accessing the Device Shell](../techniques/ios/MASTG-TECH-0052/)
            *   [MASTG-TECH-0053: Host-Device Data Transfer](../techniques/ios/MASTG-TECH-0053/)
            *   [MASTG-TECH-0054: Obtaining and Extracting Apps](../techniques/ios/MASTG-TECH-0054/)
            *   [MASTG-TECH-0055: Launching a Repackaged App in Debug Mode](../techniques/ios/MASTG-TECH-0055/)
            *   [MASTG-TECH-0056: Installing Apps](../techniques/ios/MASTG-TECH-0056/)
            *   [MASTG-TECH-0057: Listing Installed Apps](../techniques/ios/MASTG-TECH-0057/)
            *   [MASTG-TECH-0058: Exploring the App Package](../techniques/ios/MASTG-TECH-0058/)
            *   [MASTG-TECH-0059: Accessing App Data Directories](../techniques/ios/MASTG-TECH-0059/)
            *   [MASTG-TECH-0060: Monitoring System Logs](../techniques/ios/MASTG-TECH-0060/)
            *   [MASTG-TECH-0061: Dumping KeyChain Data](../techniques/ios/MASTG-TECH-0061/)
            *   [MASTG-TECH-0062: Basic Network Monitoring/Sniffing](../techniques/ios/MASTG-TECH-0062/)
            *   [MASTG-TECH-0063: Setting up an Interception Proxy](../techniques/ios/MASTG-TECH-0063/)
            *   [MASTG-TECH-0064: Bypassing Certificate Pinning](../techniques/ios/MASTG-TECH-0064/)
            *   [MASTG-TECH-0065: Reverse Engineering iOS Apps](../techniques/ios/MASTG-TECH-0065/)
            *   [MASTG-TECH-0066: Static Analysis on iOS](../techniques/ios/MASTG-TECH-0066/)
            *   [MASTG-TECH-0067: Dynamic Analysis on iOS](../techniques/ios/MASTG-TECH-0067/)
            *   [MASTG-TECH-0068: Disassembling Native Code](../techniques/ios/MASTG-TECH-0068/)
            *   [MASTG-TECH-0069: Decompiling Native Code](../techniques/ios/MASTG-TECH-0069/)
            *   [MASTG-TECH-0070: Extracting Information from the Application Binary](../techniques/ios/MASTG-TECH-0070/)
            *   [MASTG-TECH-0072: Retrieving Cross References](../techniques/ios/MASTG-TECH-0072/)
            *   [MASTG-TECH-0073: Information Gathering - API Usage](../techniques/ios/MASTG-TECH-0073/)
            *   [MASTG-TECH-0074: Information Gathering - Network Communication](../techniques/ios/MASTG-TECH-0074/)
            *   [MASTG-TECH-0075: Reviewing Decompiled Objective-C and Swift Code](../techniques/ios/MASTG-TECH-0075/)
            *   [MASTG-TECH-0076: Reviewing Disassembled Objective-C and Swift Code](../techniques/ios/MASTG-TECH-0076/)
            *   [MASTG-TECH-0077: Reviewing Disassembled Native Code](../techniques/ios/MASTG-TECH-0077/)
            *   [MASTG-TECH-0078: Automated Static Analysis](../techniques/ios/MASTG-TECH-0078/)
            *   [MASTG-TECH-0079: Obtaining a Developer Provisioning Profile](../techniques/ios/MASTG-TECH-0079/)
            *   [MASTG-TECH-0080: Get Open Files](../techniques/ios/MASTG-TECH-0080/)
            *   [MASTG-TECH-0081: Get Open Connections](../techniques/ios/MASTG-TECH-0081/)
            *   [MASTG-TECH-0082: Extracting Bundled Libraries](../techniques/ios/MASTG-TECH-0082/)
            *   [MASTG-TECH-0083: TBD](../techniques/ios/MASTG-TECH-0083/)
            *   [MASTG-TECH-0084: Debugging](../techniques/ios/MASTG-TECH-0084/)
            *   [MASTG-TECH-0085: Execution Tracing](../techniques/ios/MASTG-TECH-0085/)
            *   [MASTG-TECH-0086: Method Tracing](../techniques/ios/MASTG-TECH-0086/)
            *   [MASTG-TECH-0087: Native Code Tracing](../techniques/ios/MASTG-TECH-0087/)
            *   [MASTG-TECH-0088: Emulation-based Analysis](../techniques/ios/MASTG-TECH-0088/)
            *   [MASTG-TECH-0089: Symbolic Execution](../techniques/ios/MASTG-TECH-0089/)
            *   [MASTG-TECH-0090: Injecting Frida Gadget into an IPA Automatically](../techniques/ios/MASTG-TECH-0090/)
            *   [MASTG-TECH-0091: Injecting Libraries into an IPA Manually](../techniques/ios/MASTG-TECH-0091/)
            *   [MASTG-TECH-0092: Signing IPA files](../techniques/ios/MASTG-TECH-0092/)
            *   [MASTG-TECH-0093: Waiting for the debugger](../techniques/ios/MASTG-TECH-0093/)
            *   [MASTG-TECH-0094: Getting Loaded Classes and Methods dynamically](../techniques/ios/MASTG-TECH-0094/)
            *   [MASTG-TECH-0095: Method Hooking](../techniques/ios/MASTG-TECH-0095/)
            *   [MASTG-TECH-0096: Process Exploration](../techniques/ios/MASTG-TECH-0096/)
            *   [MASTG-TECH-0097: Runtime Reverse Engineering](../techniques/ios/MASTG-TECH-0097/)
            *   [MASTG-TECH-0098: Patching React Native Apps](../techniques/ios/MASTG-TECH-0098/)
            *   [MASTG-TECH-0110: Intercepting Flutter HTTPS Traffic](../techniques/ios/MASTG-TECH-0110/)
            *   [MASTG-TECH-0111: Extracting Entitlements from MachO Binaries](../techniques/ios/MASTG-TECH-0111/)
            *   [MASTG-TECH-0112: Obtaining the Code Signature Format Version](../techniques/ios/MASTG-TECH-0112/)
            *   [MASTG-TECH-0113: Obtaining Debugging Symbols](../techniques/ios/MASTG-TECH-0113/)
            *   [MASTG-TECH-0114: Demangling Symbols](../techniques/ios/MASTG-TECH-0114/)
            *   [MASTG-TECH-0118: Obtaining Compiler-Provided Security Features](../techniques/ios/MASTG-TECH-0118/)
            *   [MASTG-TECH-0132: Software Composition Analysis (SCA) of iOS Dependencies by Creating a SBOM](../techniques/ios/MASTG-TECH-0132/)
            *   [MASTG-TECH-0133: Software Composition Analysis (SCA) of iOS Dependencies by Scanning Package Manager Artifacts](../techniques/ios/MASTG-TECH-0133/)
            *   [MASTG-TECH-0134: Monitoring the Pasteboard](../techniques/ios/MASTG-TECH-0134/)
            *   [MASTG-TECH-0135: Bypassing Biometric Authentication](../techniques/ios/MASTG-TECH-0135/)
            *   [MASTG-TECH-0136: Retrieving PrivacyInfo.xcprivacy Files](../techniques/ios/MASTG-TECH-0136/)
            *   [MASTG-TECH-0137: Analyzing PrivacyInfo.xcprivacy Files](../techniques/ios/MASTG-TECH-0137/)
            *   [MASTG-TECH-0138: Convert Plist Files to JSON](../techniques/ios/MASTG-TECH-0138/)
            *   [MASTG-TECH-0139: Attach to WKWebView](../techniques/ios/MASTG-TECH-0139/)
            *   [MASTG-TECH-0146: Dynamic Analysis on Non-Jailbroken Devices](../techniques/ios/MASTG-TECH-0146/)
            *   [MASTG-TECH-0147: Patching](../techniques/ios/MASTG-TECH-0147/)
            *   [MASTG-TECH-0149: Validating ATS TLS Settings at Runtime Using nscurl](../techniques/ios/MASTG-TECH-0149/)
            *   [MASTG-TECH-0152: Bypassing Jailbreak Detection](../techniques/ios/MASTG-TECH-0152/)
            *   [MASTG-TECH-0153: Retrieving Info.plist Files](../techniques/ios/MASTG-TECH-0153/)
            *   [MASTG-TECH-0154: Analyzing Info.plist Files](../techniques/ios/MASTG-TECH-0154/)
            *   [MASTG-TECH-0155: Analyzing the ATS Configuration](../techniques/ios/MASTG-TECH-0155/)
            *   [MASTG-TECH-0158: Extracting Loaded Libraries](../techniques/ios/MASTG-TECH-0158/)
            *   [MASTG-TECH-0166: Identifying Custom URL Scheme Registrations in iOS Apps](../techniques/ios/MASTG-TECH-0166/)
            *   [MASTG-TECH-0167: Monitoring UIActivity Data Sharing](../techniques/ios/MASTG-TECH-0167/)
            *   [MASTG-TECH-0168: Monitoring UIActivity Data Receiving](../techniques/ios/MASTG-TECH-0168/)
            *   [MASTG-TECH-0169: Opening Deep Links](../techniques/ios/MASTG-TECH-0169/)
            *   [MASTG-TECH-0170: Enumerating App Extensions](../techniques/ios/MASTG-TECH-0170/)
            *   [MASTG-TECH-0171: Monitoring Data Sharing Between App Extensions and Containing Apps](../techniques/ios/MASTG-TECH-0171/)
            *   [MASTG-TECH-0175: Verifying Universal Link Domain Association](../techniques/ios/MASTG-TECH-0175/)
            *   [MASTG-TECH-0176: Monitoring Universal Link Handlers at Runtime with Frida](../techniques/ios/MASTG-TECH-0176/)
            
        
    *   [Tools](../tools/)
        
        Tools
        
        *    Generic
            
            Generic
            
            *   [MASTG-TOOL-0031: Frida](../tools/generic/MASTG-TOOL-0031/)
            *   [MASTG-TOOL-0032: Frida CodeShare](../tools/generic/MASTG-TOOL-0032/)
            *   [MASTG-TOOL-0033: Ghidra](../tools/generic/MASTG-TOOL-0033/)
            *   [MASTG-TOOL-0034: LIEF](../tools/generic/MASTG-TOOL-0034/)
            *   [MASTG-TOOL-0035: MobSF](../tools/generic/MASTG-TOOL-0035/)
            *   [MASTG-TOOL-0036: r2frida](../tools/generic/MASTG-TOOL-0036/)
            *   [MASTG-TOOL-0037: RMS Runtime Mobile Security](../tools/generic/MASTG-TOOL-0037/)
            *   [MASTG-TOOL-0038: objection](../tools/generic/MASTG-TOOL-0038/)
            *   [MASTG-TOOL-0098: iaito](../tools/generic/MASTG-TOOL-0098/)
            *   [MASTG-TOOL-0100: reFlutter](../tools/generic/MASTG-TOOL-0100/)
            *   [MASTG-TOOL-0101: disable-flutter-tls-verification](../tools/generic/MASTG-TOOL-0101/)
            *   [MASTG-TOOL-0104: hermes-dec](../tools/generic/MASTG-TOOL-0104/)
            *   [MASTG-TOOL-0106: Fridump](../tools/generic/MASTG-TOOL-0106/)
            *   [MASTG-TOOL-0108: Corellium](../tools/generic/MASTG-TOOL-0108/)
            *   [MASTG-TOOL-0110: semgrep](../tools/generic/MASTG-TOOL-0110/)
            *   [MASTG-TOOL-0129: rabin2](../tools/generic/MASTG-TOOL-0129/)
            *   [MASTG-TOOL-0131: dependency-check](../tools/generic/MASTG-TOOL-0131/)
            *   [MASTG-TOOL-0132: dependency-track](../tools/generic/MASTG-TOOL-0132/)
            *   [MASTG-TOOL-0133: Visual Studio Code (vscode)](../tools/generic/MASTG-TOOL-0133/)
            *   [MASTG-TOOL-0134: cdxgen](../tools/generic/MASTG-TOOL-0134/)
            *   [MASTG-TOOL-0144: gitleaks](../tools/generic/MASTG-TOOL-0144/)
            *   [MASTG-TOOL-0145: Frooky](../tools/generic/MASTG-TOOL-0145/)
            
        *    Android
            
            Android
            
            *   [MASTG-TOOL-0001: Frida (Android)](../tools/android/MASTG-TOOL-0001/)
            *   [MASTG-TOOL-0002: MobSF (Android)](../tools/android/MASTG-TOOL-0002/)
            *   [MASTG-TOOL-0003: nm (Android)](../tools/android/MASTG-TOOL-0003/)
            *   [MASTG-TOOL-0004: adb](../tools/android/MASTG-TOOL-0004/)
            *   [MASTG-TOOL-0005: Android NDK](../tools/android/MASTG-TOOL-0005/)
            *   [MASTG-TOOL-0006: Android SDK](../tools/android/MASTG-TOOL-0006/)
            *   [MASTG-TOOL-0007: Android Studio](../tools/android/MASTG-TOOL-0007/)
            *   [MASTG-TOOL-0008: Android-SSL-TrustKiller](../tools/android/MASTG-TOOL-0008/)
            *   [MASTG-TOOL-0009: APKiD](../tools/android/MASTG-TOOL-0009/)
            *   [MASTG-TOOL-0010: APKLab](../tools/android/MASTG-TOOL-0010/)
            *   [MASTG-TOOL-0011: Apktool](../tools/android/MASTG-TOOL-0011/)
            *   [MASTG-TOOL-0012: apkx](../tools/android/MASTG-TOOL-0012/)
            *   [MASTG-TOOL-0013: Busybox](../tools/android/MASTG-TOOL-0013/)
            *   [MASTG-TOOL-0014: Bytecode Viewer](../tools/android/MASTG-TOOL-0014/)
            *   [MASTG-TOOL-0015: drozer](../tools/android/MASTG-TOOL-0015/)
            *   [MASTG-TOOL-0016: gplaycli](../tools/android/MASTG-TOOL-0016/)
            *   [MASTG-TOOL-0017: House](../tools/android/MASTG-TOOL-0017/)
            *   [MASTG-TOOL-0018: jadx](../tools/android/MASTG-TOOL-0018/)
            *   [MASTG-TOOL-0019: jdb](../tools/android/MASTG-TOOL-0019/)
            *   [MASTG-TOOL-0020: JustTrustMe](../tools/android/MASTG-TOOL-0020/)
            *   [MASTG-TOOL-0021: Magisk](../tools/android/MASTG-TOOL-0021/)
            *   [MASTG-TOOL-0022: ProGuard](../tools/android/MASTG-TOOL-0022/)
            *   [MASTG-TOOL-0023: RootCloak Plus](../tools/android/MASTG-TOOL-0023/)
            *   [MASTG-TOOL-0024: Scrcpy](../tools/android/MASTG-TOOL-0024/)
            *   [MASTG-TOOL-0025: SSLUnpinning](../tools/android/MASTG-TOOL-0025/)
            *   [MASTG-TOOL-0026: Termux](../tools/android/MASTG-TOOL-0026/)
            *   [MASTG-TOOL-0027: Xposed](../tools/android/MASTG-TOOL-0027/)
            *   [MASTG-TOOL-0028: radare2 for Android](../tools/android/MASTG-TOOL-0028/)
            *   [MASTG-TOOL-0029: objection (Android)](../tools/android/MASTG-TOOL-0029/)
            *   [MASTG-TOOL-0030: Angr](../tools/android/MASTG-TOOL-0030/)
            *   [MASTG-TOOL-0099: FlowDroid](../tools/android/MASTG-TOOL-0099/)
            *   [MASTG-TOOL-0103: uber-apk-signer](../tools/android/MASTG-TOOL-0103/)
            *   [MASTG-TOOL-0107: jnitrace](../tools/android/MASTG-TOOL-0107/)
            *   [MASTG-TOOL-0112: pidcat](../tools/android/MASTG-TOOL-0112/)
            *   [MASTG-TOOL-0116: blutter](../tools/android/MASTG-TOOL-0116/)
            *   [MASTG-TOOL-0120: ProxyDroid](../tools/android/MASTG-TOOL-0120/)
            *   [MASTG-TOOL-0123: apksigner](../tools/android/MASTG-TOOL-0123/)
            *   [MASTG-TOOL-0124: aapt2](../tools/android/MASTG-TOOL-0124/)
            *   [MASTG-TOOL-0125: Apkleaks](../tools/android/MASTG-TOOL-0125/)
            *   [MASTG-TOOL-0130: blint](../tools/android/MASTG-TOOL-0130/)
            *   [MASTG-TOOL-0140: frida-multiple-unpinning](../tools/android/MASTG-TOOL-0140/)
            *   [MASTG-TOOL-0146: RootBeer](../tools/android/MASTG-TOOL-0146/)
            *   [MASTG-TOOL-0147: Android RASP](../tools/android/MASTG-TOOL-0147/)
            *   [MASTG-TOOL-0148: apkeep](../tools/android/MASTG-TOOL-0148/)
            *   [MASTG-TOOL-0149: LSPosed](../tools/android/MASTG-TOOL-0149/)
            *   [MASTG-TOOL-0151: debugmepLS](../tools/android/MASTG-TOOL-0151/)
            *   [MASTG-TOOL-0152: lldb (Android)](../tools/android/MASTG-TOOL-0152/)
            *   [MASTG-TOOL-0153: dProtect](../tools/android/MASTG-TOOL-0153/)
            
        *    iOS
            
            iOS
            
            *   [MASTG-TOOL-0039: Frida (iOS)](../tools/ios/MASTG-TOOL-0039/)
            *   [MASTG-TOOL-0040: MobSF (iOS)](../tools/ios/MASTG-TOOL-0040/)
            *   [MASTG-TOOL-0041: nm (iOS)](../tools/ios/MASTG-TOOL-0041/)
            *   [MASTG-TOOL-0042: BinaryCookieReader](../tools/ios/MASTG-TOOL-0042/)
            *   [MASTG-TOOL-0043: class-dump](../tools/ios/MASTG-TOOL-0043/)
            *   [MASTG-TOOL-0044: class-dump-z](../tools/ios/MASTG-TOOL-0044/)
            *   [MASTG-TOOL-0045: class-dump-dyld](../tools/ios/MASTG-TOOL-0045/)
            *   [MASTG-TOOL-0046: Cycript](../tools/ios/MASTG-TOOL-0046/)
            *   [MASTG-TOOL-0047: Cydia](../tools/ios/MASTG-TOOL-0047/)
            *   [MASTG-TOOL-0048: dsdump](../tools/ios/MASTG-TOOL-0048/)
            *   [MASTG-TOOL-0049: Frida-cycript](../tools/ios/MASTG-TOOL-0049/)
            *   [MASTG-TOOL-0050: Frida-ios-dump](../tools/ios/MASTG-TOOL-0050/)
            *   [MASTG-TOOL-0051: gdb](../tools/ios/MASTG-TOOL-0051/)
            *   [MASTG-TOOL-0053: iOSbackup](../tools/ios/MASTG-TOOL-0053/)
            *   [MASTG-TOOL-0054: ios-deploy](../tools/ios/MASTG-TOOL-0054/)
            *   [MASTG-TOOL-0055: iproxy](../tools/ios/MASTG-TOOL-0055/)
            *   [MASTG-TOOL-0056: Keychain-Dumper](../tools/ios/MASTG-TOOL-0056/)
            *   [MASTG-TOOL-0057: lldb (iOS)](../tools/ios/MASTG-TOOL-0057/)
            *   [MASTG-TOOL-0058: MachoOView](../tools/ios/MASTG-TOOL-0058/)
            *   [MASTG-TOOL-0059: optool](../tools/ios/MASTG-TOOL-0059/)
            *   [MASTG-TOOL-0060: otool](../tools/ios/MASTG-TOOL-0060/)
            *   [MASTG-TOOL-0061: Grapefruit](../tools/ios/MASTG-TOOL-0061/)
            *   [MASTG-TOOL-0062: Plutil](../tools/ios/MASTG-TOOL-0062/)
            *   [MASTG-TOOL-0063: security](../tools/ios/MASTG-TOOL-0063/)
            *   [MASTG-TOOL-0064: Sileo](../tools/ios/MASTG-TOOL-0064/)
            *   [MASTG-TOOL-0065: simctl](../tools/ios/MASTG-TOOL-0065/)
            *   [MASTG-TOOL-0066: SSL Kill Switch 3](../tools/ios/MASTG-TOOL-0066/)
            *   [MASTG-TOOL-0067: swift-demangle](../tools/ios/MASTG-TOOL-0067/)
            *   [MASTG-TOOL-0068: SwiftShield](../tools/ios/MASTG-TOOL-0068/)
            *   [MASTG-TOOL-0069: Usbmuxd](../tools/ios/MASTG-TOOL-0069/)
            *   [MASTG-TOOL-0070: Xcode](../tools/ios/MASTG-TOOL-0070/)
            *   [MASTG-TOOL-0071: Xcode Command Line Tools](../tools/ios/MASTG-TOOL-0071/)
            *   [MASTG-TOOL-0072: xcrun](../tools/ios/MASTG-TOOL-0072/)
            *   [MASTG-TOOL-0073: radare2 (iOS)](../tools/ios/MASTG-TOOL-0073/)
            *   [MASTG-TOOL-0074: objection (iOS)](../tools/ios/MASTG-TOOL-0074/)
            *   [MASTG-TOOL-0102: ios-app-signer](../tools/ios/MASTG-TOOL-0102/)
            *   [MASTG-TOOL-0105: ipsw](../tools/ios/MASTG-TOOL-0105/)
            *   [MASTG-TOOL-0111: ldid](../tools/ios/MASTG-TOOL-0111/)
            *   [MASTG-TOOL-0114: codesign](../tools/ios/MASTG-TOOL-0114/)
            *   [MASTG-TOOL-0117: fastlane](../tools/ios/MASTG-TOOL-0117/)
            *   [MASTG-TOOL-0118: Sideloadly](../tools/ios/MASTG-TOOL-0118/)
            *   [MASTG-TOOL-0121: objdump (iOS)](../tools/ios/MASTG-TOOL-0121/)
            *   [MASTG-TOOL-0122: c++filt](../tools/ios/MASTG-TOOL-0122/)
            *   [MASTG-TOOL-0126: libimobiledevice suite](../tools/ios/MASTG-TOOL-0126/)
            *   [MASTG-TOOL-0127: AppSync Unified](../tools/ios/MASTG-TOOL-0127/)
            *   [MASTG-TOOL-0128: Filza](../tools/ios/MASTG-TOOL-0128/)
            *   [MASTG-TOOL-0135: PlistBuddy](../tools/ios/MASTG-TOOL-0135/)
            *   [MASTG-TOOL-0136: plistlib](../tools/ios/MASTG-TOOL-0136/)
            *   [MASTG-TOOL-0137: GlobalWebInspect](../tools/ios/MASTG-TOOL-0137/)
            *   [MASTG-TOOL-0138: ipainstaller](../tools/ios/MASTG-TOOL-0138/)
            *   [MASTG-TOOL-0139: ElleKit](../tools/ios/MASTG-TOOL-0139/)
            *   [MASTG-TOOL-0141: IOSSecuritySuite](../tools/ios/MASTG-TOOL-0141/)
            *   [MASTG-TOOL-0142: Choicy](../tools/ios/MASTG-TOOL-0142/)
            *   [MASTG-TOOL-0150: xpcspy](../tools/ios/MASTG-TOOL-0150/)
            
        *    Network
            
            Network
            
            *   [MASTG-TOOL-0075: tcpdump (Android)](../tools/network/MASTG-TOOL-0075/)
            *   [MASTG-TOOL-0076: bettercap](../tools/network/MASTG-TOOL-0076/)
            *   [MASTG-TOOL-0077: Burp Suite](../tools/network/MASTG-TOOL-0077/)
            *   [MASTG-TOOL-0078: MITM Relay](../tools/network/MASTG-TOOL-0078/)
            *   [MASTG-TOOL-0079: ZAP (Zed Attack Proxy)](../tools/network/MASTG-TOOL-0079/)
            *   [MASTG-TOOL-0080: tcpdump](../tools/network/MASTG-TOOL-0080/)
            *   [MASTG-TOOL-0081: Wireshark](../tools/network/MASTG-TOOL-0081/)
            *   [MASTG-TOOL-0097: mitmproxy](../tools/network/MASTG-TOOL-0097/)
            *   [MASTG-TOOL-0109: Nope-Proxy](../tools/network/MASTG-TOOL-0109/)
            *   [MASTG-TOOL-0115: HTTP Toolkit](../tools/network/MASTG-TOOL-0115/)
            *   [MASTG-TOOL-0143: badssl](../tools/network/MASTG-TOOL-0143/)
            
        
    *   [Apps](../apps/)
        
        Apps
        
        *    Android
            
            Android
            
            *   [MASTG-APP-0001: AndroGoat](../apps/android/MASTG-APP-0001/)
            *   [MASTG-APP-0002: Android License Validator](../apps/android/MASTG-APP-0002/)
            *   [MASTG-APP-0003: Android UnCrackable L1](../apps/android/MASTG-APP-0003/)
            *   [MASTG-APP-0004: Android UnCrackable L2](../apps/android/MASTG-APP-0004/)
            *   [MASTG-APP-0005: Android UnCrackable L3](../apps/android/MASTG-APP-0005/)
            *   [MASTG-APP-0006: Digitalbank](../apps/android/MASTG-APP-0006/)
            *   [MASTG-APP-0007: DIVA Android](../apps/android/MASTG-APP-0007/)
            *   [MASTG-APP-0008: DodoVulnerableBank](../apps/android/MASTG-APP-0008/)
            *   [MASTG-APP-0009: DVHMA](../apps/android/MASTG-APP-0009/)
            *   [MASTG-APP-0010: InsecureBankv2](../apps/android/MASTG-APP-0010/)
            *   [MASTG-APP-0011: MASTG Hacking Playground (Java)](../apps/android/MASTG-APP-0011/)
            *   [MASTG-APP-0012: MASTG Hacking Playground (Kotlin)](../apps/android/MASTG-APP-0012/)
            *   [MASTG-APP-0013: OVAA](../apps/android/MASTG-APP-0013/)
            *   [MASTG-APP-0014: InsecureShop](../apps/android/MASTG-APP-0014/)
            *   [MASTG-APP-0015: Android UnCrackable L4](../apps/android/MASTG-APP-0015/)
            *   [MASTG-APP-0016: Finstergram](../apps/android/MASTG-APP-0016/)
            *   [MASTG-APP-0017: Disable-flutter-tls-verification](../apps/android/MASTG-APP-0017/)
            *   [MASTG-APP-0018: MASTestApp-Android-NETWORK](../apps/android/MASTG-APP-0018/)
            *   [MASTG-APP-0029: BugBazaar](../apps/android/MASTG-APP-0029/)
            *   [MASTG-APP-0031: VulnForum](../apps/android/MASTG-APP-0031/)
            *   [MASTG-APP-0032: RootBeer Sample](../apps/android/MASTG-APP-0032/)
            *   [MASTG-APP-0033: Android RASP Sample](../apps/android/MASTG-APP-0033/)
            
        *    iOS
            
            iOS
            
            *   [MASTG-APP-0023: DVIA](../apps/ios/MASTG-APP-0023/)
            *   [MASTG-APP-0024: DVIA-v2](../apps/ios/MASTG-APP-0024/)
            *   [MASTG-APP-0025: iOS UnCrackable L1](../apps/ios/MASTG-APP-0025/)
            *   [MASTG-APP-0026: iOS UnCrackable L2](../apps/ios/MASTG-APP-0026/)
            *   [MASTG-APP-0027: Disable-flutter-tls-verification](../apps/ios/MASTG-APP-0027/)
            *   [MASTG-APP-0028: iGoat-Swift](../apps/ios/MASTG-APP-0028/)
            *   [MASTG-APP-0030: iBugBazaar](../apps/ios/MASTG-APP-0030/)
            
        
    
*   [MAS Crackmes](../../crackmes/)
    
    MAS Crackmes
    
    *   [Android Crackmes](../../crackmes/Android/)
    *   [iOS Crackmes](../../crackmes/iOS/)
    
*   [News](../../news/)
    
    News
    
    *    Archive
        
        Archive
        
        *   [2026](../../news/archive/2026/)
        *   [2025](../../news/archive/2025/)
        *   [2024](../../news/archive/2024/)
        *   [2023](../../news/archive/2023/)
        *   [2022](../../news/archive/2022/)
        *   [2021](../../news/archive/2021/)
        *   [2020](../../news/archive/2020/)
        *   [2019](../../news/archive/2019/)
        *   [2018](../../news/archive/2018/)
        *   [2017](../../news/archive/2017/)
        *   [2016](../../news/archive/2016/)
        
    
*   [🎙 Talks](../../talks/)
*   [⭐ Contribute](../../contributing/)
    
    ⭐ Contribute
    
    *   [How Can You Contribute?](../../contributing/1_How_Can_You_Contribute/)
    *   [Getting Started](../../contributing/2_Getting_Started/)
    *   [Pull Requests & Reviews](../../contributing/3_PRs_and_Reviews/)
    *   [Add a New Language](../../contributing/4_Add_new_Language/)
    *   [Style Guide](../../contributing/5_Style_Guide/)
    *   [Add a Crackme](../../contributing/6_Add_a_Crackme/)
    *   [How to Run the OWASP MAS Website Locally](../../contributing/7_Run_the_Website/)
    *   [Writing Content](../../contributing/writing-content/)
        
        Writing Content
        
        *   [Style and Formatting for MASTG Markdown Files](../../contributing/writing-content/markdown.instructions/)
        *   [Writing MASTG App Files](../../contributing/writing-content/mastg-apps.instructions/)
        *   [Writing MASTG Best Practices Files](../../contributing/writing-content/mastg-best-practice.instructions/)
        *   [Writing MASTG Demo Files](../../contributing/writing-content/mastg-demo.instructions/)
        *   [Writing Frida scripts for MASTG demos](../../contributing/writing-content/mastg-frida-scripts.instructions/)
        *   [Writing MASTG Frooky Hook Configurations](../../contributing/writing-content/mastg-frooky-hooks.instructions/)
        *   [Writing MASTG Knowledge Files](../../contributing/writing-content/mastg-knowledge.instructions/)
        *   [Writing mitmproxy Python scripts for MASTG demos](../../contributing/writing-content/mastg-mitmproxy-scripts.instructions/)
        *   [Writing r2 scripts (radare2) for MASTG demos](../../contributing/writing-content/mastg-r2-scripts.instructions/)
        *   [Writing MASTG SAST Rules](../../contributing/writing-content/mastg-rules.instructions/)
        *   [Writing MASTG Technique Files](../../contributing/writing-content/mastg-techniques.instructions/)
        *   [Writing MASTG Test Files](../../contributing/writing-content/mastg-test.instructions/)
        *   [Writing MASTG Tool Files](../../contributing/writing-content/mastg-tools.instructions/)
        *   [Porting MASTG v1 tests to v2](../../contributing/writing-content/porting-mastg-v1-tests-to-v2.instructions/)
        
    
*    💙 Donate
    
    💙 Donate
    
    *   [Donations](../../donate/)
    *   [How to Donate](../../donate/how_to_donate/)
    *   [Donation Packages](../../donate/packages/)
    
*   [💬 Connect with Us](../../contact/)

Table of contents

*   [Mobile Platform Providers](#mobile-platform-providers)
    
    *   [Google Android](#google-android)
    
*   [Certification Institutions](#certification-institutions)
    
    *   [CREST](#crest)
    
*   [Standardization Institutions](#standardization-institutions)
    
    *   [NIST (National Institute of Standards and Technology, United States)](#nist-national-institute-of-standards-and-technology-united-states)
    *   [BSI (Bundesamt für Sicherheit in der Informationstechnik, Germany)](#bsi-bundesamt-fur-sicherheit-in-der-informationstechnik-germany)
    *   [ioXt](#ioxt)
    
*   [Governmental Institutions](#governmental-institutions)
*   [Educational Institutions](#educational-institutions)
*   [Application in Scientific Research](#application-in-scientific-research)
*   [Books](#books)
*   [Industry Case Studies](#industry-case-studies)

[](https://github.com/OWASP/mastg/edit/master/Document/0x02b-MASVS-MASTG-Adoption.md "Edit this page")

# OWASP MASVS and MASTG Adoption[¶](#owasp-masvs-and-mastg-adoption "Permanent link")

The OWASP MASVS and MASTG are trusted by the following platform providers and standardization, governmental and educational institutions.

## Mobile Platform Providers[¶](#mobile-platform-providers "Permanent link")

### Google Android[¶](#google-android "Permanent link")

![](../../../assets/Images/Other/android-logo.png)

Since 2021 Google has shown their support for the OWASP Mobile Security project (MASTG/MASVS) and has started providing continuous and high value feedback to the MASVS refactoring process via the [App Defense Alliance (ADA)](https://appdefensealliance.dev/) and its [MASA (Mobile Application Security Assessment) program](https://appdefensealliance.dev/masa).

With MASA, Google has acknowledged the importance of leveraging a globally recognized standard for mobile app security to the mobile app ecosystem. Developers can work directly with an Authorized Lab partner to initiate a security assessment. Google will recognize developers who have had their applications independently validated against a set of MASVS Level 1 requirements and will showcase this on their Data safety section.

We thank Google, the ADA and all its members for their support and for their excellent work on protecting the mobile app ecosystem.

## Certification Institutions[¶](#certification-institutions "Permanent link")

### CREST[¶](#crest "Permanent link")

![](../../../assets/Images/Other/crest_logo.jpg)

CREST is an international not-for-profit, membership body who quality assures its members and delivers professional certifications to the cyber security industry. CREST works with governments, regulators, academe, training partners, professional bodies and other stakeholders around the world.

In August 2022, CREST launched the OWASP Verification Standard (OVS) Programme. CREST OVS sets new standards for application security. Underpinned by OWASP's Application Security Verification Standard (ASVS) and Mobile Application Security Verification Standard (MASVS), CREST is leveraging the open-source community to build and maintain global standards to deliver a global web and mobile application security framework. This will provide assurance to the buying community that developers using CREST OVS accredited providers, always know that they are engaged with ethical and capable organisations with skilled and competent security testers by leveraging the OWASP ASVS and MASVS standards.

*   [CREST OVS Programme](https://www.crest-approved.org/membership/crest-ovs-programme/)
*   [CREST OVS Accreditation Process](https://www.crest-approved.org/membership/crest-ovs-programme/ovs-programme-accreditation-process/)
*   [CREST OVS Introductory Video](https://www.youtube.com/watch?v=th1l6-e4hcg)

We thank CREST for their consultation regarding the OVS programme and its support to the open-source community to build and maintain global cyber security standards.

## Standardization Institutions[¶](#standardization-institutions "Permanent link")

### NIST (National Institute of Standards and Technology, United States)[¶](#nist-national-institute-of-standards-and-technology-united-states "Permanent link")

![](../../../assets/Images/Other/nist-logo.png)

The [National Institute of Standards and Technology (NIST)](https://www.nist.gov/about-nist) was founded in 1901 and is now part of the U.S. Department of Commerce. NIST is one of the nation's oldest physical science laboratories. Congress established the agency to remove a major challenge to U.S. industrial competitiveness at the time — a second-rate measurement infrastructure that lagged behind the capabilities of the United Kingdom, Germany and other economic rivals.

*   [NIST.SP.800-163 "Vetting the Security of Mobile Applications" Revision 1, 2019](https://csrc.nist.gov/news/2019/nist-publishes-sp-800-163-rev-1)
*   [NIST.SP.800-218 "Secure Software Development Framework (SSDF) v1.1: Recommendations for Mitigating the Risk of Software Vulnerabilities" v1.1, 2022](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf)
*   [NIST CSWP 33 "Product Development Cybersecurity Handbook: Concepts and Considerations for IoT Product Manufacturers" Initial Public Draft, 2024](https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.33.ipd.pdf)

### BSI (Bundesamt für Sicherheit in der Informationstechnik, Germany)[¶](#bsi-bundesamt-fur-sicherheit-in-der-informationstechnik-germany "Permanent link")

![](../../../assets/Images/Other/bsi-logo.png)

BSI stands for "Federal Office for Information Security", it has the goal to promote IT security in Germany and is the central IT security service provider for the federal government.

*   [Technical Guideline BSI TR-03161 Security requirements for eHealth applications v1.0, 2020](https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03161/TR-03161.pdf)
*   [Prüfvorschrift für den Produktgutachter des „ePA-Frontend des Versicherten" und des „E-Rezept-Frontend des Versicherten v2.0, 2021](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/DigitaleGesellschaft/Pruefvorschrift_Produktgutachter_ePA-Frontend.pdf)

### ioXt[¶](#ioxt "Permanent link")

![](../../../assets/Images/Other/ioxt-logo.png)

The mission of the [ioXt Alliance](https://www.ioxtalliance.org/) is to build confidence in Internet of Things products through multi-stakeholder, international, harmonized, and standardized security and privacy requirements, product compliance programs, and public transparency of those requirements and programs.

In 2021, ioXt has [extended its security principles through the Mobile Application profile](https://www.ioxtalliance.org/news-events-blog/ioxt-alliance-expands-certification-program-for-mobile-and-vpn-security), so that app developers can ensure their products are built with, and maintain, high cybersecurity standards such as the OWASP MASVS and the VPN Trust Initiative. The ioXt Mobile Application profile is a security standard that applies to any cloud connected mobile app and provides the much needed market transparency for consumer and commercial mobile app security.

*   [ioXt Base Profile v2.0](https://static1.squarespace.com/static/5c6dbac1f8135a29c7fbb621/t/6078677c7d7b84799f1eaa5b/1618503553847/ioXt_Base_Profile.pdf)

## Governmental Institutions[¶](#governmental-institutions "Permanent link")

Name

Document

Year

Government of Singapore, Cyber Security Agency (CSA)

[Safe App Standard v2.0](https://www.csa.gov.sg/resources/publications/safe-app-standard-2-0)

2024

European Payments Council

[Payment Threats and Fraud Trends Report](https://www.europeanpaymentscouncil.eu/sites/default/files/kb/file/2021-12/EPC193-21%20v1.0%202021%20Payments%20Threats%20and%20Fraud%20Trends%20Report.pdf)

2021

European Payments Council

[Mobile Initiated SEPA Credit Transfer Interoperability Implementation Guidelines, including SCT Instant (MSCT IIGs)](https://www.europeanpaymentscouncil.eu/document-library/guidance-documents/mobile-initiated-sepa-instant-credit-transfer-interoperability)

2019

ENISA (European Union Agency for Cybersecurity)

[Good Practices for Security of SMART CARS](https://www.enisa.europa.eu/publications/smart-cars)

2019

Government of India, Ministry of Electronics & Information Technology

[Adoption of Mobile AppSec Verification Standard (MASVS) Version 1.0 of OWASP](http://egovstandards.gov.in/notified-standards-1)

2019

Finish Transport and Communication Agency (TRAFICOM)

[Assessment guideline for electronic identification services (Draft)](https://www.traficom.fi/sites/default/files/media/file/DRAFT%20Traficom%20guideline%20211%202019%20conformity%20assessment%20of%20eID%20service.pdf)

2019

Gobierno de España INCIBE

[Ciberseguridad en Smart Toys](https://www.incibe.es/sites/default/files/contenidos/guias/doc/guia_smarttoys_final.pdf)

2019

## Educational Institutions[¶](#educational-institutions "Permanent link")

Name

Document

Year

Leibniz Fachhochschule Hannover, Germany

[Sicherheitsüberprüfung von mobilen iOS Apps nach OWASP (German)](https://leibniz-fh.de/content/uploads/2022/09/27_Arbeitspapier_OWASP.pdf)

2022

University of Florida, Florida Institute for Cybersecurity Research, United States

["SO{U}RCERER : Developer-Driven Security Testing Framework for Android Apps"](https://arxiv.org/pdf/2111.01631.pdf)

2021

University of Adelaide, Australia and Queen Mary University of London, United Kingdom

[An Empirical Assessment of Global COVID-19 Contact Tracing Applications](https://arxiv.org/pdf/2006.10933.pdf)

2021

School of Information Technology, Mapúa University, Philippines

[A Vulnerability Assessment on the Parental Control Mobile Applications Security: Status based on the OWASP Security Requirements](http://www.ieomsociety.org/singapore2021/papers/1104.pdf)

2021

## Application in Scientific Research[¶](#application-in-scientific-research "Permanent link")

*   [STAMBA: Security Testing for Android Mobile Banking Apps](https://link.springer.com/chapter/10.1007/978-3-319-28658-7_57 "Advances in Signal Processing and Intelligent Recognition Systems pp 671-683")

## Books[¶](#books "Permanent link")

*   [Hands-On Security in DevOps](https://books.google.co.uk/books?id=bO1mDwAAQBAJ&pg=PA40&lpg=PA40&dq=owasp+mobile+security+testing+guide&source=bl&ots=pHhAasVgeC&sig=ACfU3U0yodcqH0O8Sjx3ADTN2m1tbHeCsg&hl=nl&sa=X&ved=2ahUKEwio2umM8tbiAhXgVBUIHehnAEU4UBDoATAIegQICRAB#v=onepage&q=owasp%20mobile%20security%20testing%20guide&f=false "Hands-On Security in DevOps in Google books")

## Industry Case Studies[¶](#industry-case-studies "Permanent link")

*   [Case Study: NowSecure Commits to Security Standards](https://drive.google.com/file/d/1cns3Ot6MGdHwMMSx88lDds3brktMhLOM/view?usp=share_link)

> Would you like to contribute with your case study? [Connect with us!](https://mas.owasp.org/contact/)

Back to top

[![](https://github.com/OWASP/mastg/blob/master/Document/Images/OWASP_logo_white.png?raw=true)](https://www.owasp.org)

![](https://static.scarf.sh/a.png?x-pxid=8ebff783-233d-4cac-95d8-960a4a460df3)

© OWASP Foundation 2026. This work is licensed under [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0). For any reuse or distribution, you must make clear to others the license terms of this work.  
OWASP ® is a registered trademark of the OWASP Foundation, Inc. This website uses cookies to analyze our traffic and only share that information with our analytics partners. [Learn more](https://github.com/OWASP/mastg/blob/master/about_cookies.md).

Made with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) | _Website and covers designed by Carlos Holguera._

[](https://owasp.slack.com/archives/C1M6ZVC6S "owasp.slack.com")[](https://bsky.app/profile/owasp-mas.bsky.social "bsky.app")[](https://infosec.exchange/@OWASP_MAS "infosec.exchange")[](https://github.com/OWASP?q=mas#org-profile-repositories "github.com")[](/cdn-cgi/l/email-protection#bbd8dac9d7d4c895d3d4d7dccedec9dafbd4ccdac8cb95d4c9dc97c8cdded595c8d8d3d7ded2dec9fbd4ccdac8cb95d4c9dc)