# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M04-IAM

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M04-IAM.pdf` | จำนวนหน้าทั้งหมด: 51 หน้า

---

## Slide Page 1

1
Module 4: Securing Access
to Cloud Resources
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to do the following:
• Describe the AWS shared responsibility model
• Explain how AWS Identity and Access Management (IAM) helps secure access to AWS 
resources
• Describe IAM user authentication
• Identify how to authorize access to AWS services by using IAM users, groups, and roles

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1.
Introduction
2.
Shared responsibility model
3.
Introducing AWS Identity and Access 
Management (IAM)
4.
Authenticating with IAM
5.
Authorizing with IAM
Demonstrations
• Configuring Cross-Account Access to 
AWS Resources
• Creating IAM Users and Groups
Activities
Shared Responsibility Model
Knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 5

5
Café business requirement
Frank and Martha liked the proof-of-concept website, and now other team 
members are going to help Sofía to develop the café‘s web application. Before 
development continues, she decides to define the level of access that users and 
systems should have across cloud resources.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Section 2: Shared responsibility model
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 7

7
Shared responsibility model principles
• Security and compliance – shared 
responsibility between AWS and the 
customer
• AWS responsibility:
• Security of the cloud
• Customer responsibility:
• Security in the cloud
• Objectives:
• Reduce the customer’s operational burden
• Provide needed flexibility and control to the 
customer

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 8

8
Activity: Shared 
Responsibility Model

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 9

9
Activity: Shared Responsibility Model 2
Activity: Shared Responsibility Model
Who is responsible for the security of... ?
CUSTOMER
RESPONSIBILITY FOR 
SECURITY IN THE 
CLOUD
AWS
RESPONSIBILITY FOR 
SECURITY OF THE 
CLOUD

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 10

10
Activity: Shared Responsibility Model
Who is responsible for the security of...
CUSTOMER
RESPONSIBILITY FOR 
SECURITY IN THE 
CLOUD
Customer data
Platform, applications, identity and access management
Operating system, network, and firewall configuration
Client-side data encryption and 
data integrity, authentication
Server-side encryption 
(file system and data)
Networking traffic protection 
(encryption, integrity, identity)
AWS
RESPONSIBILITY FOR 
SECURITY OF THE 
CLOUD

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 11

11
Activity: Shared Responsibility Model
Who is responsible for the security of...
CUSTOMER
RESPONSIBILITY FOR 
SECURITY IN THE 
CLOUD
Customer data
Platform, applications, identity and access management
Operating system, network, and firewall configuration
Client-side data encryption and 
data integrity, authentication
Server-side encryption 
(file system and data)
Networking traffic protection 
(encryption, integrity, identity)
AWS
RESPONSIBILITY FOR 
SECURITY OF THE 
CLOUD
Software
Compute
Storage
Databases
Networking
Hardware and AWS Global Infrastructure
Regions
Availability Zones
Edge locations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 12

12
Shared responsibility example
Customer responsibility examples:
• Guest OS configuration
• Application-level security
• Security group configuration

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 13

13
Section 3: Introducing AWS Identity and 
Access Management (IAM)
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 14

14
AWS Identity and Access Management (IAM)
•Securely controls individual and 
group access to your AWS 
resources
•Integrates with other AWS services
•Supports federated identity 
management
•Supports granular permissions
•Supports multi-factor 
authentication (MFA)
AWS Identity and 
Access Management 
(IAM)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 15

15
Security fundamentals 
Authentication
• Who is requesting access to the AWS 
account and the resources in it?
• It’s important to establish the identity of the 
requester through credentials.
• The requester could be a person or an 
application – IAM calls them principals.
Authorization
• Assuming that the requester has been 
authenticated, what should they be allowed 
to do?
• IAM checks for policies that are relevant to 
the request to determine whether to allow 
or deny the request.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 16

16
IAM overview

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 17

17
Section 4: Authenticating with IAM
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 18

18
Authentication scenarios

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 19

19
IAM credentials for authentication
User name and password
(console access)
AWS Management Console
MFA
Option
Access key ID and secret access key
(programmatic access)
AWS Command Line Interface (AWS CLI)
MFA
Option
API access
ACCESS KEY ID 
 
Example: AKIAIOSFODNN7EXAMPLE
SECRET KEY 
 
Example: UtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 20

20
Multi-factor authentication (MFA)
Adds an extra layer of protection on 
top of your user name and password
• Users are prompted for an 
authentication code
• It can be hardware-based or a virtual 
device
Enable MFA for:
• AWS Management Console users
• AWS API users (requires temporary 
security credentials)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 21

21
IAM roles provide temporary credentials
IAM role characteristics
• Provides temporary security credentials
• Is not uniquely associated with one person
• Is assumable by a person, application, or 
service
• Is often used to delegate access
Common use cases
• Application that runs on Amazon Elastic 
Compute Cloud (Amazon EC2)
• Cross-account access for an IAM user
• Mobile applications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 22

22
Demonstration: 
Configuring Cross-
Account Access to AWS 
Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 23

23
Providing access to AWS resources through your IDE
• Use AWS toolkits to integrate access to AWS resources.
• Use AWS managed temporary credentials for IDEs 
installed on an EC2 instance.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 24

24
AWS credentials file and credential profiles
Linux, macOS, or Unix:  ~/.aws/credentials
Microsoft Windows:   C:\Users\USERNAME\.aws\credentials
Example file structure
[default]
aws_access_key_id = ACCESS_KEY_ID
aws_secret_access_key = SECRET_ACCESS_KEY_ID
[prod]
aws_access_key_id = ACCESS_KEY_ID
aws_secret_access_key = SECRET_ACCESS_KEY_ID
Profile names
Example code—Specifies to use the 
prod AWS account
import boto3
session = boto3.Session(profile_name='prod')

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
Section 4 key 
takeaways
•IAM roles with temporary credentials are 
preferred for applications that run on Amazon 
EC2 and for mobile apps.
•Avoid storing AWS credentials in code or in 
publicly accessible places. Use credential files 
instead.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
Section 5: Authorizing with IAM
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 27

27
Policies and permissions
IAM group 
members
IAM policies       with 
permissions
Policy with 
full access
Amazon S3 bucket 
1
Policy with 
read only 
access 
Amazon S3  
bucket 2

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 28

28
Demonstration: 
Creating IAM Users 
and IAM Groups

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 29

29
Identity-based and resource-based policies
Identity-based policies
What does a particular identity have access to?
User/ group
Has access to
With permission to
Carlos
Resource X
Read, Write, List
Richard
Resource Y
Read
Richard
Resource Z
Read
Managers
Resource X
List
Managers
Resource Y
List
Managers
Resource Z
List
Resource-based policies
Who has access to a particular resource?
Resource
Can be accessed 
by
With permission to
Resource X
Jie
Read, Write, List
Resource X
Akua
Read, Write, List
Resource X
Mary
Read, List
Resource X
Mateo
List
Resource Y
Paulo
Read, Write, List
Resource Y
Nikki
Read
Resource Y
Mateo
Write, List

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 30

30
Example of identity-based policy
{
  "Version": "2018-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "iam:*LoginProfile",
      "iam:*AccessKey*"
      "iam:*SSHPublicKey*"
    ],
    "Resource": "arn:aws:iam::account-
id-without-hyphens:user/${aws:username}"
  }
}
The actions allowed
The AWS resources the action 
can be performed on

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 31

31
Example cross-account, resource-based policy
{
  "Version": "2018-10-17",
  "Statement": {
    "Sid": "AccountBAccess1",
    "Principal": {"AWS": "111122223333"},
    "Effect": "Allow",
    "Action": "s3:*",
    "Resource": [
      "arn:aws:s3:::DOC-EXAMPLE-BUCKET",
     "arn:aws:s3:::DOC-EXAMPLE-BUCKET/*"
    ]
  }
}
Who can make the request 
(Account B)
Actions allowed
Resources shared by 
Account A

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 32

32
Comparing managed and inline IAM policies
IAM policies
Managed
• Are standalone, identity-based policies
• Can be attached to multiple users, 
groups, and roles
• Reusability
• Central change management
• Versioning and rollback
• Permissions management can be 
delegated to others
Inline
• Are resource-based policies
• Are embedded in a principal entity 
(for example, user, group, or role)
• Strict 1:1 relationship between a 
policy and the entity
AWS managed
Customer managed

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 33

33
Evaluation logic for IAM policies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Example IAM policy: Allow statement
{
  "Version": "2012-10-17",
  "Statement":[{
    "Effect":"Allow",
    "Action":["dynamodb:*","s3:*"],
    "Resource":["arn:aws:dynamodb:region:<account-number-without-hyphens>:table/pollynotes",
      "arn:aws:s3:::polly-notes-web",
      "arn:aws:s3:::polly-notes-mp3/*"] 
    },
    {
    "Effect":"Deny",
    "Action":["dynamodb:*","s3:*"],
    "NotResource":["arn:aws:dynamodb:region:<account-number-without-
hyphens>:table/pollynotes",
      "arn:aws:s3:::polly-notes-web",
      "arn:aws:s3:::polly-notes-mp3/*"] 
    }
  ]
}
Box highlights the Effect Allow, Action, and Resources associated 
with the Allow statement.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 35

35
Example IAM policy: Deny statement
An explicit deny statement takes precedence over an allow statement.
{
  "Version": "2012-10-17",
  "Statement":[{
    "Effect":"Allow",
    "Action":["dynamodb:*","s3:*"],
    "Resource":["arn:aws:dynamodb:region:account-number-without-hyphens:table/pollynotes",
      "arn:aws:s3:::polly-notes-web",
      "arn:aws:s3:::polly-notes-mp3/*"] 
    },
    {
    "Effect":"Deny",
    "Action":["dynamodb:*","s3:*"],
    "NotResource":["arn:aws:dynamodb:region:account-number-without-hyphens:table/pollynotes",
      "arn:aws:s3:::polly-notes-web",
      "arn:aws:s3:::polly-notes-mp3/*"] 
    }
  ]
}
Ensures that the entity can’t perform any action on 
any DynamoDB table or S3 bucket except for the 
tables and buckets that the policy specifies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 36

36
Principle of least privilege
Best practices:
• Start by granting the minimum 
AWS account permissions that are 
needed for the job role
• Grant additional access as needed
IAM group 
members
IAM policies       with 
permissions
Policy with 
read only 
access
Policy with 
full access

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 37

37
IAM scenario (1)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 38

38
IAM scenario (2)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 39

39
IAM scenario (3)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 40

40
IAM scenario (4)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 41

41
IAM scenario (5)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 42

42
IAM scenario (6)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 43

43
Section 5 key 
takeaways
•Permissions for accessing AWS account 
services and resources are defined in IAM 
policy documents.
•Attach IAM policies to IAM users, IAM groups, 
or IAM roles.
•Follow the principle of least privilege when 
you grant account access.
•When IAM determines permissions, an explicit 
deny will always override any allow statement.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 44

44
Module wrap-up
Module 4: Securing Access to Cloud Resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 45

45
Module summary
In summary, in this module, you learned how to do the following:
• Describe the AWS shared responsibility model
• Explain how IAM helps secure access to AWS resources
• Describe IAM user authentication
• Identify how to authorize access to AWS services by using IAM users, groups, and roles

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 46

46
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 47

47
Sample exam question
A company is storing an access key (access key ID and secret access key) in a text file on a custom Amazon 
Machine Image (AMI). The company uses the access key to access DynamoDB tables from instances that are 
created from the AMI. The security team has mandated a more secure solution.
Which solution will meet the security team’s mandate?
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Storing an access key
•
On a custom Amazon Machine Image (AMI)
•
To access DynamoDB tables
•
More secure solution

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 48

48
Sample exam question: Responses
A company is storing an access key (access key ID and secret access key) in a text file on a custom Amazon 
Machine Image (AMI). The company uses the access key to access DynamoDB tables from instances that are 
created from the AMI. The security team has mandated a more secure solution.
Which solution will meet the security team’s mandate?
Choice
Response
A
Put the access key in an S3 bucket, and retrieve the access key on boot from the instance. 
B
Pass the access key to the instances through instance user data. 
C
Obtain the access key from a key server that is launched in a private subnet. 
D
Create an IAM role with permissions to access the table, and launch all instances with the new role.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 49

49
Sample exam question: Answer
The correct answer is D.
Choice
Response
A
Put the access key in an S3 bucket, and retrieve the access key on boot from the instance. 
B
Pass the access key to the instances through instance user data. 
C
Obtain the access key from a key server that is launched in a private subnet. 
D
Create an IAM role with permissions to access the table, and launch all instances with the new role.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 50

50
Additional resources
•IAM FAQs at IAM FAQs
•IAM Tutorials at 
https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorials.html.
•IAM Policy Reference at https://docs.aws.amazon.com/service-
authorization/latest/reference/reference_policies_actions-resources-
contextkeys.html.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 51

Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.
51

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
