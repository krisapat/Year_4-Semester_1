# เอกสารการบรรยาย: AcademyCloudDeveloping-EN-ILT-M09-Cachings

> ไฟล์ต้นฉบับ: `AcademyCloudDeveloping-EN-ILT-M09-Cachings.pdf` | จำนวนหน้าทั้งหมด: 65 หน้า

---

## Slide Page 1

1
Module 9: Caching Information for Scalability
AWS Academy Cloud 
Developing

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 2

2
Section 1: Introduction
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 3

3
Module objectives
This module prepares you to do the following:
• Explain when caching is used
• Describe caching with Amazon ElastiCache 
• Describe caching with Amazon CloudFront 
• Describe and compare Lambda@Edge and 
CloudFront Functions
• Apply caching strategies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 4

4
Module overview
Sections
1. Introduction
2. Caching overview
3. Caching with ElastiCache
4. Caching with CloudFront
5. Caching strategies
Labs
• Caching Application Data with 
ElastiCache
• Implementing CloudFront for Caching 
and Application Security
Knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 5

5
Café business requirement
The café employees have gotten occasional customer feedback that the coffee 
bean inventory information takes too long to display on the café website. 
Sofía wants to reduce the latency and also update the site to support HTTPS 
traffic.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 6

6
Caching as part of developing a cloud application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 7

7
Section 2: Caching overview
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 8

8
Challenges of modern application data

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 9

9
What is caching?

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 10

10
You can cache at all layers

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 11

11
Workloads that benefit from caching
Read-Heavy Workloads
Compute-Intensive Workloads
Benefits
• Reduce latency
• Improve input/output operations per 
second (IOPS)
Benefits
• Manipulate large datasets in real time
Examples
•
Social networking
•
Gaming
•
Media sharing
•
Question and answer (Q&A) portals
Examples
•
Recommendation engines
•
High performance computing (HPC) 
simulations

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 12

12
Factors for considering whether to cache
Is a slow, 
expensive query 
required to 
generate the 
data? 
Is the data 
relatively static 
and frequently 
accessed?
Can the data 
afford to be 
stale?
Will caching be 
worth the 
added 
development 
complexity and 
potential 
costs?

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 6 รายการ]


---

## Slide Page 13

13
Section 2 key 
takeaways
•Modern applications put high demands on the 
performance of data sources in an application.
•Caching can improve performance by serving 
requests from a copy of data (a cache) rather 
than making the request to the origin.
•Caching can occur at all layers of your 
application.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 14

14
Section 3: Caching with ElastiCache
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 15

15
ElastiCache
Amazon
ElastiCache
Fully managed in-memory data store with sub-
millisecond latency
•Key-value, in-memory store that sits between 
your application and the origin data store
•Decreases access latency, increases throughput, 
and eases load of databases and applications
•Scales out, in, up, or down to meet demands
•Fully compatible with open-source Redis and 
Memcached engines

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 16

16
ElastiCache engines
ElastiCache for Memcached
ElastiCache for Redis
Features
•
Multithreading
•
Low maintenance
•
Easy horizontal scalability with Auto 
Discovery
Features
•
Support for complex data types
•
Persistence
•
High availability (replication)
•
Automatic failover
•
Publish/subscribe capabilities
Suitability
•
Need the simplest model possible
Suitability
•
Need the advantage of data persistence
•
Need advanced data types
•
Need one of the other features that are 
listed

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 17

17
ElastiCache terminology
Node: Fixed-size chunk of secure, 
network-attached RAM
Cluster: Logical 
grouping of one or 
more ElastiCache 
nodes
Memcached cluster with data partitioning

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 18

18
ElastiCache terminology: Redis
Redis shard (or node group): A grouping of 1–6 related nodes
Redis cluster (or replication group): A logical grouping of one 
or more Redis shards

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 19

19
Example: ElastiCache in an application

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 20

20
Cache miss penalty and time to live (TTL)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 21

21
Section 3 key 
takeaways
•ElastiCache is a fully managed, in-memory data 
store with sub-millisecond latency.
•ElastiCache supports two open-source in-
memory caching engines: Memcached and 
Redis.
•A node is a fixed-size chunk of secure, 
network-attached RAM, and a cluster is a 
logical grouping of one or more ElastiCache 
nodes.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 22

