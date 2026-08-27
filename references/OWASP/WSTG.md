---
source_url: https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/
source_title: OWASP Web Security Testing Guide
source_language: en
retrieved_at: 2026-08-27
published_at: null
source_version: null
capture_scope: page
conversion: turndown-7.2.4
status: archived
license: null
canonical_id: owasp-wstg
trust: untrusted
prompt_injection_reviewed_at: 2026-08-27
body_sha256: 7d2c55637d2b299adb4cb7f1bc0a42003b1edafc5ac424a3d9887d81836868a7
---

This content represents the latest contributions to the Web Security Testing Guide, and may frequently change.

[](#)[![OWASP logo](https://owasp.org/assets/images/logo.png)](https://owasp.org/)

[![](https://owasp.org/assets/images/logo.png)](https://owasp.org/)

[Store](https://owasp.org/store) [Donate](https://owasp.org/donate?reponame=www-project-web-security-testing-guide&title=WSTG+-+Latest) [Join](https://owasp.glueup.com/organization/6727/memberships)

This website uses cookies to analyze our traffic and only share that information with our analytics partners.

Accept

x

[Store](https://owasp.org/store)

[Donate](https://owasp.org/donate?reponame=www-project-web-security-testing-guide&title=WSTG+-+Latest)

[Join](https://owasp.glueup.com/organization/6727/memberships)

# WSTG - Latest

[Home](/www-project-web-security-testing-guide/) > [Latest](/www-project-web-security-testing-guide/latest/) > [4-Web Application Security Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/) > [00-Introduction and Objectives](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/)

# 4.0 Introduction and Objectives

This section describes the OWASP web application security testing methodology and explains how to test for evidence of vulnerabilities within the application due to deficiencies with identified security controls.

## What is Web Application Security Testing?

A security test is a method of evaluating the security of a computer system or network by methodically validating and verifying the effectiveness of application security controls. A web application security test focuses only on evaluating the security of a web application. The process involves an active analysis of the application for any weaknesses, technical flaws, or vulnerabilities. Any security issues that are found will be presented to the system owner, together with an assessment of the impact, a proposal for mitigation or a technical solution.

## What is a Vulnerability?

A vulnerability is a flaw or weakness in a system’s design, implementation, operation or management that could be exploited to compromise the system’s security objectives.

## What is a Threat?

A threat is anything (a malicious external attacker, an internal user, a system instability, etc) that may harm the assets owned by an application (resources of value, such as the data in a database or in the file system) by exploiting a vulnerability.

## What is a Test?

A test is an action to demonstrate that an application meets the security requirements of its stakeholders.

## The Approach in Writing this Guide

The OWASP approach is open and collaborative:

*   Open: every security expert can participate with their experience in the project. Everything is free.
*   Collaborative: brainstorming is performed before the articles are written so the team can share ideas and develop a collective vision of the project. That means rough consensus, a wider audience and increased participation.

This approach tends to result in a defined Testing Methodology that will be:

*   Consistent
*   Reproducible
*   Rigorous
*   Under quality control

The problems to be addressed are fully documented and tested. It is important to use various methods to test all the known vulnerabilities and document all the security test activities.

## What Is the OWASP Testing Methodology?

Security testing will never be an exact science where a complete list of all possible issues that should be tested can be defined. In fact, security testing is only one of the several suitable techniques for testing the security of web applications under certain circumstances. The goal of this project is to collect all the possible testing techniques, explain these techniques, and keep the guide updated. The OWASP Web Application Security Testing methodology is based on the black box approach. The tester has little to no information about the application to be tested.

The testing model consists of:

*   Tester: Who performs the testing activities
*   Tools and methodology: The core of this Testing Guide project
*   Application: The black box to test

Testing can be categorized as passive or active:

### Passive Testing

During passive testing, a tester tries to understand the application’s logic and explores the application as an end user. Tools can be used for information gathering. For example, an HTTP(S) proxy can be used to observe all the HTTP(S) requests and responses. At the end of this phase, the tester should generally understand all the access points and functionality of the system (e.g., HTTP headers, parameters, cookies, APIs, technology usage/patterns, etc). The [Information Gathering](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/README) section explains how to perform passive testing.

For example, a tester may find a page at the following URL: `https://www.example.com/login/auth_form`

This may indicate an authentication form where the application requests a username and password.

The following parameters represent two access points to the application: `https://www.example.com/appx?a=1&b=1`

In this case, the application has two access points (parameters `a` and `b`). All the input points found in this phase represent targets for testing. Keeping track of the directory or call tree of the application and all the access points can be useful during active testing.

### Active Testing

During active testing, a tester uses the methodologies described in the following sections.

The set of active tests have been split into 12 categories:

*   Information Gathering
*   Configuration and Deployment Management Testing
*   Identity Management Testing
*   Authentication Testing
*   Authorization Testing
*   Session Management Testing
*   Input Validation Testing
*   Testing for Error Handling
*   Testing for Weak Cryptography
*   Business Logic Testing
*   Client-side Testing
*   API Testing

* * *

[Watch](https://github.com/OWASP/wstg/subscription) [Star](https://github.com/OWASP/wstg)

**The OWASP® Foundation** works to improve the security of software through its community-led open source software projects, hundreds of chapters worldwide, tens of thousands of members, and by hosting local and global conferences.

## [WSTG Contents](/www-project-web-security-testing-guide/latest/)

Filter contents 

Expand All Collapse All

*   [0\. Foreword](/www-project-web-security-testing-guide/latest/0-Foreword/README "0. Foreword")
*   [1\. About](/www-project-web-security-testing-guide/latest/1-About/ "1. About")
*   [2\. Introduction](/www-project-web-security-testing-guide/latest/2-Introduction/ "2. Introduction")
    
    *   [2.1 Purpose and Scope](/www-project-web-security-testing-guide/latest/2-Introduction/README#purpose-and-scope "2.1 Purpose and Scope")
    *   [2.2 Why Web Application Security Testing Matters](/www-project-web-security-testing-guide/latest/2-Introduction/README#why-web-application-security-testing-matters "2.2 Why Web Application Security Testing Matters")
    *   [2.3 Who Should Use This Guide](/www-project-web-security-testing-guide/latest/2-Introduction/README#who-should-use-this-guide "2.3 Who Should Use This Guide")
    *   [2.4 Core Principles of Effective Security Testing](/www-project-web-security-testing-guide/latest/2-Introduction/README#core-principles-of-effective-security-testing "2.4 Core Principles of Effective Security Testing")
    *   [2.5 How the Guide Is Organized](/www-project-web-security-testing-guide/latest/2-Introduction/README#how-the-guide-is-organized "2.5 How the Guide Is Organized")
    *   [2.6 How to Reference WSTG Scenarios](/www-project-web-security-testing-guide/latest/2-Introduction/README#how-to-reference-wstg-scenarios "2.6 How to Reference WSTG Scenarios")
    *   [2.7 Feedback and Comments](/www-project-web-security-testing-guide/latest/2-Introduction/README#feedback-and-comments "2.7 Feedback and Comments")
    *   [2.8 Related OWASP Projects](/www-project-web-security-testing-guide/latest/2-Introduction/README#related-owasp-projects "2.8 Related OWASP Projects")
    
*   [3\. The OWASP Testing Framework](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/ "3. The OWASP Testing Framework")
    
    *   [3.1 The Web Security Testing Framework](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework "3.1 The Web Security Testing Framework")
    *   [3.2 Phase 1 Before Development Begins](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#phase-1-before-development-begins "3.2 Phase 1 Before Development Begins")
    *   [3.3 Phase 2 During Definition and Design](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#phase-2-during-definition-and-design "3.3 Phase 2 During Definition and Design")
    *   [3.4 Phase 3 During Development](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#phase-3-during-development "3.4 Phase 3 During Development")
    *   [3.5 Phase 4 During Deployment](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#phase-4-during-deployment "3.5 Phase 4 During Deployment")
    *   [3.6 Phase 5 During Maintenance and Operations](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#phase-5-during-maintenance-and-operations "3.6 Phase 5 During Maintenance and Operations")
    *   [3.7 A Typical SDLC Testing Workflow](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/0-The_Web_Security_Testing_Framework#a-typical-sdlc-testing-workflow "3.7 A Typical SDLC Testing Workflow")
    *   [3.8 Penetration Testing Methodologies](/www-project-web-security-testing-guide/latest/3-The_OWASP_Testing_Framework/1-Penetration_Testing_Methodologies "3.8 Penetration Testing Methodologies")
    
*   [4\. Web Application Security Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/ "4. Web Application Security Testing")
    
    *   [4.0 Introduction and Objectives](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/README "4.0 Introduction and Objectives")
    *   [4.1 Information Gathering](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/README "4.1 Information Gathering")
        
        *   [4.1.1 Conduct Search Engine Discovery Reconnaissance for Information Leakage](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/01-Conduct_Search_Engine_Discovery_Reconnaissance_for_Information_Leakage "4.1.1 Conduct Search Engine Discovery Reconnaissance for Information Leakage")
        *   [4.1.2 Fingerprint Web Server](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/02-Fingerprint_Web_Server "4.1.2 Fingerprint Web Server")
        *   [4.1.3 Review Webserver Metafiles for Information Leakage](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/03-Review_Webserver_Metafiles_for_Information_Leakage "4.1.3 Review Webserver Metafiles for Information Leakage")
        *   [4.1.4 Attack Surface Identification](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/04-Attack_Surface_Identification "4.1.4 Attack Surface Identification")
        *   [4.1.5 Review Web Page Content for Information Leakage](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/05-Review_Web_Page_Content_for_Information_Leakage "4.1.5 Review Web Page Content for Information Leakage")
        *   [4.1.6 Identify Application Entry Points](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/06-Identify_Application_Entry_Points "4.1.6 Identify Application Entry Points")
        *   [4.1.7 Map Execution Paths Through Application](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/07-Map_Execution_Paths_Through_Application "4.1.7 Map Execution Paths Through Application")
        *   [4.1.8 Fingerprint Web Application Framework](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/08-Fingerprint_Web_Application_Framework "4.1.8 Fingerprint Web Application Framework")
        *   [4.1.9 Fingerprint Web Application](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/09-Fingerprint_Web_Application "4.1.9 Fingerprint Web Application")
        *   [4.1.10 Map Application Architecture](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/01-Information_Gathering/10-Map_Application_Architecture "4.1.10 Map Application Architecture")
        
    *   [4.2 Configuration and Deployment Management Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/README "4.2 Configuration and Deployment Management Testing")
        
        *   [4.2.1 Test Network Infrastructure Configuration](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/01-Test_Network_Infrastructure_Configuration "4.2.1 Test Network Infrastructure Configuration")
        *   [4.2.2 Test Application Platform Configuration](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/02-Test_Application_Platform_Configuration "4.2.2 Test Application Platform Configuration")
        *   [4.2.3 Test File Extensions Handling for Sensitive Information](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/03-Test_File_Extensions_Handling_for_Sensitive_Information "4.2.3 Test File Extensions Handling for Sensitive Information")
        *   [4.2.4 Review Old Backup and Unreferenced Files for Sensitive Information](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/04-Review_Old_Backup_and_Unreferenced_Files_for_Sensitive_Information "4.2.4 Review Old Backup and Unreferenced Files for Sensitive Information")
        *   [4.2.5 Enumerate Infrastructure and Application Admin Interfaces](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/05-Enumerate_Infrastructure_and_Application_Admin_Interfaces "4.2.5 Enumerate Infrastructure and Application Admin Interfaces")
        *   [4.2.6 Test HTTP Methods](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/06-Test_HTTP_Methods "4.2.6 Test HTTP Methods")
        *   [4.2.7 Test HTTP Strict Transport Security](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/07-Test_HTTP_Strict_Transport_Security "4.2.7 Test HTTP Strict Transport Security")
        *   [4.2.8 Test RIA Cross Domain Policy](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/08-Test_RIA_Cross_Domain_Policy "4.2.8 Test RIA Cross Domain Policy")
        *   [4.2.9 Test File Permission](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/09-Test_File_Permission "4.2.9 Test File Permission")
        *   [4.2.10 Test for Subdomain Takeover](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/10-Test_for_Subdomain_Takeover "4.2.10 Test for Subdomain Takeover")
        *   [4.2.11 Test Cloud Storage](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/11-Test_Cloud_Storage "4.2.11 Test Cloud Storage")
        *   [4.2.12 Test for Content Security Policy](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/12-Test_for_Content_Security_Policy "4.2.12 Test for Content Security Policy")
        *   [4.2.13 Test for Path Confusion](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/13-Test_for_Path_Confusion "4.2.13 Test for Path Confusion")
        *   [4.2.14 Test Other HTTP Security Header Misconfigurations](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/02-Configuration_and_Deployment_Management_Testing/14-Test_Other_HTTP_Security_Header_Misconfigurations "4.2.14 Test Other HTTP Security Header Misconfigurations")
        
    *   [4.3 Identity Management Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/README "4.3 Identity Management Testing")
        
        *   [4.3.1 Test Role Definitions](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/01-Test_Role_Definitions "4.3.1 Test Role Definitions")
        *   [4.3.2 Test User Registration Process](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/02-Test_User_Registration_Process "4.3.2 Test User Registration Process")
        *   [4.3.3 Test Account Provisioning Process](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/03-Test_Account_Provisioning_Process "4.3.3 Test Account Provisioning Process")
        *   [4.3.4 Testing for Account Enumeration and Guessable User Account](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/04-Testing_for_Account_Enumeration_and_Guessable_User_Account "4.3.4 Testing for Account Enumeration and Guessable User Account")
        *   [4.3.5 Testing for Weak or Unenforced Username Policy](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/03-Identity_Management_Testing/05-Testing_for_Weak_or_Unenforced_Username_Policy "4.3.5 Testing for Weak or Unenforced Username Policy")
        
    *   [4.4 Authentication Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/README "4.4 Authentication Testing")
        
        *   [4.4.1 Testing for Credentials Transported over an Encrypted Channel](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/01-Testing_for_Credentials_Transported_over_an_Encrypted_Channel "4.4.1 Testing for Credentials Transported over an Encrypted Channel")
        *   [4.4.2 Testing for Default Credentials](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/02-Testing_for_Default_Credentials "4.4.2 Testing for Default Credentials")
        *   [4.4.3 Testing for Weak Lock Out Mechanism](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/03-Testing_for_Weak_Lock_Out_Mechanism "4.4.3 Testing for Weak Lock Out Mechanism")
        *   [4.4.4 Testing for Bypassing Authentication Schema](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/04-Testing_for_Bypassing_Authentication_Schema "4.4.4 Testing for Bypassing Authentication Schema")
        *   [4.4.5 Testing for Vulnerable Remember Password](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/05-Testing_for_Vulnerable_Remember_Password "4.4.5 Testing for Vulnerable Remember Password")
        *   [4.4.6 Testing for Browser Cache Weaknesses](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/06-Testing_for_Browser_Cache_Weaknesses "4.4.6 Testing for Browser Cache Weaknesses")
        *   [4.4.7 Testing for Weak Authentication Methods](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/07-Testing_for_Weak_Authentication_Methods "4.4.7 Testing for Weak Authentication Methods")
        *   [4.4.8 Testing for Weak Security Question Answer](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/08-Testing_for_Weak_Security_Question_Answer "4.4.8 Testing for Weak Security Question Answer")
        *   [4.4.9 Testing for Weak Password Change or Reset Functionalities](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/09-Testing_for_Weak_Password_Change_or_Reset_Functionalities "4.4.9 Testing for Weak Password Change or Reset Functionalities")
        *   [4.4.10 Testing for Weaker Authentication in Alternative Channel](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/10-Testing_for_Weaker_Authentication_in_Alternative_Channel "4.4.10 Testing for Weaker Authentication in Alternative Channel")
        *   [4.4.11 Testing Multi-Factor Authentication](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/04-Authentication_Testing/11-Testing_Multi-Factor_Authentication "4.4.11 Testing Multi-Factor Authentication")
        
    *   [4.5 Authorization Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/README "4.5 Authorization Testing")
        
        *   [4.5.1 Testing Directory Traversal File Include](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/01-Testing_Directory_Traversal_File_Include "4.5.1 Testing Directory Traversal File Include")
        *   [4.5.2 Testing for Bypassing Authorization Schema](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/02-Testing_for_Bypassing_Authorization_Schema "4.5.2 Testing for Bypassing Authorization Schema")
        *   [4.5.3 Testing for Privilege Escalation](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/03-Testing_for_Privilege_Escalation "4.5.3 Testing for Privilege Escalation")
        *   [4.5.4 Testing for Insecure Direct Object References](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/04-Testing_for_Insecure_Direct_Object_References "4.5.4 Testing for Insecure Direct Object References")
        *   [4.5.5 Testing for OAuth Weaknesses](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/05-Testing_for_OAuth_Weaknesses "4.5.5 Testing for OAuth Weaknesses")
            
            *   [4.5.5.1 Testing for OAuth Authorization Server Weaknesses](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/05.1-Testing_for_OAuth_Authorization_Server_Weaknesses "4.5.5.1 Testing for OAuth Authorization Server Weaknesses")
            *   [4.5.5.2 Testing for OAuth Client Weaknesses](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/05.2-Testing_for_OAuth_Client_Weaknesses "4.5.5.2 Testing for OAuth Client Weaknesses")
            
        
    *   [4.6 Session Management Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/README "4.6 Session Management Testing")
        
        *   [4.6.1 Testing for Session Management Schema](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/01-Testing_for_Session_Management_Schema "4.6.1 Testing for Session Management Schema")
        *   [4.6.2 Testing for Cookies Attributes](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/02-Testing_for_Cookies_Attributes "4.6.2 Testing for Cookies Attributes")
        *   [4.6.3 Testing for Session Fixation](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/03-Testing_for_Session_Fixation "4.6.3 Testing for Session Fixation")
        *   [4.6.4 Testing for Exposed Session Variables](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/04-Testing_for_Exposed_Session_Variables "4.6.4 Testing for Exposed Session Variables")
        *   [4.6.5 Testing for Cross Site Request Forgery](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/05-Testing_for_Cross_Site_Request_Forgery "4.6.5 Testing for Cross Site Request Forgery")
        *   [4.6.6 Testing for Logout Functionality](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/06-Testing_for_Logout_Functionality "4.6.6 Testing for Logout Functionality")
        *   [4.6.7 Testing Session Timeout](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/07-Testing_Session_Timeout "4.6.7 Testing Session Timeout")
        *   [4.6.8 Testing for Session Puzzling](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/08-Testing_for_Session_Puzzling "4.6.8 Testing for Session Puzzling")
        *   [4.6.9 Testing for Session Hijacking](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/09-Testing_for_Session_Hijacking "4.6.9 Testing for Session Hijacking")
        *   [4.6.10 Testing JSON Web Tokens](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/10-Testing_JSON_Web_Tokens "4.6.10 Testing JSON Web Tokens")
        *   [4.6.11 Testing for Concurrent Sessions](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/06-Session_Management_Testing/11-Testing_for_Concurrent_Sessions "4.6.11 Testing for Concurrent Sessions")
        
    *   [4.7 Input Validation Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/README "4.7 Input Validation Testing")
        
        *   [4.7.1 Testing for Reflected Cross Site Scripting](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/01-Testing_for_Reflected_Cross_Site_Scripting "4.7.1 Testing for Reflected Cross Site Scripting")
        *   [4.7.2 Testing for Stored Cross Site Scripting](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/02-Testing_for_Stored_Cross_Site_Scripting "4.7.2 Testing for Stored Cross Site Scripting")
        *   [4.7.3 Testing for HTTP Verb Tampering](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/03-Testing_for_HTTP_Verb_Tampering "4.7.3 Testing for HTTP Verb Tampering")
        *   [4.7.4 Testing for HTTP Parameter Pollution](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/04-Testing_for_HTTP_Parameter_Pollution "4.7.4 Testing for HTTP Parameter Pollution")
        *   [4.7.5 Testing for SQL Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05-Testing_for_SQL_Injection "4.7.5 Testing for SQL Injection")
            
            *   [4.7.5.1 Testing for Oracle](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.1-Testing_for_Oracle "4.7.5.1 Testing for Oracle")
            *   [4.7.5.2 Testing for MySQL](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.2-Testing_for_MySQL "4.7.5.2 Testing for MySQL")
            *   [4.7.5.3 Testing for SQL Server](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.3-Testing_for_SQL_Server "4.7.5.3 Testing for SQL Server")
            *   [4.7.5.4 Testing PostgreSQL](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.4-Testing_PostgreSQL "4.7.5.4 Testing PostgreSQL")
            *   [4.7.5.5 Testing for MS Access](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.5-Testing_for_MS_Access "4.7.5.5 Testing for MS Access")
            *   [4.7.5.6 Testing for NoSQL Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.6-Testing_for_NoSQL_Injection "4.7.5.6 Testing for NoSQL Injection")
            *   [4.7.5.7 Testing for ORM Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.7-Testing_for_ORM_Injection "4.7.5.7 Testing for ORM Injection")
            *   [4.7.5.8 Testing for Client-side](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/05.8-Testing_for_Client-side "4.7.5.8 Testing for Client-side")
            
        *   [4.7.6 Testing for LDAP Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/06-Testing_for_LDAP_Injection "4.7.6 Testing for LDAP Injection")
        *   [4.7.7 Testing for XML Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/07-Testing_for_XML_Injection "4.7.7 Testing for XML Injection")
        *   [4.7.8 Testing for SSI Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/08-Testing_for_SSI_Injection "4.7.8 Testing for SSI Injection")
        *   [4.7.9 Testing for XPath Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/09-Testing_for_XPath_Injection "4.7.9 Testing for XPath Injection")
        *   [4.7.10 Testing for IMAP SMTP Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/10-Testing_for_IMAP_SMTP_Injection "4.7.10 Testing for IMAP SMTP Injection")
        *   [4.7.11 Testing for Code Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/11-Testing_for_Code_Injection "4.7.11 Testing for Code Injection")
            
            *   [4.7.11.1 Testing for File Inclusion](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/11.1-Testing_for_File_Inclusion "4.7.11.1 Testing for File Inclusion")
            
        *   [4.7.12 Testing for Command Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/12-Testing_for_Command_Injection "4.7.12 Testing for Command Injection")
        *   [4.7.13 Testing for Format String Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/13-Testing_for_Format_String_Injection "4.7.13 Testing for Format String Injection")
        *   [4.7.14 Testing for Incubated Vulnerability](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/14-Testing_for_Incubated_Vulnerability "4.7.14 Testing for Incubated Vulnerability")
        *   [4.7.15 Testing for HTTP Response Splitting](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/15-Testing_for_HTTP_Response_Splitting "4.7.15 Testing for HTTP Response Splitting")
        *   [4.7.16 Testing for HTTP Request Smuggling](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/16-Testing_for_HTTP_Request_Smuggling "4.7.16 Testing for HTTP Request Smuggling")
        *   [4.7.17 Testing for Host Header Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/17-Testing_for_Host_Header_Injection "4.7.17 Testing for Host Header Injection")
        *   [4.7.18 Testing for Server-side Template Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/18-Testing_for_Server-side_Template_Injection "4.7.18 Testing for Server-side Template Injection")
        *   [4.7.19 Testing for Server-Side Request Forgery](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/19-Testing_for_Server-Side_Request_Forgery "4.7.19 Testing for Server-Side Request Forgery")
        *   [4.7.20 Testing for Mass Assignment](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/20-Testing_for_Mass_Assignment "4.7.20 Testing for Mass Assignment")
        *   [4.7.21 Testing for CSV Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/21-Testing_for_CSV_Injection "4.7.21 Testing for CSV Injection")
        *   [4.7.22 Testing for Prototype Pollution](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/22-Testing_for_Prototype_Pollution "4.7.22 Testing for Prototype Pollution")
        *   [4.7.23 Testing for Insecure Deserialization](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/23-Testing_for_Insecure_Deserialization "4.7.23 Testing for Insecure Deserialization")
        
    *   [4.8 Testing for Error Handling](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/08-Testing_for_Error_Handling/README "4.8 Testing for Error Handling")
        
        *   [4.8.1 Testing for Improper Error Handling](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/08-Testing_for_Error_Handling/01-Testing_For_Improper_Error_Handling "4.8.1 Testing for Improper Error Handling")
        *   [4.8.2 Testing for Stack Traces](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/08-Testing_for_Error_Handling/02-Testing_for_Stack_Traces "4.8.2 Testing for Stack Traces")
        
    *   [4.9 Testing for Weak Cryptography](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/README "4.9 Testing for Weak Cryptography")
        
        *   [4.9.1 Testing for Weak Transport Layer Security](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/01-Testing_for_Weak_Transport_Layer_Security "4.9.1 Testing for Weak Transport Layer Security")
        *   [4.9.2 Testing for Padding Oracle](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/02-Testing_for_Padding_Oracle "4.9.2 Testing for Padding Oracle")
        *   [4.9.3 Testing for Sensitive Information Sent via Unencrypted Channels](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/03-Testing_for_Sensitive_Information_Sent_via_Unencrypted_Channels "4.9.3 Testing for Sensitive Information Sent via Unencrypted Channels")
        *   [4.9.4 Testing for Weak Cryptographic Primitives](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/04-Testing_for_Weak_Cryptographic_Primitives "4.9.4 Testing for Weak Cryptographic Primitives")
        
    *   [4.10 Business Logic Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/README "4.10 Business Logic Testing")
        
        *   [4.10.0 Introduction to Business Logic](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/00-Introduction_to_Business_Logic "4.10.0 Introduction to Business Logic")
        *   [4.10.1 Test Business Logic Data Validation](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/01-Test_Business_Logic_Data_Validation "4.10.1 Test Business Logic Data Validation")
        *   [4.10.2 Test Ability to Forge Requests](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/02-Test_Ability_to_Forge_Requests "4.10.2 Test Ability to Forge Requests")
        *   [4.10.3 Test Integrity Checks](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/03-Test_Integrity_Checks "4.10.3 Test Integrity Checks")
        *   [4.10.4 Test for Process Timing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/04-Test_for_Process_Timing "4.10.4 Test for Process Timing")
        *   [4.10.5 Test Number of Times a Function Can Be Used Limits](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/05-Test_Number_of_Times_a_Function_Can_Be_Used_Limits "4.10.5 Test Number of Times a Function Can Be Used Limits")
        *   [4.10.6 Testing for the Circumvention of Work Flows](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/06-Testing_for_the_Circumvention_of_Work_Flows "4.10.6 Testing for the Circumvention of Work Flows")
        *   [4.10.7 Test Defenses Against Application Misuse](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/07-Test_Defenses_Against_Application_Misuse "4.10.7 Test Defenses Against Application Misuse")
        *   [4.10.8 Test Upload of Unexpected File Types](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/08-Test_Upload_of_Unexpected_File_Types "4.10.8 Test Upload of Unexpected File Types")
        *   [4.10.9 Test Upload of Malicious Files](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/09-Test_Upload_of_Malicious_Files "4.10.9 Test Upload of Malicious Files")
        *   [4.10.10 Test Payment Functionality](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/10-Business_Logic_Testing/10-Test-Payment-Functionality "4.10.10 Test Payment Functionality")
        
    *   [4.11 Client-side Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/README "4.11 Client-side Testing")
        
        *   [4.11.1 Testing for DOM-Based Cross Site Scripting](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/01-Testing_for_DOM-based_Cross_Site_Scripting "4.11.1 Testing for DOM-Based Cross Site Scripting")
            
            *   [4.11.1.1 Testing for Self DOM Based Cross-Site Scripting](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/01.1-Testing_for_Self_DOM_Based_Cross_Site_Scripting "4.11.1.1 Testing for Self DOM Based Cross-Site Scripting")
            
        *   [4.11.2 Testing for JavaScript Execution](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/02-Testing_for_JavaScript_Execution "4.11.2 Testing for JavaScript Execution")
        *   [4.11.3 Testing for HTML Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/03-Testing_for_HTML_Injection "4.11.3 Testing for HTML Injection")
        *   [4.11.4 Testing for Client-side URL Redirect](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/04-Testing_for_Client-side_URL_Redirect "4.11.4 Testing for Client-side URL Redirect")
        *   [4.11.5 Testing for CSS Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/05-Testing_for_CSS_Injection "4.11.5 Testing for CSS Injection")
        *   [4.11.6 Testing for Client-side Resource Manipulation](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/06-Testing_for_Client-side_Resource_Manipulation "4.11.6 Testing for Client-side Resource Manipulation")
        *   [4.11.7 Testing Cross Origin Resource Sharing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/07-Testing_Cross_Origin_Resource_Sharing "4.11.7 Testing Cross Origin Resource Sharing")
        *   [4.11.8 Testing for Cross Site Flashing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/08-Testing_for_Cross_Site_Flashing "4.11.8 Testing for Cross Site Flashing")
        *   [4.11.9 Testing for Clickjacking](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/09-Testing_for_Clickjacking "4.11.9 Testing for Clickjacking")
        *   [4.11.10 Testing WebSockets](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/10-Testing_WebSockets "4.11.10 Testing WebSockets")
        *   [4.11.11 Testing Web Messaging](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/11-Testing_Web_Messaging "4.11.11 Testing Web Messaging")
        *   [4.11.12 Testing Browser Storage](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/12-Testing_Browser_Storage "4.11.12 Testing Browser Storage")
        *   [4.11.13 Testing for Cross Site Script Inclusion](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/13-Testing_for_Cross_Site_Script_Inclusion "4.11.13 Testing for Cross Site Script Inclusion")
        *   [4.11.14 Testing for Reverse Tabnabbing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/14-Testing_for_Reverse_Tabnabbing "4.11.14 Testing for Reverse Tabnabbing")
        *   [4.11.15 Testing for Client-side Template Injection](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/11-Client-side_Testing/15-Testing_for_Client-Side_Template_Injection "4.11.15 Testing for Client-side Template Injection")
        
    *   [4.12 API Testing](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/README "4.12 API Testing")
        
        *   [4.12.0 API Testing Overview](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/00-API_Testing_Overview "4.12.0 API Testing Overview")
        *   [4.12.1 API Reconnaissance](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/01-API_Reconnaissance "4.12.1 API Reconnaissance")
        *   [4.12.2 API Broken Object Level Authorization](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/02-API_Broken_Object_Level_Authorization "4.12.2 API Broken Object Level Authorization")
        *   [4.12.3 Testing for Excessive Data Exposure](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/03-Testing_for_Excessive_Data_Exposure "4.12.3 Testing for Excessive Data Exposure")
        *   [4.12.4 API Broken Function Level Authorization](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/04-API_Broken_Function_Level_Authorization "4.12.4 API Broken Function Level Authorization")
        *   [4.12.99 Testing GraphQL](/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/12-API_Testing/99-Testing_GraphQL "4.12.99 Testing GraphQL")
        
    
*   [5\. Reporting](/www-project-web-security-testing-guide/latest/5-Reporting/README "5. Reporting")
    
    *   [5.1 Reporting Structure](/www-project-web-security-testing-guide/latest/5-Reporting/01-Reporting_Structure "5.1 Reporting Structure")
    *   [5.2 Naming Schemes](/www-project-web-security-testing-guide/latest/5-Reporting/02-Naming_Schemes "5.2 Naming Schemes")
    
*   [Appendix A. History](/www-project-web-security-testing-guide/latest/6-Appendix/A-History "Appendix A. History")
*   [Appendix B. Testing Tools Resource](/www-project-web-security-testing-guide/latest/6-Appendix/B-Testing_Tools_Resource "Appendix B. Testing Tools Resource")
*   [Appendix C. Suggested Reading](/www-project-web-security-testing-guide/latest/6-Appendix/C-Suggested_Reading "Appendix C. Suggested Reading")
*   [Appendix D. Fuzzing](/www-project-web-security-testing-guide/latest/6-Appendix/D-Fuzzing "Appendix D. Fuzzing")
*   [Appendix E. Encoded Injection](/www-project-web-security-testing-guide/latest/6-Appendix/E-Encoded_Injection "Appendix E. Encoded Injection")
*   [Appendix F. Leveraging Dev Tools](/www-project-web-security-testing-guide/latest/6-Appendix/F-Leveraging_Dev_Tools "Appendix F. Leveraging Dev Tools")

### Upcoming OWASP Global Events

## Corporate Supporters

[Become a corporate supporter](https://owasp.org/supporters)

[](https://github.com/OWASP/)[](https://owasp.org/slack/invite)[](https://www.facebook.com/OWASPFoundation)[](https://infosec.exchange/@owasp)[](https://twitter.com/owasp)[](https://www.linkedin.com/company/owasp/)[](https://www.youtube.com/user/OWASPGLOBAL)

*   [HOME](https://owasp.org/)
*   [PROJECTS](https://owasp.org/projects/)
*   [CHAPTERS](https://owasp.org/chapters/)
*   [EVENTS](https://owasp.org/events/)
*   [ABOUT](https://owasp.org/about/)
*   [PRIVACY](https://owasp.org/www-policy/operational/privacy)
*   [SITEMAP](https://owasp.org/sitemap/)
*   [CONTACT](https://owasp.org/contact/)

OWASP, the OWASP logo, and Global AppSec are registered trademarks and AppSec Days, AppSec California, AppSec Cali, SnowFROC, OWASP Boston Application Security Conference, and LASCON are trademarks of the OWASP Foundation, Inc. Unless otherwise specified, all content on the site is Creative Commons Attribution-ShareAlike v4.0 and provided without warranty of service or accuracy. For more information, please refer to our [General Disclaimer](https://policy.owasp.org/operational/general-disclaimer.html). OWASP does not endorse or recommend commercial products or services, allowing our community to remain vendor neutral with the collective wisdom of the best minds in software security worldwide. Copyright 2026, OWASP Foundation, Inc.
