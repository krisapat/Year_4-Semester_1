# คลังสรุปและเก็งข้อสอบวิชา DevOps (AWS Academy Cloud Developing) ฉบับเตรียมสอบ 140 ข้อ

เอกสารฉบับนี้รวบรวมแก่นเนื้อหา, คำศัพท์เฉพาะ, จุดตัดทางสถาปัตยกรรม (Architecture Trade-offs), และแนวข้อสอบจาก 2 ส่วนหลัก:
1. **Official AWS Academy Knowledge Check (Module 2 - 13 รวม 120 ข้อจริง)**
2. **โจทย์วิเคราะห์สถานการณ์ประยุกต์และจุดตายที่อาจารย์ชอบออกดักหลอก (50 ข้อ)**
*(รวมทั้งสิ้น 170 ข้อ พร้อมเฉลยและเหตุผลวิเคราะห์ตัวลวง ฝังลงระบบทำข้อสอบใน `index.html` แล้ว)*

---

## สารบัญจุดเก็งและข้อสอบรายโมดูล

### 1. Module 2: Introduction to Developing on AWS
- **แก่นสำคัญ:**
  - SDLC 6 ขั้นตอน: `Plan -> Define -> Design -> Develop -> Deploy -> Maintain` (ข้อสอบชอบถาม 3 ขั้นตอนท้าย หรือถามว่าการติดตั้งคอมโพเนนต์ใหม่/เขียนโค้ดอยู่ขั้นไหน -> ตอบ `Develop`)
  - เครื่องมือสำหรับ Developer:
    - `AWS CloudShell`: จุดเด่นคือ **สืบทอดสิทธิ์ (Credentials) จาก Management Console อัตโนมัติ** ไม่ต้องใส่ Access Key เอง
    - `AWS Tools for PowerShell`: สำหรับคนถนัดสคริปต์ PowerShell ควบคุม AWS ผ่าน Command line
    - `Amazon Q Developer`: Generative AI coding assistant
    - 3 วิธีคุยกับ AWS APIs: Console, AWS CLI, และ AWS SDKs
    - Resource APIs vs Client APIs: Resource API ให้ Abstraction ระดับสูงกว่า (ทำงานกับ Objects/Collections) ขณะที่ Client API เป็น Low-level 1-to-1 กับ Service API

### 2. Module 3: Storage Solutions (Amazon S3)
- **จุดตายข้อสอบ:**
  - **S3 Durability:** 11 9s (99.999999999%) ข้อมูลกระจายข้ามอย่างน้อย 3 AZs
  - **Bucket Naming:** ต้อง Globally Unique ทั่วโลก, ความยาว 3-63 ตัวอักษร, อักษรตัวพิมพ์เล็ก ตัวเลข และขีดกลาง (-) เท่านั้น ห้ามพิมพ์ใหญ่
  - **ขนาดไฟล์และ Multipart Upload:**
    - Single PUT รองรับไฟล์สูงสุด **5 GB** หากไฟล์เกิน 5 GB **ต้อง** ใช้ Multipart Upload เท่านั้น (แนะนำใช้ตั้งแต่ 100 MB ขึ้นไป)
    - ไฟล์บน S3 ขนาดสูงสุดได้ **5 TB** ต่อ 1 Object
  - **Versioning & Deletion Trap:**
    - เมื่อเปิด Versioning แล้ว **ไม่มีคำสั่ง Disable** ทำได้แค่ **Suspend**
    - การสั่ง Delete Object ทั่วไปโดยไม่ระบุ Version ID จะเป็นการสร้าง **Delete Marker** (กู้คืนได้) แต่ถ้าส่ง Delete พร้อมระบุ Version ID จะเป็นการ **Permanent Delete (Hard Delete)** ทันที
  - **S3 Select:** ใช้ SQL ยิงคัดกรองเฉพาะ Row/Column ที่ต้องการจากไฟล์ CSV/JSON/Parquet บน S3 ช่วยลด Data Transfer สูงถึง 80%

