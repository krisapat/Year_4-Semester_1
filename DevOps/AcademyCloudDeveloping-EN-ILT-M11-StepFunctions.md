# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M11-StepFunctions

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M11-StepFunctions.pdf` | จำนวนหน้าทั้งหมด: 56 หน้า

---

## Slide Page 1

1
Module 11: Defining Workflows to 
Orchestrate Functions
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
At the end of this module, you should be able to do the following:
• Recognize the dynamics of workflow coordination in distributed applications
• Describe AWS Step Functions
• Identify state types
• Indicate common use cases for Step Functions
• Recall Step Functions API operations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1.
Introduction
2.
Coordinating tasks in distributed applications
3.
Introducing Step Functions
4.
State types
5.
Step Functions use cases
6.
Step Functions API
Demonstration
• Creating Simple Calculators by Using Step 
Functions
Lab
• Lab: Orchestrating Serverless Functions with Step 
Function

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 5

5
Café business requirement
Now that the coffee inventory is automatically updated on the café website, 
Frank would like to be able to request reports with the latest inventory 
information. Sofía thinks she can use Step Functions to coordinate the steps 
to generate a report.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Step Functions as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Section 2: Coordinating tasks in distributed 
applications
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 8

8
Microservices architecture for distributed applications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 9

9
Challenges with distributed applications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 10

10
Section 2 key 
takeaways
• Microservices are smaller, independent 
components that make up an application in 
modern cloud architecture.
• You can use microservices to quickly deploy, 
scale, and update application components.
• A coordination layer is necessary to handle 
automatic scaling, errors, and timeouts.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 11

11
Section 3: Introducing Step Functions 
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 12

12
AWS Step Functions
AWS Step Functions
Serverless orchestration service that you can use to 
combine Lambda functions and other AWS services 
to build critical applications
•Coordinates components of distributed applications 
and microservices by using visual workflows
•Automatically triggers and tracks each step, and retries 
when errors occur
•Logs the state of each step

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 13

13
Benefits of Step Functions
Productivity
Build and update 
applications quickly
Agility
Scale and
recover reliably
Resiliency
Evolve applications
easily

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 14

14
Workflow options
Run tasks in sequence
Run tasks in parallel
Select a task based on data
Manage try-catch-finally
behavior
Retry failed tasks

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 15

15
How Step Functions works
• You define your workflow (or state 
machine) as a series of steps (or states) 
and transitions.
• Tasks do all of the work in a state 
machine.
• Each state machine starts with an input. 
The state transforms the input and 
passes the output to the next state.
• You can visualize and track workflows in 
the Step Functions console.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 16

16
Defining and visualizing workflows
Define the workflow in JSON by using the Amazon 
States Language
{
  "Comment": "A Hello World Example",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Pass",
      "Result": "Hello World!",
      "End": true
    }
  }
}
Visualize the workflow in the 
Step Functions console
Start
HelloWorld
End

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 17

17
Running state machines
{
  "Comment": "A Hello World Example",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Pass",
      "Result": "Hello World!",
 
"Next": "NextState"
    }
 
"NextState": {
      "Type": "Action",
      "Resource": "arn:aws:lambda...",
 
"End": true
    }
  }
}
Running the 
state machine 
starts here
(required)
State type 
(required)
The next state that is run 
when the current state 
finishes
State ends if set 
to true

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 18

18
Section 3 key 
takeaways
• Step Functions is a service that you can use to 
coordinate components of distributed 
applications and microservices by using visual 
workflows.
• A state machine is an object that has a set 
number of operating conditions that depend 
on the object’s previous condition to 
determine the output.
• State machines are defined by using the 
Amazon States Language.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 19

19
Section 4: State types
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 20

20
State types
Task
A single unit of work
Choice
Adds branching logic to a state machine
Fail
Stops running a state and marks it as a failure
Succeed
Stops running a state successfully
Pass
Passes its input to its output, without performing work
Wait
Delays from continuing for a specified time
Parallel
Creates parallel branches for running states
Map
Dynamically iterates steps

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 21

21
Task state
Amazon Elastic
Compute Cloud
(Amazon EC2)
Amazon Elastic
Container Service
(Amazon ECS)
"ActivityState": { 
 
"Type": "Task",
 
"Resource": "arn:aws:states:us-east-1:123456789012:activity:HelloWorld", 
 
"TimeoutSeconds": 300, 
 
"HeartbeatSeconds": 60, 
 
"Next": "NextState" 
   }
Lambda
function
"LambdaState": { 
 
"Type": "Task", 
 
"Resource": "arn:aws:lambda:us-east-1:123456789012:function:HelloWorld", 
 
"Next": "NextState" 
   }

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 22

22
Choice state

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 23

23
Fail and Succeed states
"FailState": { 
 
"Type": "Fail", 
 
"Cause": "Invalid response.", 
 
"Error": "ErrorA" 
}
Fail state
"SuccessState": { 
 
"Type": "Succeed" 
}
Succeed state

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 24

24
Pass state
"No-op": { 
 
"Type": "Pass", 
 
"Result": { 
 
"x-datum": 0.381018,
 
"y-datum": 622.2269926397355 
 
},
 
"ResultPath": "$.coords",
 
"Next": "End" 
}
Start
No-op
End

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
Wait state
"wait_ten_seconds": { 
 
"Type": "Wait", 
 
"Seconds": 10, 
 
"Next": "NextState" 
}
Start
StartState
WaitState
FinalState or 
NextState
End

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
Parallel state
"LookupCustomerInfo": { 
 
"Type": "Parallel", 
 
"Branches": [ 
 
 { 
 
 
"StartAt": "PState1", 
 
 
"States": { 
 
 
 
"PState1": {…} 
 
 
} 
 
 }, 
 
 { 
 
 
"StartAt": "PState2",
 
 
"States": { 
 
 
 
"PState2": {…} 
 
 
 
 
 
} 
 
 } 
 
], 
 
"Next": "NextState" 
}
Required
Start
StartState
PState1
PState2
FinalState
End

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 27

27
Map state
"Validate-All": { 
  "Type": "Map", 
  "InputPath": "$.detail", 
  "ItemsPath": "$.shipped", 
  "MaxConcurrency": 0, 
  "Iterator": { 
    "StartAt": "Validate", 
    "States": { 
      "Validate": { 
        "Type": "Task", 
        "Resource": "arn:aws:lambda:us-east-1:123456789012:function:ship-val",
        "End" : true
      }  
    } 
  }, 
  "ResultPath": "$.detail.shipped", 
  "End": true 
}
Iterator (required)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 28

28
Section 4 key 
takeaways
• Individual states can make decisions based on 
their input, perform actions, and pass and 
manipulate output to other states.
• Add branching logic to a state machine by 
adding a Choice state.
• Run multiple functions concurrently by using 
the Parallel state.
• Succeed and Fail states do not require an End 
field.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 29

29
Section 5: Step Functions use cases
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 30

30
Standard and Express workflows
Standard
Express
Invocation Rate
2,000 per second
100,000 per second
Transition Rate
4,000 per second
Nearly unlimited
Pricing
Per state transition
Per number and duration of 
requests for your workflow
Step Functions Activities
Supports Step Functions activities
Does not support Step Functions 
activities
Integrations and Patterns Support
Supports all service and 
integration patterns
Supports all service integrations 
and most patterns

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 31

31
Standard workflows
•Ideal for long-running, auditable workflows
•Can run for up to 1 year
•Employ an exactly-once model
•Never run more than once unless the Retry 
behavior is specified in ASL
•Are billed according to the number of processed 
state transitions
AWS Step 
Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 32

32
Express workflows
•Ideal for high-volume, event-processing 
workloads
•Can run for up to 5 minutes
•Employ an at-least-once (asynchronous) or at-
most-once (synchronous) model
•An invocation can run more than once
•Are billed according to number and duration of 
requests, and memory that is consumed
AWS Express
Workflows

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 33

33
Step Functions use cases
• Process data
• Automate tasks
• Modernize a monolithic application
• Orchestrate an application
• Transcode media files
• Sequence batch processing jobs
• Send messages from automated workflows
• Publish events from serverless workflows
• Coordinate container tasks in microservices and serverless applications
• Access databases from serverless workflows
• Sequence steps of machine learning (ML) workflows
• Coordinate extract, transform, and load (ETL) jobs
AWS Step 
Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 34

34
Step Functions use case example: Manual approval

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 35

35
Use case example (continued)
{
    "Comment": "Employee promotion process", 
    "StartAt": "ManualApproval", 
     "States": { 
 
"ManualApproval": { 
 
    "Type": "Task", 
 
    "Resource": "arn:aws:states:us-east-1:ACCOUNT_ID:activity:ManualStep", 
    "TimeoutSeconds": 3600, 
 
    "End": true 
 
} 
     } 
}

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 36

36
Step Functions use case example: Machine learning workflow
Start
Build 
training
Wait
Train 
model
Wait
Build 
inference
Wait
Create 
model
Create 
endpoint 
config
Create 
endpoint 
config
Wait
Send success 
notification

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 37

37
Section 5 key 
takeaways
•Activities are a Step Functions feature that 
associate code with a specific task in a state 
machine.
•A taskToken is a token that represents a 
specific task that Step Functions generates 
when a task is assigned to a worker.
•An activity worker can run on any application 
that is able to make an HTTP connection.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 38

38
Section 6: Step Functions API
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 39

39
Step Functions API
Create
Upload state machines that are defined in JSON.
Register activity workers.
StartExecution
Return an Amazon Resource Name (ARN) that 
identifies the run.
StopExecution
Return the date that the state machine stopped.
List
List all state machines, runs, and activities.
Describe
Describe individual state machines, runs, and 
activities.
GetExecutionHistory
Get the history of a state machine run as a list of 
events.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 40

40
Step Functions quotas
•General quotas (for example, names in Step Functions)
•Quotas that are related to:
• Accounts (for example, maximum number of registered state machines or API actions)
• State machine runs (for example, maximum runtime)
• Task runs (for example, maximum task runtime)
• API action throttling 
• State throttling
•Quotas might differ between Standard and Express workflows

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
Section 6 key 
takeaways
•You can access Step Functions by using the 
AWS Management Console, AWS SDKs, or API.
•Step Functions places quotas on the size of 
certain state machine parameters.
•Use API Gateway to associate your Step 
Functions APIs with methods in an API 
Gateway API.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 42

42
Demonstration: 
Creating Simple 
Calculators by Using 
Step Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 43

43
Lab 11.1: 
Orchestrating 
Serverless Functions 
with Step Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 44

44
Lab: Scenario
In this lab, you will build the functionality to create and deliver the coffee 
inventory report using Step Functions.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 45

45
Lab: Tasks
1. Preparing the development environment
2. Configuring an SNS topic and subscribing to it
3. Creating a Step Functions state machine
4. Creating a Lambda function to generate a presigned URL
5. Configuring the REST API to invoke the state machine
6. Configuring a Lambda function to generate an HTML report
7. Adding the GenerateHTML function to the state machine
8. Creating a Lambda function to retrieve supplier records
9. Adding the generateReportData function to the state machine

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 46

46
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 47

47
Begin Lab 11.1: 
Orchestrating Serverless 
Functions with Step 
Functions
~ 90 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 48

48
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 49

49
Module wrap-up
Module 11: Defining Workflows to Orchestrate Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 50

50
Module summary 
In summary, in this module, you learned how to:
• Recognize the dynamics of workflow coordination in distributed applications
• Describe Step Functions  
 
 
• Identify state types 
 
 
 
• Indicate common use cases for Step Functions  
• Recall Step Functions API operations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 51

51
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 52

52
Sample exam question
When a customer submits a request for a credit limit increase, the request is to be processed automatically by 
comparing their request to their credit limit. If the request is more than their preapproved credit limit, Step 
Functions must send the request to a manager for approval. 
Which type of state should be used to accomplish this process?
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Comparing
•
Send the request to a manager

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 53

53
Sample exam question: Responses
When a customer submits a request for a credit limit increase, the request is to be processed automatically by 
comparing their request to their credit limit. If the request is more than their preapproved credit limit, Step 
Functions must send the request to a manager for approval. 
Which type of state should be used to accomplish this process?
Choice
Response
A
Parallel
B
Choice
C
Task
D
Pass

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 54

54
Sample exam question: Answer
The correct answer is B.
Choice
Response
A
Parallel
B
Choice
C
Task
D
Pass

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 55

55
Additional resources
• AWS Machine Learning Blog: Automated and continuous deployment of 
Amazon SageMaker models with AWS Step Functions
• AWS Compute Blog: Implementing Serverless Manual Approval Steps in 
AWS Step Functions and Amazon API Gateway
• AWS Technical Guide: Create a Serverless Content Syndication Pipeline with 
AWS Step Functions
• FAQ: AWS Step Functions FAQs

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 56

56
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
