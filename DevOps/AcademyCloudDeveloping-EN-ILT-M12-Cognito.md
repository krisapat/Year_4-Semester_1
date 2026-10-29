# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M12-Cognito

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M12-Cognito.pdf` | จำนวนหน้าทั้งหมด: 50 หน้า

---

## Slide Page 1

1
Module 12: Developing Secure Applications 
on AWS
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 12: Developing Secure Applications on AWS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to 
do the following:
• List two aspects of securing application
• Recall how to authenticate with the AWS Security 
Token Service (AWS STS)
• Describe how to build secure applications with 
Amazon Cognito
• Secure part of a website with Amazon Cognito

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1. Introduction
2. Securing network connections
3. Authenticating with AWS STS
4. Authenticating with Amazon Cognito
Lab
• Implementing Application 
Authentication Using Amazon Cognito
Knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 5

5
Café business requirement
Sofía wants to modify the café website to provide a login for café employees 
that gives them access to features that aren’t available to external users.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Amazon Cognito as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Application security

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 8

8
Section 2: Securing network connections
Module 12: Developing Secure Applications on AWS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 9

9
Securing connections
Transport Layer Security (TLS)/ Secure 
Sockets Layer (SSL)
•
Use certificates to establish the 
identity of websites
•
Encrypt network communications 
between connected resources
1

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 10

10
Certificates and certificate authorities
Certificate authority
(CA)
1. CA issues certificate
2. Client requests identification
3. Server sends certificate and public key
4. Is issuing CA trusted?
5. Client sends encrypted session key
6. Acknowledgement encrypted with session key
7. All data now encrypted with session key
Client
(web browser
or application)
Server
(website)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 11

11
Challenges with managing certificates
Challenges
Security
Discovery
Rotation and 
renewals
Authorization
Cost

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 12

12
Using ACM
AWS Certificate Manager (ACM)
•
Provisions, manages, and deploys public and private 
SSL/TLS certificates
•
Manages certificate renewal
•
Allows use of your own certificate with ACM Private 
CA

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 13

13
Section 2 key 
takeaways
•You can encrypt network communications 
with SSL and TLS protocols.
•SSL and TLS require a certificate issued by a 
CA.
•ACM simplifies management and renewal of 
certificates.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 14

14
Section 3: Authenticating with AWS STS
Module 12: Developing Secure Applications on AWS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 15

15
Controlling access
Use temporary credentials to 
grant users access to 
application resources with:
•
AWS Identity and Access 
Management (IAM) roles
•
AWS STS
•
Amazon Cognito
2

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 16

16
Key concepts for access control
• Authentication: Verify the identity of the user
• Authorization: Verify the user's permissions (what the user is allowed to do)
• Identity provider (IdP): Manages identity information and provides authentication services
• Identity broker: Authenticates credentials against an IdP and retrieves temporary security 
credentials from AWS STS
• Standards:
• Security Assertion Markup Language (SAML): Open standard used to exchange authentication and 
authorization data between parties
• OpenID Connect (OIDC): Open standard that third-party IdPs use so that other companies/sites can use 
them to authenticate users without having to maintain an in-house user database
• JSON Web Token (JWT): Open standard used to securely transmit information between two parties

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 17

17
Why use temporary security credentials
Bad practice
• Embed access keys in 
unencrypted code.
• Share access keys between 
users in an AWS account.
Best practice
• Use IAM roles to retrieve 
temporary security 
credentials.
• If IAM roles are not an 
option, use AWS STS to 
retrieve credentials.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 18

18
Temporary security credentials from AWS STS
AWS Security 
Token Service
(AWS STS)
•Provided to trusted users to enable them to 
access your AWS resources
•Short-lived credentials that consist of an access 
key ID, secret access key, and session token
•Limited in duration to a configurable lifetime
•Not reusable after they expire
•Generated dynamically

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 19

19
AWS STS trusted users
•IAM users
• For cross-account access
• For applications running on Amazon Elastic 
Compute Cloud (Amazon EC2) instances and 
other AWS compute services
•Federated identities for external users
• Enterprise (single sign-on)
• Web (social sign-in)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 20

20
AWS STS authentication with federated users

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 21

21
AWS STS authentication with IAM users

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 22

22
AWS STS API operations
Operation
Returns Set of Temporary Security Credentials to…
AssumeRole
Existing IAM users for cross-account access to AWS resources.
AssumeRoleWithSAML
Federated users who are authenticated by an organization’s existing identity 
system.
AssumeRoleWithWeb
Identity
Federated users who are authenticated through a public IdP.
GetFederationToken
Federated users. This API differs from AssumeRole in that the default 
expiration period is substantially longer (12 hours instead of 1 hour).
GetSessionToken
Existing IAM users for enhanced security, such as allowing AWS requests only 
when multi-factor authentication (MFA) is enabled for the IAM user.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 23

23
Tracking user actions with CloudTrail
CloudTrail captures actions from 
authenticated users
• Stores log files in Amazon S3
• Can be configured to respond with 
actions or notifications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 24

24
CloudTrail: Track federated user actions
1. Search for eventName 
TerminateInstances
2. Determine the Amazon 
Resource Name (ARN) of the 
IAM role that the federated 
user assumed

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 25

25
CloudTrail: Track federated user actions (continued)
3. Search the CloudTrail event logs for 
the eventName called 
AssumeRoleWithSAML and the IAM 
role’s ARN
4. Identify the SAML-federated user 
identity in the userName attribute

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
Section 3 key 
takeaways
•A best practice is to issue temporary 
credentials to access AWS resources.
•AWS STS provides temporary credentials for 
IAM users and external users.
•Use CloudTrail to track actions from federated 
(external) users.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 27

27
Section 4: Authenticating with Amazon 
Cognito
Module 12: Developing Secure Applications on AWS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 28

28
Amazon Cognito
Amazon Cognito
Provides authentication, authorization, and user 
management for your web and mobile applications
•Authenticates user identities through external IdPs that 
support SAML or OIDC, social IdPs, and custom IdPs
•Provides temporary security credentials to access AWS 
resources and services

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 29

29
Amazon Cognito user pools
and identity pools (federated identities)
User pools
• Directory of users
• Provide sign-in for users
• Accept federated identities from 
Login with Amazon, Google, 
Facebook, or any SAML or OIDC 
IdPs
Identity pools 
(federated identities)
• Provide users with temporary 
access credentials 
• Enable creation of unique 
identities and federate them with 
various providers (for example, an 
OIDC identity or Amazon identity)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 30

30
User pool security features and functionality
•Sign-up and sign-in services
•Built-in, customizable login web UI 
•Control who can access your API
•Compromised credentials check
•Phone and email verification
•Adaptive authentication

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 31

31
User pools authentication flow
1
Sign in directly through the user pool
or third-party IdP
2
Successfully authenticate and get tokens 
from Amazon Cognito
3
Uses tokens to:
•
Get AWS credentials to access backend resources and AWS services
•
Control access to server-side resources through API Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 32

32
User pool tokens
Identity token
• Authorizes API calls. 
Contains claims about 
the identity of the 
user (for example, 
name and email).
Signed
Access token
• Authorizes API calls 
based on the custom 
scopes of specified 
access-protected 
resources.
Signed
Refresh token
• Contains the 
information 
necessary to obtain a 
new ID or access 
token.
Encrypted

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 33

33
Example: User pool authentication
with an API Gateway REST API

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Identity pools overview

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 35

35
Example: Granting IAM permissions
with Amazon Cognito identity pools

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 36

36
Section 4 key 
takeaways
•Use Amazon Cognito to manage user access to 
AWS resources.
•User pools are directories of users who can 
access AWS resources.
•You associate users with credentials in identity 
pools.
•Authenticate access with Amazon Cognito by 
using user pools or IdP credentials.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 37

37
Lab 12.1: 
Implementing 
Application 
Authentication Using 
Amazon Cognito

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 38

38
Lab: Scenario
In this lab, Sofía will use Amazon Cognito to integrate an authentication 
mechanism into the website. Frank will be able to log in to the website to 
confirm his identity before he requests the report. Then, she will connect the 
REST API endpoint to the café website so that he can make his report request 
directly from the site.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 39

39
Lab: Tasks
1. Preparing the development environment
2. Configuring a Cognito user pool and app client
3. Configuring the client app
4. Integrating the Amazon Cognito hosted URI into the website
5. Observing the REST API endpoint details and testing
6. Creating a user for the Amazon Cognito user pool
7. Configuring an API Gateway authorizer
8. Testing the request process from the website

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 40

40
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 41

41
Begin Lab 12.1: 
Implementing 
Application 
Authentication Using 
Amazon Cognito
~ 90 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 42

42
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 43

43
Module wrap-up
Module 12: Developing Secure Applications on AWS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 44

44
Module summary
In summary, in this module, you learned how to do the following:
•List two aspects of securing applications 
 
 
 
•Recall how to authenticate with AWS STS
•Describe how to build secure applications with Amazon Cognito
•Secure part of a website with Amazon Cognito

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 45

45
Complete the 
knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 46

46
Sample exam question
A developer is adding sign-up and sign-in functionality to an application. The application is required to make an 
API call to a custom analytics solution to log user sign-in events. 
Which combination of actions should the developer take to satisfy these requirements? (Select TWO.)
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Sign-up and sign-in functionality
•
Custom analytics solution
•
Sign-in events

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 47

47
Sample exam question: Response choices
A developer is adding sign-up and sign-in functionality to an application. The application is required to make an 
API call to a custom analytics solution to log user sign-in events. 
Which combination of actions should the developer take to satisfy these requirements? (Select TWO.)
Choice
Response
A
Use Amazon Cognito to provide the sign-up and sign-in functionality.
B
Use IAM to provide the sign-up and sign-in functionality.
C
Invoke an API Gateway method to make the API call that the post-authentication event initiates.
D
Store the database credentials in AWS Secrets Manager. Configure Secrets Manager to automatically rotate the credentials.
E
Invoke a Lambda function to make the API call that the post-authentication event initiates.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 48

48
Sample exam question: Answer
The correct answers and A and E.
Choice
Response
A
Use Amazon Cognito to provide the sign-up and sign-in functionality.
B
Use IAM to provide the sign-up and sign-in functionality.
C
Invoke an API Gateway method to make the API call that the post-authentication event initiates.
D
Store the database credentials in AWS Secrets Manager. Configure Secrets Manager to automatically rotate the credentials.
E
Invoke a Lambda function to make the API call that the post-authentication event initiates.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 49

49
Additional resources
• Blog posts
• Amazon Cognito Groups and Fine-Grained Role-Based Access Control 
• Use AWS Secrets Manager to Simplify the Management of Private Certificates
• Using ACM Private Certificate Authority in a Multi-Account Environment by Using IAM Roles
• Disaster Recovery on AWS workshop
• AWS Security Token Service

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 50

50
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