### 3. Module 4: Securing Access (AWS IAM)
- **จุดตายข้อสอบ:**
  - **Shared Responsibility Model:**
    - AWS รับผิดชอบ: Security OF the Cloud (ฮาร์ดแวร์, ฟิสิคัลดาต้าเซ็นเตอร์, โครงสร้างพื้นฐาน)
    - ลูกค้า (Customer) รับผิดชอบ: Security IN the Cloud (ข้อมูลลูกค้า Client-side data, การตั้งค่า Security Group, IAM User/Password, OS Patching บน EC2)
  - **Evaluation Logic (การตัดสินใจของ Policy):**
    - ค่าเริ่มต้นคือ **Default Deny** เสมอ
    - **Explicit Deny สำคัญที่สุด:** หากมี Deny ข้อใดข้อหนึ่งโผล่มา จะ Overwrite ทุก Allow ทันที แม้จะมีสิทธิ์ AdministratorAccess ก็ตาม
  - **Best Practices:**
    - ปิดการใช้งาน Root Account ในงานประจำวัน
    - ห้ามเก็บ Access Key/Secret Key ไว้ในโค้ดหรือ AMI ให้ใช้ **IAM Role ผูกกับ Instance Profile / Lambda Execution Role**

### 4. Module 5: Flexible NoSQL Solutions (Amazon DynamoDB)
- **จุดตายข้อสอบ:**
  - **Primary Key:**
    - Simple Primary Key: มีเฉพาะ Partition Key (HASH)
    - Composite Primary Key: ประกอบด้วย Partition Key (HASH) + Sort Key (RANGE)
  - **Secondary Indexes (GSI vs LSI):**
    - `LSI (Local Secondary Index)`: Partition Key เดียวกับตารางหลัก แต่ Sort Key ต่างกัน **ต้องสร้างตอนสร้างตารางเท่านั้น (Create time only)**
    - `GSI (Global Secondary Index)`: Partition Key และ Sort Key ต่างจากตารางหลักได้เลย **สร้างย้อนหลังเมื่อไหร่ก็ได้**
  - **สูตรคำนวณ RCU / WCU:**
    - **1 WCU** = เขียนข้อมูลขนาดไม่เกิน 1 KB จำนวน 1 ครั้งต่อวินาที
    - **1 RCU** (Strongly Consistent) = อ่านข้อมูลขนาดไม่เกิน 4 KB จำนวน 1 ครั้งต่อวินาที
    - **Eventually Consistent Read** = ใช้เพียง **0.5 RCU** ต่อ 4 KB
    - *กฎเหล็กข้อสอบ:* ตัวเลขทศนิยมต้องปัดขึ้นเป็นจำนวนเต็มเสมอ เช่น เขียน 1.2 KB = ต้องใช้ 2 WCU
  - **DynamoDB Streams:** บันทึก Change Data Capture (CDC) ภายใน 24 ชม. เหมาะมากสำหรับการทริกเกอร์ Lambda เมื่อเกิด Event เพิ่ม/แก้/ลบข้อมูล

### 5. Module 6: Developing REST APIs (Amazon API Gateway)
- **จุดตายข้อสอบ:**
  - **REST API vs HTTP API:** HTTP API เร็วกว่าและถูกกว่าถึง 70% รองรับ OIDC/OAuth2 แต่ถ้าต้องการ Cache, Usage Plans, API Keys, หรือ WAF ต้องใช้ REST API
  - **Integration Types:**
    - `Lambda Proxy Integration`: ส่ง Request ดิบทั้งหมด (Headers, QueryParams, Body) เข้า event ของ Lambda แบบไร้การดัดแปลง (ง่ายและยืดหยุ่นสุด)
    - `Lambda Non-Proxy (Custom)`: ต้องเขียน VTL (Velocity Template Language) ทำ Mapping Template
  - **Throttling Tiers (ระดับการจำกัดคำขอ):**
    - Account Level (ระดับบัญชี)
    - Usage Plan Level (ระดับผู้ใช้/Client ผ่าน API Key)
    - Method Level (ระดับ Route/Method)
    - System Level (ป้องกันระบบรวม)

### 6. Module 7: Event-Driven Serverless (AWS Lambda)
- **จุดตายข้อสอบ:**
  - **สเปกและข้อจำกัด:**
    - RAM ปรับได้ตั้งแต่ 128 MB ถึง 10,240 MB (10 GB) โดย CPU จะถูกจัดสรรเพิ่มตามสัดส่วนของ RAM อัตโนมัติ
    - Execution Timeout สูงสุด **15 นาที (900 วินาที)**
    - `/tmp` storage ชั่วคราว 512 MB ถึง 10,240 MB
  - **Concurrency:**
    - `Reserved Concurrency`: การันตีจำนวน instance สูงสุดที่ฟังก์ชันนี้จะใช้ เพื่อป้องกันไม่ให้กระทบโควตารวมของระบบ
    - `Provisioned Concurrency`: วอร์มรันไทม์ไว้ล่วงหน้าเพื่อ **แก้ปัญหา Cold Start** (เหมาะกับงาน Latency ต่ำมาก)
  - **Execution Role vs Resource Policy:**
    - Execution Role (Outbound): ฟังก์ชันต้องการสิทธิ์ไปอ่าน/เขียนตาราง DynamoDB หรือ S3
    - Resource-based Policy (Inbound): ให้อนุญาตเซอร์วิสอื่น (เช่น S3 Bucket หรือ API Gateway) มีสิทธิ์เรียกสั่งงานฟังก์ชัน Lambda