22
Lab 9.1: Caching 
Application Data 
with ElastiCache

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 23

23
Lab: Scenario
•Frank and Martha are excited that the bean inventory from the coffee 
suppliers application is integrated into the café website. However, they are 
getting negative feedback that the bean inventory information takes too 
long to display on the page.
•One of the café's customers, Olivia, who is an AWS consultant, proposed 
adding database caching to improve the speed of the database query.
•Olivia recommended using the ElastiCache managed service. ElastiCache is 
similar to Amazon Aurora Serverless in that it simplifies the process to 
deploy and maintain a cache cluster.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 24

24
Lab: Tasks
1. Preparing the development environment
2. Configuring the subnets for ElastiCache to use
3. Creating the ElastiCache cluster
4. Loading records into the cache from the database
5. Updating data
6. Creating a new record
7. Deleting a record
8. Updating the application container

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 26

26
Begin Lab 9.1: Caching 
Application Data with 
ElastiCache
~ 90 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 27

27
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 28

28
Section 4: Caching with CloudFront
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 29

29
Challenges of serving data globally
High network latency 
between the origin and 
some users
Greater distance 
between the origin 
and user affects 
performance
More hops between 
the origin and user 
affects performance

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 30

30
What is a CDN?
Lower network 
latency 
Dynamic content that is 
relevant to the 
geographic location
Locally cached 
copies of static 
resources

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 31

31
CloudFront
Amazon
CloudFront
Fast content delivery network (CDN) service that 
securely delivers data, videos, applications, and 
APIs to customers globally with low latency and 
high transfer speeds
•Optimized for performance and scale
•Built-in security features
•Deeply integrated with AWS services
•Highly customizable

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 32

32
How CloudFront works
1. A user 
requests files
2. DNS routes to the 
best CloudFront edge 
location
3. CloudFront checks its cache and 
returns the requested files or 
requests them from the origin
4. The origin server sends the 
requested files back to the 
edge location
5. CloudFront forwards the 
files to the user and adds 
the files to the cache

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 33

33
CloudFront distribution types
Web content
•
Used for serving content 
over HTTP or HTTPS, such 
as static and dynamic 
content.
•
The origin can be an HTTP 
server or an S3 bucket.
Video on demand
• Used for video content that 
users can watch at any 
time.
• Videos must be encoded to 
support streaming.
• The origin can be an HTTP 
server or an S3 bucket.
Live event
• Used to stream live events.
• Videos must be encoded 
and compressed for viewing 
devices.
• The origin can be AWS 
Elemental MediaStore or 
AWS Elemental 
MediaPackage.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 34

34
Understanding the cache key
The default cache key is the CloudFront distribution domain name plus the URL path of the requested object. Other values 
from the request are not included in the cache key by default. Examples follow. 
Cache key: 
•
Domain: d111111abcdef8.cloudfront.net 
•
URL: /content/stories/example-story.html
Request 1: No matching cache key in cache. Cache miss
GET /content/stories/example-
story.html?ref=0123abc&split-pages=false 
HTTP/1.1
Host: d111111abcdef8.cloudfront.net
User-Agent: Mozilla/5.0 Gecko/20100101 
Firefox/68.0
Accept: text/html,*/*
Accept-Language: en-US,en
Cookie: session_id=01234abcd
Referer: https://news.example.com/
Request 2: Cache key matches request 1. Cache hit
GET /content/stories/example-
story.html?ref=xyz987&split-pages=true HTTP/1.1
Host: d111111abcdef8.cloudfront.net
User-Agent: Mozilla/5.0 AppleWebKit/537.36 
Chrome/83.0.4103.116
Accept: text/html,*/*
Accept-Language: en-US,en
Cookie: session_id=wxyz9876
Referer: https://rss.news.example.net/

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 35

