# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M06-APIGateway

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M06-APIGateway.pdf` | จำนวนหน้าทั้งหมด: 101 หน้า

---

## Slide Page 1

1
Module 6: Developing REST APIs
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to do the following:
• Recognize APIs
• Describe Amazon API Gateway
• Indicate the steps for developing REST APIs with API Gateway
• Use API Gateway to create, publish, maintain, monitor, and secure APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1.
Introduction
2.
Introducing APIs
3.
Introducing API Gateway 
4.
Creating a REST API
5.
Integrating with API Gateway
6.
Deploying an API
7.
Controlling access to a REST API
8.
Monitoring a REST API
9.
Optimizing API Gateway
Lab
Developing REST APIs with Amazon API 
Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 5

5
Café business requirement
Product information for the café is now being stored in a database, and Sofía wants to use an API to 
integrate the website with the database. She wants to test the front end and get approval from Frank and 
Martha before completing the full integration.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
REST APIs as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Section 2: Introducing APIs
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 8

8
What is an API? 
An API is a software mechanism that simplifies development by doing the 
following: 
Abstracting 
implementation 
details 
Exposing only objects 
or actions that a 
developer needs
Establishing how an 
information provider 
and an information 
user communicate

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 9

9
A typical application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 10

10
Requests and responses

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 11

11
What is a RESTful API?
Representational State Transfer 
(REST)
• Architectural style
• Standard way of structuring requests 
from a client to a server
RESTful API
• An API that adheres to REST principles

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 12

12
Section 2 key 
takeaways
• APIs simplify development by abstracting 
implementation details and providing a shared 
definition of how to communicate with an 
application.
• Clients send requests to an API and get a 
response back. 
• REST is a standard way to structure API 
requests.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 13

13
Section 3: Introducing API Gateway
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 14

14
An API gateway is a proxy

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 15

15
What is Amazon API Gateway?

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 16

16
API Gateway supported protocols
RESTful
• Request/response
• HTTP methods (GET, POST)
• Short-lived communication
• Stateless
WebSockets
• Two-way communication channel
• Long-lived communication
• Stateful

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 17

17
RESTful APIs in API Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 18

18
Two types of RESTful APIs in API Gateway
•REST API
•Gives the developer full control 
over API requests and responses 
•Supports features that are not yet 
available in HTTP APIs
•HTTP API
•Simplifies the development of APIs 
that require only API proxy 
functionality
•Designed for the lowest cost and 
lowest latency

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 19

19
WebSocket APIs in API Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 20

20
WebSockets are bidirectional

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 21

21
More efficient for chatty applications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 22

22
API Gateway management
Develop
AWS Management 
Console
AWS Command Line 
Interface (AWS CLI)
OpenAPI Specification 
(Swagger)
Deploy
AWS Serverless Application Model 
(AWS SAM)
AWS CloudFormation
AWS Cloud Development Kit 
(AWS CDK)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 8 รายการ]


---

## Slide Page 23

23
Section 3 key 
takeaways
• Amazon API Gateway is a fully managed 
service that provides API proxy and 
simplifies API development.
• API Gateway supports RESTful and 
WebSocket APIs.
• API Gateway integration with AWS services 
frees developers from writing integration 
code.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 24

24
Section 4: Creating a REST API
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
Creating a REST or HTTP API 
Create an API in API Gateway:
• Use the AWS CLI
• Use the API Gateway console
Base structure for REST and HTTP APIs
https://{restapi_id}.execute-api.{region}.amazonaws.com/{stage_name}/ 
{restapi_id}
API identifier
{region} 
The AWS Region
{stage_name} 
Stage name of the API 
deployment

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 26

26
Example: Creating an HTTP API that is connected to a Lambda 
function
With the AWS CLI
aws apigatewayv2 create-api \
 
 
--name my-api \
 
 
--protocol-type HTTP \
 
 
--target 
arn:aws:lambda:us-east-
2:123456789012:function:function-name
With the console
1.
Open the API Gateway console.
2.
Choose Build on the HTTP panel. 
• If any APIs already exist, the console 
displays a list of existing APIs and an 
option to create an API. Choose Create 
API. Then choose Build on the HTTP API 
panel. 
3.
Choose Add integration, and choose a 
Lambda function in the same Region as 
the API that you are creating. 
4.
Enter a name for your API.
5.
Choose Review and Create.
6.
Choose Create.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 27

27
Methods and routes
#To get all products
[GET] https://api-id.execute-api.us-east-2.amazonaws.com/products
#To get a specific product by ID (34)
[GET] https://api-id.execute-api.us-east-2.amazonaws.com/products/34
#To update (replace) a specific product by ID (34)
[PUT] https://api-id.execute-api.us-east-2.amazonaws.com/products/34
BODY #some keys and values

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 28

28
Creating GET routes
aws apigatewayv2 create-route \
 
 
--api-id 03z50l670a \
 
 
--route-key 'GET /products/{product_id}' \
 
 
--target arn:aws:lambda:us-east-2:123456789012:function:readFn
 
 
#and for the "all" products
aws apigatewayv2 create-route \
 
 
--api-id 03z50l670a \
 
 
--route-key 'GET /products' \
 
 
--target arn:aws:lambda:us-east-2:123456789012:function:updateFn

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 29

29
Creating a PUT route
aws apigatewayv2 create-route \
 
 
--api-id 03z50l670a \
 
 
--route-key 'PUT /product/{product_id}' \
 
 
--target arn:aws:lambda:us-east-2:123456789012:function:updateFn

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 30

30
Using the greedy path variable {proxy+}
aws apigatewayv2 create-route \
 
 
--api-id 03z50l670a \
 
 
--route-key 'GET /products/{proxy+}' \
 
 
--target arn:aws:lambda:us-east-2:123456789012:function:readFn
 
 
API Gateway
readFn

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 31

31
Creating a WebSocket API
aws apigatewayv2 create-api \
    --name "myWebSocketApi" \
    --protocol-type WEBSOCKET \
    --route-selection-expression '$request.body.action'
JSON 
message
{
    "service" : "chat",
    "action" : "join",
    "data" : {
        "room" : "room1234"
   }
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 32

32
Importing an API

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 33

33
Section 4 key 
takeaways
• You can create APIs by: 
• Using the AWS CLI 
• Using the API Gateway console 
• Importing an OpenAPI definition
• As a best practice, use different paths to 
perform different actions and connect to 
different backend integrations.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Section 5: Integrating with API Gateway
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 35

35
Endpoint types

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 36

36
Using client-side SDKs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 37

37
Backend integrations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 38

38
Example integration flow

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 39

39
Lambda non-proxy vs. proxy integration

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 40

40
Example standard response in non-proxy integration
Lambda function 
response
{ "message": "Hello from Lambda!" }
API Gateway 
standard response 
in non-proxy 
integration
{
  "isBase64Encoded": false,
  "statusCode": 200,
  "body": "{ \"message\": \"Hello from Lambda!\" }",
  "headers": {
    "content-type": "application/json"
  }
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
Example Lambda error response in proxy integration
{ "message": "You are not allowed to see 
this content" }
{
    "cookies" : ["cookie1", "cookie2"],
    "isBase64Encoded": true,
    "statusCode": 403,
    "headers": { "headername": "headervalue", ... },
    "body": "You are not allowed to see this content"
} 
Lambda customized 
response in a proxy 
integration
Lambda 
permissions error 
message

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 42

42
Modifying requests and responses in a non-proxy integration

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 43

43
Example: Modifying a request by using VTL
Before transformation
{
    "firstname": "John",
    "lastname": "Stiles", 
    "phone": "555-555-5555"
    "city": "Miami", 
    "state": "Florida",
    "favoritePizza": "pineapple"
}
After transformation
{
    "name": "John Stiles",
    "phone": "555-555-5555",
    "address":{
        "city": "Miami", 
        "state": "Florida"
    }
    "favoritePizza": "Hawaiian"
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 44

44
Transforming the response
Before VTL transformation
{
   "message": "Hello from Lambda",
}
After VTL transformation
{
    "cookies": […"],
    "isBase64Encoded": false,
    "statusCode": 200,
    "headers": [... ],
    "body": "Hello from Lambda"
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 45

45
First-class integrations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 46

46
Example: First-class integration
aws apigatewayv2 create-integration \
    --api-id abcdef123 \
    --integration-subtype SQS-SendMessage \
    --integration-type AWS_PROXY \
    --payload-format-version 1.0 \
    --credentials-arn arn:aws:iam::123456789012:role/apigateway-
sqs \
    --request-parameters '{"QueueUrl": 
"$request.header.queueUrl", "MessageBody": 
"$request.body.message"}'
Connect an HTTP API 
route to an AWS service 
API
You provide the 
mapping that the 
service requires

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 47

47
HTTP proxy integrations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 48

48
Private integrations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 49

49
Example: Creating a private integration
aws apigatewayv2 create-integration \
 
 
--api-id api-id 
    --integration-type HTTP_PROXY \
    --integration-method GET \
    --connection-type VPC_LINK \
    --connection-id VPC-link-ID \
    --integration-uri arn:aws:elasticloadbalancing:us-east-
2:123456789012:listener/app/my-load-
balancer/50dc6c495c0c9188/0467ef3c8400ae65
    --payload-format-version 1.0

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 50

50
Transforming requests and responses

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 51

51
Transforming requests and responses

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 52

52
Example request transformation
aws apigatewayv2 create-integration \
    --api-id abcdef123 \
    --integration-type HTTP_PROXY \
    --payload-format-version 1.0 \
    --integration-uri 'https://api.example.com' \
    --integration-method ANY \
    --request-parameters '{ "append:header.header1": "$context.requestId" 
}'

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 53

53
Section 5 key 
takeaways
• API Gateway simplifies the work to 
integrate with AWS services from your 
client applications.
• Use Lambda proxy and HTTP proxy 
integrations for simple passthroughs to 
backend services.
• Use transformation options to modify 
requests and responses between clients 
and targets.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 54

54
Section 6: Deploying an API
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 55

55
Deployments are associated to a stage
•​Stages are snapshots of an API:
• Named as you like
• Identified by API ID and stage name
• ​Included in the URL that is used to invoke the API
•Developers create multiple stages to: 
• ​Differentiate versions for development environments (like dev and prod)
• Connect different stages to different backends by using stage variables
• ​Optimize a particular deployment—for example, enabling caching or throttling per 
stage

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 56

56
Using stages as development environments
dev stage
Version 1.0.3: For your eyes only
{
  ----------: {----,
  ******: ***,
     ------: ------,
   },
   --------:,
   ***: [----
    -------
   ],
   -----: {
    "/": {
----: {
        ---------: [
           ------
•
Code updates
•
Refactoring
https://api-id.execute-api.us-east-
2.amazonaws.com/dev/products
prod stage
Version 1.0.2: Live to customers
{
  ----------: {----,
     ------: ------,
   },
   --------: ----,
   -----: [
    -------
   ],
   -----: {
    "/": {
      ----: {
        ---------: [
           ------
https://api-id.execute-api.us-east-
2.amazonaws.com/prod/products
xxxxx
xxxxx

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 57

57
Connecting to different backends by using stage variables

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 58

58
Using canary deployments

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 59

59
Updating canary deployments

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 60

60
Section 6 key 
takeaways
• Stages are snapshots of an API version and 
are required to deploy your API.
• You can use stages to differentiate 
deployments for different development 
environments or backends.
• Use canary deployments to test out an API 
by sending a percentage of traffic to a new 
version.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 61

61
Section 7: Controlling access to a REST API
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 62

62
Protecting APIs from unwanted traffic

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 63

63
IAM resource policies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 64

64
Custom domains for certificates
https://12345.execute-api.us-east-1.amazonaws.com/prod
https://*.mydomain.com/api-one
Secure Sockets Layer (SSL) 
certificates managed 
through AWS Certificate
Manager (ACM)
Supports wildcard (*) 
domains
Supports multiple domains 
through base path 
mapping

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 65

65
Client certificates
API Gateway
ACM Certificate authority
EC2 instances
•Generate a client-side SSL 
certificate by using API Gateway
•The backend verifies the request 
that comes from API Gateway by 
using a public key
•Expires after 365 days

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 66

66
AWS WAF
•Protect APIs from common web 
exploits like SQL injection and 
cross-site scripting (XSS)
•Matches a specified string or 
regular expression patterns
•Blocks requests based on 
origination from:
• Specified IP address ranges
• A specific country or region
• Specific user agents, bad bots, and 
content scrapers

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 67

67
CORS prevents cross-origin requests

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 68

68
Cross-origin requests with CORS support

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 69

69
API Gateway with CORS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 70

70
Account-level rate limiting (throttling)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 71

71
Stage and method or route throttling

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 72

72
Throttling by client with a usage plan

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 73

73
Throttling by client and method

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 74

74
How API Gateway applies throttling

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 75

75
Authorizing API access

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 76

76
Controlling authentication and authorization to REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 77

77
Example: Updating an existing route to use Amazon Cognito user 
pools
1. Create the 
authorizer
aws apigatewayv2 create-authorizer \
    --name authorizer-name \
    --api-id api-id \
    --authorizer-type JWT \
    --identity-source '$request.header.Authorization' \
    --jwt-configuration Audience=audience,Issuer=https://cognito-
idp.us-east-2.amazonaws.com/userPoolID
2. Update the route 
to use it
aws apigatewayv2 update-route \   
 
 
--api-id api-id  \  
    --route-id route-id  \  
    --authorization-type JWT \   
    --authorizer-id authorizer-id \   
    --authorization-scopes user.id user.email

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 78

78
Lambda authorizers
Function payload without 
authorization information
{
  "context": {
    "exampleKey": "exampleValue"
  }
}
Function payload with 
authorization information 
{
  "isAuthorized": true/false,
  "context": {
    "exampleKey": "exampleValue"
  }
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 79

79
Section 7 key 
takeaways
• API Gateway supports the following 
protections from unwanted traffic:
• Resource policies
• Client certificates
• AWS WAF
• CORS
• Throttling
• API Gateway supports the following 
options for authorizing access to resources:
• IAM
• JWT-based authorizers
• Lambda authorizers

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 80

80
Section 8: Monitoring a REST API
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 81

81
API Gateway default metrics and logging options for REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 82

82
Creating access logs
1. Create log group
aws logs create-log-group \
 
--log-group-name my-log-group
2. Set up access 
logging on a 
stage
aws apigatewayv2 update-stage \
 
--api-id abcdef \
    --stage-name '$default' \
    --access-log-settings '{"DestinationArn": 
"arn:aws:logs:region:account-id:log-group:my-log-
group", "Format": "$context.identity.sourceIp - - 
[$context.requestTime] \"$context.httpMethod 
$context.routeKey $context.protocol\" 
$context.status $context.responseLength 
$context.requestId"}'

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 83

83
Other monitoring tools
AWS X-Ray
Trace and analyze requests from 
end to end
AWS Config
Assess, audit, and evaluate 
configuration updates
AWS CloudTrail
Maintain a record of actions that a 
user, role, or AWS service takes on 
API Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 84

84
Section 9: Optimizing API Gateway
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 85

85
Caching

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 86

86
Payload compression
Use payload compression to reduce the size of the 
client payload.
Choose a supported content coding (deflate, 
gzip, or identity).
Set a minimumCompressionSize to tell API 
Gateway when to apply compression to a payload.
Submit API requests with a compressed payload 
and an appropriate Content-Encoding 
header.
Test your payload settings to make sure that 
compression and decompression improve 
performance.
aws apigateway update-rest-api \
    --rest-api-id 1234567890 \
    --patch-operations 
op=replace,path=/minimumCompressio
nSize,value=0
Minimum compression 
value of zero = compress all 
payloads

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 87

87
Compression example
Uncompressed 
client payload
{
  "type": "dog",
  "price": 249.99
}
Compressed with 
gzip
呸呸呸
RPP*呸,HU呸RPJ呸OW呸呸
e&呸呸呸
L,呸,-y呸j

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 88

88
Lab 6.1: 
Developing REST APIs 
with Amazon API 
Gateway

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 89

89
Lab: Scenario
In the previous lab, you played the role of Sofía to build a web application for 
the café. As part of this process, you created a DynamoDB table named 
FoodProducts to store information about café menu items. You also loaded 
data into the table and configured code to extract unique items from the 
table. 
In this lab, you continue to play the role of Sofía. You add the ability to query 
menu information from the database table through REST API calls. For the 
initial development, you use mock data endpoints.
In the next lab, you will replace the mock endpoints with real endpoints, 
which the web application will use to connect to the DynamoDB backend.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 90

90
Lab: Tasks
1. Preparing the development environment
2. Creating the first API endpoint (GET)
3. Creating the second API endpoint (GET)
4. Creating the third API endpoint (POST)
5. Deploying the API
6. Updating the website to use the APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 91

91
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 92

92
Begin Lab 6.1: 
Developing REST APIs 
with Amazon API 
Gateway
~ 120 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 93

93
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 94

94
Module wrap-up
Module 6: Developing REST APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 95

95
Module summary
In summary, in this module, you learned how to do the following:
• Recognize APIs
• Describe API Gateway
• Indicate the steps for developing REST APIs with API Gateway
• Use API Gateway to create, publish, maintain, monitor, and secure APIs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 96

96
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 97

97
Sample exam question
A developer is building a web application that uses API Gateway. The developer wants to maintain different 
environments for development and production (dev and prod) workloads. The API will be backed by a Lambda 
function with two aliases: one for dev and one for prod.
How can the developer achieve this result with the LEAST amount of configuration?
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Different environments
•
Dev and prod
•
Lambda function with two aliases

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 98

98
Sample exam question: Responses
A developer is building a web application that uses API Gateway. The developer wants to maintain different 
environments for development and production (dev and prod) workloads. The API will be backed by a Lambda 
function with two aliases: one for dev and one for prod.
How can the developer achieve this result with the LEAST amount of configuration?
Choice
Response
A
Create a REST API for each environment, and integrate the APIs with the corresponding dev and prod aliases of the Lambda function. 
Then, deploy the two APIs to their respective stages, and access them by using the stage URLs.
B
Create one REST API, and integrate it with the Lambda function by using a stage variable in place of an alias. Then, deploy the API to 
two different stages—dev and prod—and create a stage variable in each stage with different aliases as the values. Access the API by 
u\sing the different stage URLs.
C
Create one REST API, integrate it with the dev alias of the Lambda function, and deploy it to a dev environment. Configure a canary 
release deployment for prod where the canary will integrate with the Lambda prod alias.
D
Create one REST API, integrate it with the prod alias of the Lambda function, and deploy it to a prod environment. Configure a canary 
release deployment for dev where the canary will integrate with the Lambda dev alias.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 99

99
Sample exam question: Answer
The correct answer is B.
Choice
Response
A
Create a REST API for each environment, and integrate the APIs with the corresponding dev and prod aliases of the Lambda function. 
Then, deploy the two APIs to their respective stages, and access them by using the stage URLs.
B
Create one REST API, and integrate it with the Lambda function by using a stage variable in place of an alias. Then, deploy the API to 
two different stages—dev and prod—and create a stage variable in each stage with different aliases as the values. Access the API by 
u\sing the different stage URLs.
C
Create one REST API, integrate it with the dev alias of the Lambda function, and deploy it to a dev environment. Configure a canary 
release deployment for prod where the canary will integrate with the Lambda prod alias.
D
Create one REST API, integrate it with the prod alias of the Lambda function, and deploy it to a prod environment. Configure a canary 
release deployment for dev where the canary will integrate with the Lambda dev alias.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 100

100
Additional resources
• Videos: Serverlessland.com videos about API Gateway 
• AWS whitepaper: Security Overview of Amazon API Gateway
• AWS Compute Blog: Announcing HTTP APIs for Amazon API Gateway
• FAQ: Amazon API Gateway FAQs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 101

101
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