### 7. Module 8: Containers & Container Services (ECS / Fargate)
- **จุดตายข้อสอบ:**
  - **ส่วนประกอบของ Container:** ประกอบด้วย Runtime Engine + Application Code + Libraries (แชร์ OS Kernel ร่วมกับโฮสต์ ไม่ต้องพก OS ตัวเต็มเหมือน VM)
  - **ECR Push Workflow:** Docker Build -> Docker Tag -> Authenticate ECR -> Docker Push
  - **ECS Launch Types:**
    - `EC2 Launch Type`: เราต้องดูแล จัดการ Patch และ Scale VM เองทั้งหมด
    - `AWS Fargate (Serverless)`: ไม่ต้องบริหารเซิร์ฟเวอร์ จ่ายตาม vCPU และ Memory ที่คอนเทนเนอร์ใช้งานจริง
  - **Elastic Beanstalk Deployment Strategies:**
    - `All at once`: ไวสุด แต่ระบบล่มชั่วคราว (Downtime)
    - `Rolling`: ทยอยอัปเดตทีละชุด ระบบไม่ล่มแต่ Capacity ลดลงช่วงอัปเดต
    - `Rolling with additional batch`: ทยอยอัปเดตโดยเพิ่มเครื่องสำรองก่อน ทำให้ Full Capacity ตลอดเวลา
    - `Immutable` / `Blue/Green`: ปลอดภัยสุด สลับ Traffic ไปชุดใหม่เมื่อทดสอบผ่านแล้ว Rollback ไวสุด

### 8. Module 9: Caching for Scalability (CloudFront & ElastiCache)
- **จุดตายข้อสอบ:**
  - **Amazon CloudFront:** เป็น CDN ระดับ Edge Locations ทั่วโลก ช่วยแคช Static/Dynamic Web content
  - **ElastiCache:**
    - `Redis`: รองรับ Data Structures ซับซ้อน (Sorted Sets, Hashes, Lists), Multi-AZ Failover, Read Replicas, Persistence (บันทึกข้อมูลลงดิสก์ได้)
    - `Memcached`: Pure In-Memory Caching เรียบง่าย เหมาะกับ Multi-thread scale-out แบบไม่มี Persistence
  - **Caching Strategies:**
    - `Lazy Loading (Cache-Aside)`: อ่านจากแคชก่อน ถ้า Cache Miss ให้ไปดึงจาก DB แล้วนำมาหยอดใส่แคช (ข้อมูลอาจเก่าได้ถ้าไม่ได้ตั้ง TTL)
    - `Write-Through`: บันทึกข้อมูลลงแคชพร้อมๆ กับตอนเขียนลง DB (แคชสดใหม่เสมอ แต่เขียนช้าขึ้นและอาจเปลืองที่เก็บข้อมูลที่ไม่ได้อ่าน)

### 9. Module 10: Messaging Services (Amazon SQS & SNS)
- **จุดตายข้อสอบ:**
  - **Amazon SQS (Queue):**
    - `Standard Queue`: Throughput ไม่จำกัด, การันตี At-Least-Once Delivery แต่อาจมีข้อความซ้ำหรือสลับลำดับได้
    - `FIFO Queue`: รักษาลำดับข้อความเป๊ะ (First-In, First-Out), ประมวลผล Exactly-Once แต่ Throughput จำกัดที่ 300 msg/s (หรือ 3,000 msg/s ด้วย batching)
    - `Visibility Timeout`: ระยะเวลาที่ข้อความจะถูก "ซ่อน" จากผู้บริโภคคนอื่นชั่วคราวในขณะที่ Consumer ปัจจุบันกำลังทำงานอยู่ (สูงสุด 12 ชม., เริ่มต้น 30 วินาที)
    - `Long Polling`: ตั้ง WaitTimeSeconds (1-20 วินาที) เพื่อลดจำนวนคำขอว่างเปล่าและประหยัดค่าใช้จ่าย
    - `Dead-Letter Queue (DLQ)`: ที่พักข้อความที่พยายาม Process เกิน MaxReceiveCount เพื่อป้องกัน Poison Pill messages
  - **Amazon SNS (Pub/Sub):**
    - ส่งข้อความแบบ 1-to-Many (Fanout Pattern)
    - รองรับ Message Filtering เพื่อให้ Subscriber รับเฉพาะข้อความที่มี Attributes ตรงตามเงื่อนไข

