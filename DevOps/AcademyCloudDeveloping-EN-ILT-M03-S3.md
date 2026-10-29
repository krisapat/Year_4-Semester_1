# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M03-S3

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M03-S3.pdf` | จำนวนหน้าทั้งหมด: 46 หน้า

---

## Slide Page 1

1
Module 3: Developing Storage Solutions
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to 
do the following:
• Describe how Amazon Simple Storage Service 
(Amazon S3) can be used as a storage solution
• Identify features and components of Amazon S3
• Describe how to protect data in Amazon S3
• Describe the function of S3 object operations
• Explain how to manage access to Amazon S3 
resources
• Develop with Amazon S3 by using the AWS software 
development kits (SDKs)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1. Introduction
2. Introducing Amazon S3
3. Creating S3 buckets
4. Working with S3 objects
5. Protecting data and managing access 
to Amazon S3 resources
Lab
Working with Amazon S3
Knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 5

5
Café business requirement
Sofía has decided on a development environment, and she is ready to start building. She wants to create a 
proof-of-concept website for the café without exposing the site to the outside world yet.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Amazon S3 as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Section 2: Introducing Amazon S3
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 8

8
Amazon S3
Amazon Simple 
Storage Service
(Amazon S3)
Object storage service that offers scalability, data 
availability, security, and performance
•Designed for 99.999999999 percent (11 9s) of durability
•Provides easy-to-use management features
•Can respond to event triggers

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 9

9
Amazon S3 use cases
Content storage and 
distribution
Backup and restore, 
and archive
Data lakes and 
big data analytics
Disaster recovery 
(DR)
Static website 
hosting

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 7 รายการ]


---

## Slide Page 10

10
Amazon S3 components
Bucket
https://s3-<aws-region>.amazonaws.com/<bucket-name>/
Each bucket is Regional and has a Region-
specific endpoint in this format
Object
https://s3-<aws-region>.amazonaws.com/<bucket-name>/<object-key>
Object key example: 
preview.mp4

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 11

11
Section 2 key 
takeaways
•Amazon S3 is an object storage service.
•Some uses for Amazon S3 include content 
storage, backups, data lakes, DR, and static 
websites.
•Objects in an S3 bucket can be referred to by 
their URL.
•The key value identifies the object in the 
bucket.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 12

12
Section 3: Creating S3 buckets
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 13

13
S3 bucket names
•Bucket names must be globally unique.
•Additional rules to follow when you choose 
bucket names –
•Use 3–63 characters.
•Use only lowercase letters, numbers, and 
hyphens (-).
•Do not use uppercase characters or underscores 
( _ ).

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 14

14
Amazon S3 bucket Regions
Deciding factors:
• Latency
• Cost
• Regulatory requirements

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 15

15
Accessing buckets: Bucket URLs
•Virtual-host-style URL
• Bucket name is part of the domain name in the URL.
• Structure: http://<bucket-name>.s3-<aws-region>.amazonaws.com/<object-key>
• Example: http://DOC-EXAMPLE-BUCKET.s3.eu-west-1.amazonaws.com/cat.jpg
• Useful for hosting a static website (must be enabled)
• Structure: http://<bucket-name>.s3-website-<aws-region>.amazonaws.com
• Example: http://DOC-EXAMPLE-BUCKET.s3-website-eu-west-1.amazonaws.com

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 16

16
Creating folder structure in buckets: Using prefixes
Bucket name: 
DOC-EXAMPLE-BUCKET
Use prefixes to imply a folder structure in 
an S3 bucket
Bucket objects:
2021/DOC-EXAMPLE-
BUCKET/english/john.txt
2021/DOC-EXAMPLE-
BUCKET/english/maria.txt
2021/DOC-EXAMPLE-
BUCKET/math/john.txt
2021/DOC-EXAMPLE-
BUCKET/math/maria.txt
2021/DOC-EXAMPLE-
BUCKET/summary.txt
Specify prefix: 
2021/DOC-EXAMPLE-BUCKET/math
GET object
Returns the following object keys:
•
2021/DOC-EXAMPLE-BUCKET/math/john.txt
•
2021/DOC-EXAMPLE-BUCKET/math/maria.txt

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 17

17
Section 3 key 
takeaways
•Amazon S3 bucket names are globally unique.
•Buckets are located in Regions, which affects 
performance and is subject to regulatory 
requirements.
•Objects in buckets are referenced through 
virtual-host-style URLs.
•Prefixes imply a folder structure in an S3 
bucket.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 18

18
Section 4: Working with S3 objects
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 19

19
Object metadata
Set of key-value pairs that provides additional information about the object
System-defined
• Information that Amazon S3 controls:
• Object-creation date
• Object size
• Object version
• Information that you can modify:
• Storage-class configuration
• Server-side encryption
User-defined
• Information that you assign to the 
object
• x-amz-meta key followed by a custom 
name
• For example: 
x-amz-meta-alt-name

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 20

20
PUT object
Use the PUT object to upload entire objects to a bucket
• Should use single upload for 
objects up to 5 GB in a single 
PUT operation
• Should use multipart upload for 
objects over100mb
• Must use multipart upload for 
objects over 5 GB
• Allows parallel uploading to 
improve throughput
• Can resume uploads where it left 
off
• Allows a maximum object size of 
5 TB

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 21

21
PUT object: Code
The following code PUTS core.css to the bucket 
import boto3
S3API = boto3.client("s3", region_name="us-east-1")
bucket_name = ”samplebucket”
filename = "/resources/website/core.css"
S3API.upload_file(filename, bucket_name, "core.css", 
ExtraArgs={'ContentType': "text/css", "CacheControl": 
"max-age=0"})

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 22

22
GET object
Use the GET object operation to retrieve objects from Amazon S3
GET the complete object
GET a range of bytes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 23

23

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 24

24
Versioning
•It is a way to keep multiple variants of an 
object in the same bucket.
•It is a way to recover from unintended user 
actions and application failures.
•In versioning-enabled S3 buckets, each 
object has a version ID.
•After versioning is enabled, it can only be 
suspended (it can’t be disabled).
•Versioned buckets support object locking.
S3 bucket with 
versioning enabled
Object Key = photo.gif
PUT
Object Key = photo.gif ID = 
111111
Object Key = photo.gif ID = 
121212

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
DELETE object: Versioning disabled

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
DELETE object: Versioning enabled

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 27

27
Section 4 key 
takeaways
•Objects in S3 buckets have two types of 
metadata:
• System-defined metadata
• User-defined metadata
•Amazon S3 has three operations:
• PUT
• GET
• DELETE
•S3 bucket versioning protects objects.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 28

28
Section 5: Protecting data and managing 
access to Amazon S3 resources
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 29

29
Data encryption
Securing data in transit
• SSL/TLS-encrypted endpoints with HTTPS
• Client-side encryption of data before 
transmission
Securing data at rest
• Client-side encryption
• Server-side encryption
• Amazon S3-managed keys (SSE-S3)
• AWS KMS-managed keys (SSE-KMS)
• Customer-provided keys (SSE-C)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 30

30
Identity-based policies and resource-based policies
Identity-based policies
Resource-based policies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 31

31
Access control lists (ACLs) 
• Resource-based access policy to manage access at the object level or bucket level
• Use to grant basic read/write permissions to other AWS accounts

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 32

32
Bucket policies
An IAM policy 
language option that 
grants granular 
permissions to 
Amazon S3 
resources
{
 "Version":"2012-10-17",
 "Statement": [
 {
 
"Effect":"Allow”,
 
 
"Principal": "*",
 
"Action":["s3:GetObject"],
 
 
"Resource":["arn:aws:s3:::DOC-EXAMPLE-BUCKET/*"]
 }
 ]
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 33

33
Presigned URLs
• Provide access to PUT or GET objects 
without granting permissions to perform 
any other actions
• Use the permissions of the user who 
creates the URL
• Provide security credentials, a bucket 
name, an object key, an HTTP method, 
and an expiration date and time
• Are only valid until the expiration time 
(maximum of 1 week)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Cross-origin resource sharing (CORS)
Cross-origin resource 
sharing (CORS) defines a 
way for client web 
applications that are 
loaded in one domain to 
interact with resources 
that are in a different 
domain.
JavaScript in webpage 
http://www.example.com
Enable CORS to allow 
JavaScript to access 
resources in S3 bucket
Website hosted in the S3 
bucket at 
website.s3.amazonaws.com
[
 
{
 
 
"AllowedOrigins": [“”],
 
 
"AllowedMethods": ["GET"],
 
 
"MaxAgeSeconds": 3000,
 
 
"AllowedHeaders": [""]
 
}
]

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 35

35
Section 5 key 
takeaways
•S3 buckets can be encrypted.
•Amazon S3 has two types of policies for bucket 
access:
• Identity-based policies
• Resource-based policies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 36

36
Lab 3.1: 
Working with 
Amazon S3

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 37

37
Lab: Tasks
1. Connecting to an IDE and configuring the environment
2. Creating an S3 bucket by using the AWS CLI
3. Setting a bucket policy on the bucket by using the SDK for Python
4. Uploading objects to the bucket to create the website
5. Testing access to the website
6. Analyzing the website code

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 38

38
Begin Lab 3.1: 
Working with 
Amazon S3
~ 60 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 39

39
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 40

40
Module wrap-up
Module 3: Developing Storage Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
Module summary 
In summary, in this module, you learned how to do the following:
• Describe how Amazon S3 can be used as a storage solution
• Identify features and components of Amazon S3
• Describe two ways to protect data in Amazon S3
• Describe the function of S3 object operations
• Explain how to manage access to Amazon S3 resources
• Develop with Amazon S3 by using the AWS SDKs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 42

42
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 43

43
Sample exam question
Company salespeople upload their sales figures daily. A solutions architect needs a durable storage solution for 
these documents that also protects against users accidentally deleting important documents.
Which action will protect against unintended user actions?
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Durable storage solution
•
protects against users accidentally deleting

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 44

44
Sample exam question: Response choices
Company salespeople upload their sales figures daily. A solutions architect needs a durable storage solution for 
these documents that also protects against users accidentally deleting important documents.
Which action will protect against unintended user actions?
Choice
Response
Store data in an EBS volume and create snapshots once a week.
Store data in an S3 bucket and enable versioning.
Store data in two S3 buckets in different AWS Regions.
Store data on EC2 instance storage.
A
B
C
D

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 45

45
Sample exam question: Answer
The correct answer is B.
Choice
Response
Store data in an EBS volume and create snapshots once a week.
Store data in an S3 bucket and enable versioning.
Store data in two S3 buckets in different AWS Regions.
Store data on EC2 instance storage.
A
B
C
D

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 46

46
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
