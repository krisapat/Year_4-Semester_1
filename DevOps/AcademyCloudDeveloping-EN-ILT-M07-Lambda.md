# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M07-Lambda

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M07-Lambda.pdf` | จำนวนหน้าทั้งหมด: 79 หน้า

---

## Slide Page 1

1
Module 7: Developing Event-Driven 
Serverless Solutions
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to:
• Explain serverless computing
• Describe how AWS Lambda works
• Recognize Lambda invocation models
• Identify how to use AWS Identity and Access 
Management (IAM) to grant Lambda permissions
• Indicate the steps to author and configure a Lambda 
function
• Explain how to deploy Lambda functions
• Identify why AWS X-Ray is a critical developer tool
• Create Lambda functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1.
Introduction
2.
Introducing serverless computing
3.
Introducing Lambda
4.
Invoking Lambda functions 
5.
Setting permissions for Lambda
6.
Authoring and configuring Lambda 
functions
7.
Deploying Lambda functions
8.
Monitoring and debugging tools for 
application developers
Demonstration
Using X-Ray with Lambda
Lab
Creating Lambda Functions Using the AWS 
SDK for Python
Knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 5

5
Café business requirement
Sofía finished using the mock endpoints to test the API, and now she wants to launch the dynamic version of 
the café website. She needs to update the API integration to connect to the backend database.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Serverless as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Section 2: Introducing serverless computing
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 8

8
Serverless computing
On premises
•
Heavy capital expense 
•
Guessed capacity 
•
Deployed in months
•
Years of maintenance
•
Low innovation factor
Virtual servers in the cloud
•
Hardware independence
•
Elastic resources and scale
•
Faster provisioning 
•
Reduced maintenance
Containers
•
Platform independence
•
Higher resource utilization
•
Easier and faster deployments
•
Isolation and sandboxing
Serverless
•
No OS instances to manage
•
Flexible scaling
•
Pay per usage
•
Built-in fault tolerance
•
Zero maintenance

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 7 รายการ]


---

## Slide Page 9

9
Building modern serverless applications
Small pieces, 
loosely joined 
Serverless compute 
and event-driven 
patterns
Purpose-built 
data stores
Serverless,
purpose-built data 
stores
Specialized services for 
integration
Managed services for 
integration
Automation by using 
code
Deployment 
frameworks

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 6 รายการ]


---

## Slide Page 10

10
Moving away from a monolithic application
Monolith
Does everything
Microservice
Does one thing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 11

11
Section 3: Introducing Lambda
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 12

12
AWS Lambda
AWS Lambda
Lambda is a serverless compute service that you 
can use to run code without provisioning or 
managing servers.
•
​Invokes your code in response to events
•
​Scales automatically
•
Provides built-in code monitoring and logging 
with Amazon CloudWatch

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 13

13
How Lambda works
Upload your code to 
Lambda or write code in 
the Lambda editor
Set up your code to run 
when events occur in 
other AWS services, at 
HTTP endpoints, or as 
part of in-app activity
 
Lambda runs your code 
only when it is activated 
by an event and uses 
only the compute 
resources that are 
needed
Pay only for the 
compute time that 
you use
!
!
!

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 8 รายการ]


---

## Slide Page 14

14
Lambda features
Offers the ability to 
bring your own code
Offers a flexible 
permissions model
Integrates with and 
extends other AWS services
Provides built-in availability 
and fault tolerance
Offers flexible resource and 
concurrency models
Reduces the need to 
pay for idle resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 8 รายการ]


---

## Slide Page 15

15
Example use cases for Lambda
Web app
Amazon S3
The front-end code for 
the weather app is 
hosted on Amazon S3
Website
A user chooses a link for 
local weather 
information
API Gateway
The app makes a REST 
API call to the endpoint
An endpoint call invokes 
Lambda
Lambda
Lambda runs code to 
get the weather data 
from DynamoDB and 
returns the data
DynamoDB
DynamoDB contains the 
weather data that the 
app uses
Real-time 
stream 
processing
Kinesis
A social media stream is 
loaded into Kinesis in 
real time
Stream events invoke 
Lambda
Lambda
Lambda runs code that 
generates hashtag trend 
data
DynamoDB
Hashtag trend data is 
stored in DynamoDB
Social media trend data 
is immediately available 
for business users to 
query

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 16

16
Lambda functions
Lambda
Access
permissions
Initiating events
Lambda function
Runtime and deployment package
Application 
code
Dependencies
and libraries
Configuration

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 8 รายการ]


---

## Slide Page 17

17
Lambda functions run in on-demand ephemeral environments
Concurrency: The number of function invocations that are running at one time

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 18

18
Section 3 key 
takeaways
•Lambda is a serverless compute service that 
integrates with other AWS services.
•You can use Lambda for many use cases 
including web applications, backends, and data 
processing.
•Lambda functions run in on-demand 
temporary environments.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 19

19
Section 4: Invoking Lambda functions 
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 20

20
Push and pull models
Lambda
Lambda function
(custom code)
Pull (polling) 
event
Push 
event
Lambda polls 
for events and invokes 
the Lambda function 
with batches of records
An AWS service 
directly invokes the
Lambda function

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 21

21
Push event types
Synchronous
/order
API Gateway
Lambda
function
No retry built in
Invoke via API:
RequestResponse
The other service 
waits for a 
response from 
your function.
Asynchronous
3  tries
Amazon S3
Lambda
function
0–2 retries
Invoke via API:
Event
Lambda 
queues the event 
before passing it 
to your function.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 22

22
Pull (polling) event types

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 23

23
Invoking a function synchronously
Invoke
aws lambda invoke \
--function-name my-function \
--payload '{ "name": "Bob" }' \
response.json
Response
{"ExecutedVersion": "$LATEST","StatusCode": 200}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 24

24
Invoking a function asynchronously
Invoke
aws lambda invoke \
--function-name my-function \
--invocation-type Event \
--payload '{ "name": "Bob" }' \
response.json
Ack
{"StatusCode": 202}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
Section 4 key 
takeaways
•Lambda invokes Lambda functions by using 
one of these invocation models:
• Synchronous
• Asynchronous
• Polling (event source mapping)
•Lambda has built-in handling that differs by 
event source type.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
Section 5: Setting permissions for Lambda
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 27

27
Lambda permissions
Event source
Event sources need 
permissions to invoke
a Lambda function
Initiating
event
Lambda function
Lambda functions need 
permissions to interact 
with other services
Allowed
action
AWS service or 
resource

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 28

28
Invocation permissions
An IAM resource policy gives permissions to invoke the function.
Resource policy:
•
Associated with synchronous 
or asynchronous event source
•
Allows the event source to take 
the lambda:InvokeFunction 
action
Initiating event
Lambda function
Amazon S3 bucket

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 29

29
Example resource (function) policy
{
 
"Version": "2012-10-17",
 
"Id": "default",
 
"Statement": [
 
 
{
 
 
 
"Sid": "lambda-fd269e28-988b-4d2b-96ae-eabcd7dc399c",
 
 
 
"Effect": "Allow",
 
 
 
"Principal": {
 
 
 
 
"Service": "s3.amazonaws.com"
 
 
 
},
 
 
 
"Action": "lambda:InvokeFunction",
 
 
 
"Resource": "arn:aws:lambda:function:myFirstFunction",
 
 
 
"Condition": {
 
 
 
 
"ArnLike": {
 
 
 
 
 
"AWS:SourceARN": "arn:aws:s3:::myBucket1"
 
 
 
 
}
 
 
 
}
 
 
}
 
]
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 30

30
Lambda execution role
The Lambda execution role specifies what the Lambda function is permitted to do.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 31

31
Execution role example
IAM policy
{
 
"Effect": "Allow",
 
"Action": [
        
"logs:CreateLogGroup",
        
"logs:CreateLogStream",
        
"logs:PutLogEvents"
    
],
 
"Resource": "arn:aws:logs:*:*:*"
}
Trust policy
{
    "Effect": "Allow",
    "Principal": {
 
 
"Service": "lambda.amazonaws.com"
      },
    "Action": "sts:AssumeRole"
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 32

32
Adding permissions by using the AWS CLI
Give Amazon SNS permissions to 
invoke a function
aws lambda add-permission \
--function-name my-function \
--action lambda:InvokeFunction \
--statement-id sns \
--principal sns.amazonaws.com
Output
{
"Statement":
{
"Sid":"sns",
"Effect":"Allow",
"Principal":{
"Service":"sns.amazonaws.com"
},
"Action":"lambda:InvokeFunction",
"Resource":"arn:aws:lambda:us-east-2:123456789012:function:my-function"
}
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 33

33
Section 5 key 
takeaways
•Lambda functions require permissions to be 
invoked and permissions to interact with other 
services. 
•Both types of permissions are defined by using 
IAM or trust policies.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Section 6: Authoring and configuring Lambda 
functions
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 35

35
The function handler
Handler (event, context) method
Event object
•
Passes event information to the handler
•
Uses a predefined object format for AWS 
integrations and events
•
Can be tested with user-defined custom objects
Context object
•
Passes runtime information to the handler
•
Includes, at a minimum, these methods or 
properties:
•
awsRequestId
•
getRemainingTimeInMillis()
•
logStreamName

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 36

36
Lambda function handler example
event object
{
    "first_name": "John",
    "last_name": "Smith"
}
Handler
def lambda_handler(event, context):
 
message = 'Hello {} {}!'.format(event['first_name'],
 
 
 
 
 
 
 
  event['last_name'])
 
return {
 
 
'message' : message
 
}
response
{
    "message": "Hello John Smith!"
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 37

37
Example testing from the console
Create test 
event
Review results

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 38

38
Performance-related configurations
Configuration
Description
Memory
Set the amount of memory and proportional CPU that is allocated to the function. Lambda allocates CPU power 
linearly in proportion to the memory that you set. Values from 128 MB–10,240 MB.
Timeout
Choose the maximum amount of time to let a function run before ending it if it has not completed. Values from 1 
second up to 15 minutes.
Concurrency
Number of invocations of a function that can run at the same time. By default, you can have 1,000 concurrency 
invocations per Region for an account. This limit is a soft limit. Per function, you can set a limit to prevent 
overwhelming a downstream system or to reserve capacity from within the account pool for the function. 
Provisioned 
concurrency
Number of Lambda environments to keep warm. When Lambda creates the temporary environment for your 
function, it will attempt to reuse it for additional invocations. This approach saves startup time. When Lambda 
must initialize new environments to run a function, an invocation might get a cold start, which creates startup 
latency. Use provisioned concurrency to avoid cold starts. Provisioned concurrency is priced separately. 
Monitoring and 
operations
Settings to enable X-Ray (active tracing) and CloudWatch Lambda Insights (collect and aggregate Lambda function 
runtime performance metrics and logs).

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 39

39
Resource-related configurations
Configuration
Description
Triggers
Event sources that invoke a function.
Permissions
The resources that have permissions to invoke the function and the permissions that the function has to interact 
with other resources.
Destinations
An SNS topic, SQS queue, other Lambda function, or EventBridge event bus. It receives invocation records from a 
function when it is successful (on success) or when it fails (on failure).
Asynchronous 
invocation
Settings for number of retry attempts on async invocations (0–2) and how long to keep an event waiting to be 
invoked (up to 6 hours). Also, configuration of a dead-letter queue for functions that continue to fail. 
VPC
Settings to enable your Lambda function to access resources in a custom VPC. A custom VPC defines a private 
network of resources, such as databases, cache instances, or internal services.
State machines
Step Functions state machines that can invoke your function directly in at least one of the steps.
Database proxies
Settings that are used when connecting to an Amazon Relational Database Service (Amazon RDS) instance. These 
settings are used to set up a database proxy to manage connection pooling for database connections.
File systems
Settings to connect an Amazon Elastic File System (Amazon EFS) file system so that the function can access the file 
system at runtime.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 40

40
Code-related configurations
Configuration
Description
Runtime
Runtime that the function will use or language that the code will be written in. Choose from supported runtimes 
that are listed in the AWS Lambda Developer Guide or use a custom runtime. 
Environment 
variables
Key-value pairs that are accessible from your function code. Environment variables are useful to store 
configuration settings without the need to change function code.
Tags
Labels that you assign to an AWS resource. Each tag consists of a key and an optional value. You can use tags to 
search and filter your resources or track your AWS costs.
Code signing
Option to ensure that code has been signed by an approved source and has not been altered.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
Design a Lambda function: Best practices for a Lambda environment
•Treat functions as stateless.
•Include only what you need.
•Reuse the temporary runtime environment.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 42

42
Design a Lambda function: Best practices for writing code
•Separate the core business logic (outside of the handler method).
•Write modular functions.
•Include logging statements.
•Include results information.
•Use environment variables.
•Avoid recursive code.
•Don't call one function from another.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 43

43
Tuning your function
• Higher memory 
configurations have a 
higher per-1-
millisecond cost but 
might decrease 
duration costs and 
concurrency needs.
• Find the balance that 
optimizes for speed 
and cost.
Example results for two CPU-intensive functions, which become 
cheaper and faster with more power
Source: https://github.com/alexcasalboni/aws-lambda-power-tuning

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 44

44
Section 6 key 
takeaways
•Lambda supports different languages and 
runtimes.
•The function handler is the entry point into the 
Lambda function.
•You can configure attributes including the 
amount of memory and function timeout.
•Follow best coding practices to create efficient 
Lambda functions.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 45

45
Section 7: Deploying Lambda functions
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 46

46
Deployment options
.zip archive
• Choose a runtime when you create the 
function.
• Compress files for application code and 
dependencies, and upload them to 
Lambda.
Container image
• Choose a runtime and linux distribution 
when creating the image.
• Package your code and dependencies as 
a container image.
• Upload the image to your container 
registry that is hosted on Amazon Elastic 
Container Registry (Amazon ECR).

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 47

47
Uploading .zip deployment packages

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 48

48
Deploying as a container image

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 49

49
Versioning
• Immutable copies of Lambda function code 
and configuration
• Create: $LATEST version
• Publish: Snapshot copy of $LATEST
• Each version has its own Amazon Resource Name 
(ARN) with a new sequential version number
Lambda function
(version $LATEST)
arn:aws:lambda:aws-region:acct-id:function:helloworld:$LATEST
arn:aws:lambda:aws-region:acct-id:function:helloworld:1
Snapshot of 
Lambda function
(version 1)
1
Publish

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 50

50
Aliases
• Mutable pointers to versions
• Each alias has its own ARN
Lambda function
(version $LATEST)
Lambda function
(version 2)
2
Lambda function
(version 1)
1
Dev
Test
Prod
Lambda function test alias:
arn:aws:lambda:aws-region:acct-id:function:helloworld:test

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 51

51
Example of using versioning and aliases

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 52

52
Custom runtimes
•With custom runtimes you can use 
other languages in Lambda.
•Lambda provides a runtime 
interface for getting events and 
sending responses.
•The bootstrap file is the runtime's 
entry point.
•You can deploy a custom runtime 
next to your function code or in a 
layer.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 53

53
Lambda layers
Centrally manage code and data that are shared 
across multiple functions
• Reduce the size of deployment packages
• Speed up deployments
• Limits:
• Up to five layers
• 250 MB

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 54

54
Example deploying from the AWS CLI
Create 
function
aws lambda create-function \
--function-name my-function \
--runtime nodejs10.x \
--zip-file fileb://my-function.zip \
--handler my-function.handler \
--role arn:aws:iam::123456789012:role/service-role/MyTestFunction-role-tges6bf4
Output
{
"TracingConfig": {
"Mode": "PassThrough"
},
"CodeSha256": "PFn4S+er27qk+UuZSTKEQfNKG/XNn7QJs90mJgq6oH8=",
"FunctionName": "my-function",
"CodeSize": 308,
"RevisionId": "873282ed-4cd3-4dc8-a069-d0c647e470c6",
"MemorySize": 128,
"FunctionArn": "arn:aws:lambda:us-west-2:123456789012:function:my-function",
"Version": "$LATEST",
"Role": "arn:aws:iam::123456789012:role/service-role/MyTestFunction-role-zgur6bf4",
"Timeout": 3,
"LastModified": "2019-08-14T22:26:11.234+0000",
"Handler": "my-function.handler",
"Runtime": "nodejs10.x",
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 55

55
Example of updating a function from the AWS CLI
Update 
function
aws lambda update-function-code \
--function-name my-function \
--zip-file fileb://my-function.zip
Output
{
"FunctionName": "my-function",
"LastModified": "2019-09-26T20:28:40.438+0000",
"RevisionId": "e52502d4-9320-4688-9cd6-152a6ab7490d",
"MemorySize": 256,
"Version": "$LATEST",
"Role": "arn:aws:iam::123456789012:role/service-role/my-function-role-uy3l9qyq",
"Timeout": 3,
"Runtime": "nodejs10.x",
"TracingConfig": {
"Mode": "PassThrough"
},
"CodeSha256": "5tT2qgzYUHaqwR716pZ2dpkn/0J1FrzJmlKidWoaCgk=",
"CodeSize": 304,
"FunctionArn": "arn:aws:lambda:us-west-2:123456789012:function:my-function",
"Handler": "index.handler"
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 56

56
Section 7 key 
takeaways
•Lambda has built-in versioning so that you can 
create immutable versions of your code.
•You can use aliases to point at different 
versions of your Lambda function.
•Lambda provides popular runtimes, but you 
can create custom runtimes.
•Lambda layers are libraries of code that you 
create and which other Lambda functions can 
call.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 57

57
Section 8: Monitoring and debugging tools 
for application developers
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 58

58
Modern applications challenge traditional monitoring approaches 
Short-lived 
resources
More devices, 
services, and data
Faster release 
velocity
User 
experience

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 6 รายการ]


---

## Slide Page 59

59
Amazon CloudWatch
Amazon 
CloudWatch
CloudWatch collects monitoring and operational data 
in the form of logs, metrics, and events.
• Get a unified view of AWS resources, applications, and 
services
• Review logs as a flow of events ordered by time
• Query log data interactively with CloudWatch Logs Insights
• Use default operational metrics from AWS services
• Alarm based on metric thresholds and initiate automated 
actions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 60

60
Example of Lambda logging

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 61

61
AWS X-Ray
AWS X-Ray
X-Ray traces requests that travel through your 
application and shows a map of your application’s 
underlying component.
• One-click enablement for Lambda functions and integration 
with other AWS services
• X-Ray SDK to capture metadata for API calls that are made 
to AWS services with the AWS SDK
• Visual detection of latency distribution and quick isolation 
of outliers and trends
• Easier debugging of application code
• Filtering and grouping of requests by error type

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 62

62
Parts of an X-Ray trace
Element
Description
Segments
Data about the work done by compute resources that run your application, including: 
•
Resource name
•
Details about the request and the work that is done
•
Subsegments
Subsegments
Breakdown of segment data into greater detail, including: 
•
More granular timing 
•
Details about downstream calls
•
Inferred segments for downstream services
•
Annotations and metadata
Annotations
Key-value pairs that can be indexed and used with filter expressions to group traces in the 
console for easier analysis
Metadata
Key-value pairs of any type that are not indexed but can be used to store data in the trace that 
you won’t use for searching traces

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 63

63
Example X-Ray trace

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 64

64
Demonstration:  
Using X-Ray with 
Lambda

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 65

65
Section 8 key 
takeaways
•Modern applications require more than 
traditional operations monitoring.
•CloudWatch provides built-in logging and 
metrics to monitor your Lambda functions.
•With X-Ray, you can trace requests across your 
application to find trouble spots quickly.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 66

66
Lab 7.1: Creating 
Lambda Functions 
Using the AWS SDK for 
Python

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 67

67
Lab: Scenario
In this lab, you again play the role of Sofía. You replace the mock endpoints 
that you created in the previous lab with real endpoints so that the web 
application can connect to the database. You will use Lambda to make this 
connection between the REST API and the data that is stored in DynamoDB.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 68

68
Lab: Tasks
1. Preparing the development environment
2. Creating the get_all_products Lambda function
3. Configuring the REST API GET method to invoke the Lambda function 
4. Creating the create_report Lambda function
5. Configuring the REST API POST method to invoke the Lambda function
6. Testing the integration by using the café website

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 69

69
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 70

70
Begin Lab 7.1: 
Creating Lambda 
Functions Using the 
AWS SDK for Python
~ 90 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 71

71
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 72

72
Module wrap-up
Module 7: Developing Event-Driven Serverless Solutions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 73

73
Module summary
In summary, in this module, you learned how to:
• Explain serverless computing
• Describe how Lambda works
• Recognize Lambda invocation models
• Identify how to use IAM to grant Lambda permissions
• Indicate the steps to author and configure a Lambda function
• Explain how to deploy Lambda functions
• Identify why X-Ray is a critical developer tool
• Create Lambda functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 74

74
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 75

75
Sample exam question
A developer is testing an application locally and has deployed it to Lambda. To remain under the package size limit, 
they did not include the dependencies in the deployment file. When testing the application remotely, the function 
does not run because of missing dependencies. 
Which approach would best resolve the issue? 
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Under the package size limit
•
Dependencies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 76

76
Sample exam question: Response choices
A developer is testing an application locally and has deployed it to Lambda. To remain under the package size 
limit, they did not include the dependencies in the deployment file. When testing the application remotely, the 
function does not run because of missing dependencies. 
Which approach would best resolve the issue? 
Choice
Response
A
Use the Lambda console editor to update the code and include the missing dependencies.
B
Create an additional .zip file with the missing dependencies, and include the file in the original Lambda deployment package.
C
Add references to the missing dependencies in the Lambda function’s environment variables.
D
Create a layer that contains the missing dependencies, and attach it to the Lambda function.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 77

77
Sample exam question: Answer
The correct answer is D.
Choice
Response
A
Use the Lambda console editor to update the code and include the missing dependencies.
B
Create an additional .zip file with the missing dependencies, and include the file in the original Lambda deployment package.
C
Add references to the missing dependencies in the Lambda function’s environment variables.
D
Create a layer that contains the missing dependencies, and attach it to the Lambda function.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 78

78
Additional resources
•AWS Lambda Developer Guide:
• Best Practices for Working with AWS Lambda Functions 
• Using AWS Lambda with Other Services
• AWS Lambda Execution Environment
• Troubleshooting Issues in Lambda
• Monitoring Functions in the AWS Lambda Console
• Accessing Amazon CloudWatch logs for AWS Lambda
• Using AWS Lambda with AWS X-Ray
•Amazon CloudWatch Logs User Guide: 
• Analyzing Log Data with CloudWatch Logs Insights

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 79

79
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