### 10. Module 11: Workflows & Step Functions
- **จุดตายข้อสอบ:**
  - **State Machine Types:**
    - `Standard Workflows`: ทำงานได้นานสูงสุด **1 ปี**, มี Audit History ครบถ้วนแบบ Exactly-Once Execution เหมาะกับกระบวนการธุรกิจที่ต้องมีคนมารออนุมัติ (Human Approval via taskToken)
    - `Express Workflows`: ทำงานได้นานสูงสุด **5 นาที**, Throughput สูงกว่า 100,000 events/sec เหมาะกับงานประมวลผลข้อมูล IoT/Streaming
  - **States สำคัญ:**
    - `Task`: รันงานจริง (เช่น เรียก Lambda, เรียก DynamoDB)
    - `Choice`: แตกเงื่อนไข If/Else
    - `Parallel`: แยกการทำงานออกเป็นกิ่งคู่ขนาน (Fixed branches)
    - `Map`: วนลูปประมวลผลตามชุดอาร์เรย์ของข้อมูล (Iterate collection)

### 11. Module 12: Developing Secure Applications & Amazon Cognito
- **จุดตายข้อสอบ:**
  - **Cognito User Pools (Authentication - AuthN):**
    - สารบบผู้ใช้ (Directories), ดูแลเรื่อง Sign-up, Sign-in, MFA, กู้คืนรหัสผ่าน
    - ออกโทเคนมาตรฐาน **JWT (JSON Web Tokens)**: Identity Token, Access Token, Refresh Token
  - **Cognito Identity Pools (Authorization - AuthZ):**
    - แลกเปลี่ยน Token จาก User Pool หรือ Social Identity Providers (Google, Apple, Facebook) ไปเป็น **Temporary AWS Credentials ผ่าน AWS STS** เพื่อให้ Client เข้าถึงทรัพยากรบน AWS ได้โดยตรงตาม IAM Role ที่กำหนด
  - **Security Tools:**
    - `AWS Secrets Manager`: หมุนเวียนคีย์ (Key Rotation) อัตโนมัติสำหรับ Database Credentials
    - `AWS Systems Manager Parameter Store`: จัดเก็บ Config และ String/SecureString แบบธรรมดาและประหยัด

### 12. Module 13: Automating Deployment with CI/CD
- **จุดตายข้อสอบ:**
  - `AWS CodeCommit`: Git Repository
  - `AWS CodeBuild`: คอมไพล์โค้ด, รันชุดทดสอบ (Unit Test), และแพ็กเป็น Build Artifacts (กำหนดขั้นตอนผ่านไฟล์ `buildspec.yml`)
  - `AWS CodeDeploy`: นำ Artifacts ไปติดตั้งลง EC2, ECS, หรือ Lambda (กำหนดผ่านไฟล์ `appspec.yml`)
  - `AWS CodePipeline`: เครื่องมือร้อยเรียงกระบวนการทั้งหมดให้เป็น Pipeline อัตโนมัติ

---

## สรุปคำแนะนำสำหรับวันสอบ
1. อ่านคีย์เวิร์ดของโจทย์ก่อนเสมอ: หากโจทย์ถามถึงความคุ้มค่า/ประหยัดที่สุด (Cost-effective) ให้มองหา Serverless หรือ Caching ก่อน
2. ถ้าโจทย์ถามเรื่องความทนทานของข้อมูล (Durability) สูงสุด -> มองหา Amazon S3 (11 9s)
3. ถ้าโจทย์ถามเรื่องระบบประมวลผลที่รองรับคำขอพุ่งสูงเป็นช่วงๆ (Bursty traffic) โดยไม่ต้องการจัดการเซิร์ฟเวอร์ -> มองหา AWS Lambda + SQS
4. เข้าไปฝึกกดทำข้อสอบทั้ง 170 ข้อใน `index.html` เพื่อดูคำอธิบายจุดหลอกและทำความคุ้นเคยกับคำถามจริง