35
Controlling cache keys with cache policies
Settings Category
Description 
Available Settings
Policy information
Describes the policy. 
•
Name of policy (which is used to 
attach the policy to a caching 
behavior)
•
Comment
Time to live (TTL) 
settings 
Work together with the Cache-Control and 
Expires HTTP headers (if they’re in the origin 
response). They determine how long objects in the 
CloudFront cache remain valid before CloudFront 
checks the origin for updates.
•
Minimum TTL
•
Maximum TTL
•
Default TTL 
Cache key settings
Specify the values in viewer requests that CloudFront 
includes in the cache key. The values that you include 
in the cache key are automatically included in 
requests that CloudFront sends to the origin, which 
are called origin requests.
•
URL query strings
•
HTTP headers
•
Cookies
•
Compression support

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 36

36
Managing cached file expiration
If cache duration of img4.jpg has not passed
    return img4.jpg from cache
Else 
    request latest from origin
If cached version = latest origin version
    return 304 Not Modified
Else
    return latest version of img4.jpg
Modify default duration (24 hours) with CloudFront TTL settings or origin response headers
In CloudFront
•
Set Minimum TTL, Maximum TTL, and Default 
TTL in a cache policy
•
Modifies duration for all files that match a path 
pattern
In the response header
•
Include Cache-Control or Expires 
headers 
•
Modifies the cache duration of 
individual files

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 37

37
Using CloudFront to accelerate Amazon S3 file transfer
S3 bucket with 
transfer 
acceleration 
turned on
Optimized 
network path
Little improvement or possibly slower 
performance for this user
Likely speed improvement 
for this user

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 38

38
Customizing at the edge with functions
•Use edge functions to customize how your distribution processes requests 
and responses.
•Code runs close to viewers to minimize latency.
•Two ways to write and manage edge functions:
• Lambda@Edge
• CloudFront Functions

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 39

39
Using CloudFront with Lambda@Edge
Developer associates an 
AWS Lambda function to 
run based on a CloudFront 
distribution event
Lambda replicates your 
function to CloudFront 
Regional edge locations
A configured CloudFront 
event occurs, and the 
function is invoked at a 
CloudFront Regional 
edge cache

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 40

40
Lambda@Edge example
Lambda function code
def lambda_handler(event, context):
     request = event['Records'][0]['cf']['request']
 
     viewerCountry = request['headers'].get('cloudfront-viewer-country')
     if viewerCountry:
         countryCode = viewerCountry[0]['value']
         if countryCode == 'GB' or countryCode == 'DE' or countryCode == 'IE':
             domainName = 'eu.example.com'
             request['origin']['custom']['domainName'] = domainName
             request['headers']['host'] = [{'key': 'host', 'value': domainName}]
     return request

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
Using CloudFront Functions
The developer publishes a 
CloudFront function and 
associates it to a 
CloudFront distribution 
event
CloudFront intercepts 
requests and responses 
at edge locations and 
passes them to your 
function

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 42

42
CloudFront function example
CloudFront function code
function handler(event) {
    // NOTE: This example function is for 
a viewer request event type. 
    // Choose viewer request for event 
type when you associate this function 
with a distribution. 
    var response = {
        statusCode: 302,
        statusDescription: 'Found',
        headers: {
            'cloudfront-functions': { 
value: 'generated-by-CloudFront-
Functions' },
            'location': { value: 
'https://aws.amazon.com/cloudfront/' }
        }
    };
    return response;
}
CloudFront function redirects to:
https://aws.amazon.com/cloudfront/
Requested URL (the CloudFront distribution): 
https://d111111abcdef8.cloudfront.net/

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 6 รายการ]


---

## Slide Page 43

43
Choosing between Lambda@Edge 
and CloudFront Functions
Lambda@Edge
CloudFront Functions
Use cases
Allows complex functions and full 
application logic 
Lightweight, short-running functions
Ability to build and test 
entirely within 
CloudFront
No
Extension of Lambda
Yes
Native feature of CloudFront
Programming languages
Node.js or Python runtime
JavaScript
Event sources
Viewer request/response and origin 
request/response
Viewer request/response
Scale
Greater duration, memory capacity, 
and function size than CloudFront 
Functions
Limited to sub-milliseconds of duration, 2 
MB memory, and 10 KB in size

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 44

44
Section 4 key 
takeaways
•CloudFront is a fast CDN service that delivers 
data globally with low latency and high 
transfer speeds.
•CloudFront distributions can serve web, video, 
or live streaming content.
•A cache key is the unique identifier for each 
object in the cache.
•You can use CloudFront Functions and 
Lambda@Edge to customize how your 
distribution processes requests and responses.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 45

45
Section 5: Caching strategies
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 46

46
Two primary caching strategies
Lazy loading
• The cache is updated only when 
necessary (cache hit or cache miss).
• Use when data will be read often but 
written infrequently.
• Example: User profile information
Write-through
• The cache is updated whenever data is 
written to the database.
• Use when data must be updated in real 
time.
• Examples: Top 100 game leaderboard or 
top 10 most popular news stories

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 47

47
Lazy loading
Application gets a request 
for data
1
Cache hit or miss
ElastiCache
Advantages
• Less unneeded 
data in cache
• Non-fatal node 
failures
2
If cache miss:
• Request data from database
• Update cache
Database
3
Disadvantages
• Cache miss penalty
• Potential for stale data

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 48

48
Lazy loading example
# Python
def get_user(user_id):
    # Check the cache
    record = cache.get(user_id)
    if record is None:
        # Run a DB query
        record = db.query("select * from users where id = ?", user_id)
        # Populate the cache
        cache.set(user_id, record)
    return record

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 49

49
Write-through
Application gets a request 
for data
1
Update database
Database
2
Update cache
Disadvantages
•
Write penalty
•
Missing data on node failure
•
Unused data in cache
•
Cache churn
ElastiCache
Advantage
•
No stale data in 
the cache

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 50

50
Write-through example
# Python
def save_user(user_id, values):
# Save to DB
record = db.query("update users ... where id = ?", user_id, values)
# Push into cache
cache.set(user_id, record)
return record

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 51

51
Section 5 key 
takeaways
•Caching has two primary strategies: lazy 
loading and write-through. 
• With lazy loading, the cache is updated only when 
necessary (cache hit or miss).
• With write-through, the cache is updated whenever 
data is written to the database.
•Choose a caching strategy that matches the 
use case for your data.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 52

52
Lab 9.2: Implementing 
CloudFront for Caching 
and Application 
Security

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 53

53
Lab: Scenario 2
•The café website is still running on 
HTTP and does not yet support 
HTTPS. 
•The café would like to ensure 
webpages will load quickly for users 
globally. 
•Sofía decides it is time deliver the 
café website through a content 
delivery network (CDN).

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 54

54
Lab: Tasks 2
1. Preparing the development environment
2. Configuring an Amazon CloudFront distribution for static website content
3. Securing network access to the CloudFront distribution using AWS WAF
4. Securing a REST API endpoint using AWS WAF
5. Configuring a CloudFront Function on the website
6. Adjusting the cache duration

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 55

55
Lab: Final product

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 56

56
Begin Lab 9.2: 
Implementing CloudFront 
for Caching and Application 
Security
~ 90 minutes

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 57

57
Lab debrief: 
Key takeaways

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 58

58
Module wrap-up
Module 9: Caching Information for Scalability

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 59

59
Module summary
In summary, in this module, you learned how to do the following:
• Explain when caching is used
• Describe caching with ElastiCache 
• Describe caching with CloudFront 
• Describe and compare Lambda@Edge and CloudFront Functions
• Apply caching strategies

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 60

60
Complete the knowledge check

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 61

61
Sample exam question
Which requirement is a reason to choose Memcached over Redis for your ElastiCache configuration? 
Identify the key words and phrases before continuing.
The following are the key words and phrases:
•
Requirement
•
Memcached over Redis
•
ElastiCache

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 62

62
Sample exam question: Responses
Which requirement is a reason to choose Memcached over Redis for your ElastiCache configuration? 
Choice
Response
A
You need data replication.
B
You need the simplest model possible.
C
You have complex data types.
D
You need an in-memory cache.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 63

63
Sample exam question: Answer
The correct answer is B.
Choice
Response
A
You need data replication.
B
You need the simplest model possible.
C
You have complex data types.
D
You need an in-memory cache.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 64

64
Additional resources
Video:
• Getting Started with Caching: Turbocharging Your Application Workloads 
Blog post:
• Introducing CloudFront Functions – Run Your Code at the Edge with Low Latency at Any 
Scale

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 65

65
Thank you
Corrections, feedback, or other questions?
Contact us at https://support.aws.amazon.com/#/contacts/aws-academy.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---
