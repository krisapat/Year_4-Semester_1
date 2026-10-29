# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 6: Developing REST APIs (Amazon API Gateway)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 101 หน้า พร้อมถอดความโครงสร้าง Endpoint Types, Proxy vs Non-Proxy, และลำดับการประเมิน Throttling ครบถ้วน

---

## 1. ภาพรวมและประเภทของ API (Core Concepts & Supported Protocols)

- **Amazon API Gateway:** บริการจัดการ API แบบ Fully Managed ที่ทำหน้าที่เป็นเสมือน "ประตูด่านหน้า (Front Door / Proxy)" ให้กับแอปพลิเคชัน เพื่อเชื่อมต่อไปยังระบบหลังบ้าน (Backend) เช่น AWS Lambda, Amazon EC2, หรือเซอร์วิสอื่นๆ ภายในและภายนอก AWS
- **โปรโตคอลที่รองรับ (Supported Protocols):**
  1. **RESTful APIs:** สื่อสารแบบ Request-Response ผ่าน HTTP Methods (GET, POST, PUT, DELETE) ไร้สถานะ (Stateless) และอายุการเชื่อมต่อสั้น
  2. **WebSocket APIs:** สื่อสารสองทิศทางแบบเรียลไทม์ (Bidirectional & Full-duplex) เชื่อมต่อค้างไว้ตลอดเวลา (Stateful / Long-lived) เหมาะกับแอปรับส่งข้อความแชต (Chat), กระดานหุ้น, หรือเกมมัลติเพลเยอร์ โดยใช้ `route-selection-expression` เช่น `$request.body.action` เพื่อเลือก Route ทำงาน

---

## 2. เปรียบเทียบ REST API vs HTTP API (สองรูปแบบของ RESTful บน API Gateway)

ข้อสอบมักถามเปรียบเทียบความคุ้มค่าและฟีเจอร์ของ 2 ตัวนี้:

| คุณสมบัติ | REST API (ดั้งเดิม) | HTTP API (รุ่นใหม่) |
| :--- | :--- | :--- |
| **เป้าหมายการออกแบบ** | ควบคุมคำขอ/คำตอบได้ละเอียด มีฟีเจอร์ระดับ Enterprise ครบครัน | ออกแบบเพื่อ **ความเร็วสูงสุด (Latency ต่ำ) และต้นทุนต่ำสุด** (ถูกกว่า ~70%) |
| **API Caching** | **รองรับ** ในระดับ Stage และ Method | ❌ **ไม่รองรับ** (ต้องใช้ CloudFront แคชภายนอก) |
| **Request / Response Transformation** | **รองรับ** ผ่าน Mapping Templates (VTL: Velocity Template Language) | ❌ **ไม่รองรับ** VTL (รองรับเฉพาะ Parameter Mapping พื้นฐาน) |
| **การรองรับ AWS WAF** | **รองรับ** ป้องกัน SQLi, XSS, Bad Bots | **รองรับ** |
| **API Keys & Usage Plans** | **รองรับ** สำหรับคิดเงินหรือจำกัดโควตาลูกค้า | ❌ **ไม่รองรับ** API Key / Usage Plan |
| **การยืนยันตัวตน** | IAM, Cognito User Pools, Lambda Authorizers | IAM, **Native JWT Authorizers (OIDC/Cognito)**, Lambda Authorizers |
| **Endpoint Types** | **Edge-optimized, Regional, Private (VPC)** | รองรับเฉพาะ **Regional** เท่านั้น |
| **First-class AWS Integrations** | ผ่าน AWS Service Integration (ต้องแมป) | **รองรับ Direct Integration** เช่น SQS, Kinesis, EventBridge |

---

## 3. สถาปัตยกรรม Endpoint Types และโครงสร้าง URL

### 3.1 รูปแบบ URL มาตรฐาน
```text
https://{restapi_id}.execute-api.{region}.amazonaws.com/{stage_name}/{resource_path}
```
- `{restapi_id}`: รหัสประจำตัวของ API
- `{region}`: AWS Region ที่โฮสต์ API
- `{stage_name}`: ชื่อของสภาพแวดล้อม เช่น `dev`, `prod`

### 3.2 ประเภทของ Endpoint (Endpoint Types - จากไดอะแกรมหน้า 35)
1. **Edge-optimized Endpoint (เฉพาะ REST API เท่านั้น):**
   - ส่งคำขอผ่านเครือข่าย **Amazon CloudFront Distribution ที่ AWS บริหารจัดการให้อัตโนมัติ**
   - เหมาะสำหรับผู้ใช้งานสาธารณะ (Public Clients, Mobile Apps) ที่กระจายตัวอยู่ทั่วโลก เพื่อลด Network Latency ข้ามทวีป
2. **Regional Endpoint:**
   - คำขอจะวิ่งตรงเข้าสู่ API Gateway ในรีเจียนนั้นๆ ทันที โดยไม่ผ่าน CloudFront อัตโนมัติของ AWS
   - เหมาะสำหรับทราฟฟิกที่อยู่ในภูมิภาคเดียวกัน หรือลูกค้าที่ต้องการใช้ **Customer-Managed CloudFront** เพื่อติด WAF หรือปรับแต่งแคชเอง
3. **Private Endpoint (เฉพาะ REST API เท่านั้น):**
   - ปิดกั้นจากอินเทอร์เน็ตสาธารณะ เข้าถึงได้เฉพาะอุปกรณ์หรือระบบงานที่อยู่ภายใน **Amazon VPC** เท่านั้น
   - เชื่อมต่อผ่าน **Interface VPC Endpoint (AWS PrivateLink)**

---

## 4. รูปแบบการเชื่อมต่อหลังบ้าน (Backend Integrations: Proxy vs Non-Proxy)

### 4.1 Lambda Proxy Integration (`AWS_PROXY`) vs Non-Proxy (Custom Integration)

สไลด์หน้า 39 ชี้ให้เห็นความแตกต่างทางสถาปัตยกรรมอย่างชัดเจน:

| คุณสมบัติ | Lambda Proxy Integration (`AWS_PROXY`) | Lambda Non-Proxy (Custom Integration) |
| :--- | :--- | :--- |
| **การส่งต่อ Request** | API Gateway ส่งข้อมูล Request ดิบทั้งหมด (Headers, Body, Params) ไปให้ Lambda ในรูป JSON Event เดียว | API Gateway ทำการสกัดข้อมูลและแปลงรูปแบบข้อมูลผ่าน **Mapping Template (VTL)** ก่อนส่งให้ Lambda |
| **การจัดการ Response** | **Lambda ต้องรับผิดชอบจัดโครงสร้าง JSON ตอบกลับเอง 100%** | Lambda ส่งผลลัพธ์กลับมาเป็นอ็อบเจกต์ธรรมดา แล้วให้ API Gateway แปลง Response ผ่าน VTL |
| **โครงสร้าง JSON บังคับ** | Lambda ต้องส่ง: `statusCode`, `headers`, `body` (ต้องเป็นสตริง), และ `isBase64Encoded` | ไม่มีโครงสร้างบังคับ API Gateway จะดึงค่าไปสวมใน HTTP Response เอง |
| **ความสะดวกในการพัฒนา** | รวดเร็ว ยืดหยุ่น โค้ด Lambda คุม HTTP Status Code เองได้อิสระ | ซับซ้อน ต้องเขียนโค้ดภาษา Apache VTL ในหน้าคอนโซล API Gateway |

ตัวอย่าง Response ที่ถูกต้องของ Lambda เมื่อใช้ Proxy Integration:
```json
{
  "isBase64Encoded": false,
  "statusCode": 200,
  "headers": {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*"
  },
  "body": "{\"message\": \"Hello from Lambda!\", \"status\": \"success\"}"
}
```

### 4.2 รูปแบบการเชื่อมต่ออื่นๆ
- **First-class AWS Service Integration:** ยิงคำขอตรงไปยังบริการ AWS (เช่น ส่งข้อความเข้า SQS Queue, หรืออ่านตาราง DynamoDB) โดย **ไม่ต้องเขียนโค้ด Lambda คั่นกลาง** ช่วยลดต้นทุนและ Latency
- **Private Integration (VPC Link):** เชื่อม API Gateway สาธารณะเข้าสู่เซิร์ฟเวอร์หลังบ้านใน VPC ผ่าน **VPC Link** โดยชี้ไปยัง Network Load Balancer (NLB) หรือ Application Load Balancer (ALB)
- **Greedy Path Variables (`{proxy+}`):** ดักจับ Request ทุกซับพาธ เช่น `/products/{proxy+}` จะจับทั้ง `/products/item1`, `/products/item1/details`

---

## 5. การปรับใช้ระบบ ตัวแปรสเตจ และ Canary (Deployment, Stages & Canary)

### 5.1 Stages และ Stage Variables
- **Stage:** สแนปช็อตการปรับใช้ API (เช่น `dev`, `test`, `prod`) มี URL แยกกันชัดเจน
- **Stage Variables:** ตัวแปร Key-Value ที่กำหนดค่าต่างกันในแต่ละ Stage เพื่อใช้ชี้ไปยังทรัพยากรหลังบ้านต่างกันโดยใช้ API ตัวเดียวกัน เช่น:
  ```text
  arn:aws:lambda:us-east-1:123456789012:function:myFunction:${stageVariables.lambdaAlias}
  ```
  - ในสเตจ `dev` ตั้งค่า `lambdaAlias = dev`
  - ในสเตจ `prod` ตั้งค่า `lambdaAlias = prod`
  - ผลลัพธ์: นักพัฒนาไม่ต้องสร้าง API Gateway ซ้ำซ้อน 2 ตัว

### 5.2 Canary Release Deployments
- สร้างสภาพแวดล้อมทดสอบคู่ขนาน (Canary) ขึ้นมาใน Stage เดียวกัน
- สามารถกำหนดเปอร์เซ็นต์ทราฟฟิก (เช่น 10%) ให้วิ่งไปยังโค้ดเวอร์ชันใหม่ เพื่อทดสอบพฤติกรรมจริงบนโปรดักชัน หากพบข้อผิดพลาดสามารถสั่ง Rollback ได้ทันที

---

## 6. ความมั่นคงปลอดภัยและการควบคุมการเข้าถึง (Security & Access Control)

### 6.1 รูปแบบการยืนยันตัวตนและการอนุญาตสิทธิ์ (จากไดอะแกรมหน้า 76)
1. **None (Public):** ไม่มีการตรวจสิทธิ์ ใครก็เรียกใช้ได้ เหมาะกับหน้าเว็บสาธารณะ หรือระบบรับ Webhook ทั่วไป
2. **IAM Authorization (SigV4):** ตรวจสอบลายเซ็น AWS Signature Version 4 เหมาะสำหรับ **ระบบภายในของ AWS หรือการเชื่อมต่อแบบ Service-to-Service** ข้าม AWS Account
3. **Cognito User Pools / Native JWT Authorizer:** ตรวจสอบความถูกต้องของ JSON Web Token (JWT) อัตโนมัติที่ระดับ API Gateway โดย **ไม่ต้องรันโค้ดประมวลผล** รองรับ OAuth 2.0 / OIDC (เช่น Google, Facebook, Cognito) ค่าใช้จ่ายต่ำและเร็วที่สุด
4. **Lambda Authorizers (Custom Authorizers):** รันโค้ดฟังก์ชัน Lambda เพื่อตรวจสอบ Token หรือ Request Parameters (Headers, Query Strings) และส่งคืนเอกสาร **IAM Policy (`Allow`/`Deny` พร้อม `context`)** กลับมายัง API Gateway เหมาะกับระบบล็อกอินดั้งเดิม (Legacy Auth, SAML, LDAP) หรือระบบที่ต้องการเช็กสิทธิ์ซับซ้อนในฐานข้อมูล

### 6.2 การป้องกันทราฟฟิกไม่พึงประสงค์
- **AWS WAF (Web Application Firewall):** ตรวจจับคำขอที่เป็นภัยคุกคาม กรองตาม IP, ประเทศ, หรือแพตเทิร์น SQL Injection / Cross-site Scripting (XSS)
- **CORS (Cross-Origin Resource Sharing):** รองรับเมื่อเว็บเบราว์เซอร์ส่งคำขอข้ามโดเมน ต้องเปิด Method `OPTIONS` และส่งคืน Header:
  - `Access-Control-Allow-Origin: '*'` (หรือระบุโดเมน)
  - `Access-Control-Allow-Methods: 'GET,POST,OPTIONS'`
  - `Access-Control-Allow-Headers: 'Content-Type,X-Amz-Date,Authorization,X-Api-Key'`
- **Client Certificates:** สร้าง SSL Certificate จาก API Gateway ส่งไปให้เซิร์ฟเวอร์หลังบ้าน (EC2 / ALB) ตรวจสอบว่าคำขอนั้นมาจาก API Gateway จริง ไม่ได้ถูกแอบอ้าง (อายุ 365 วัน)

---

## 7. กลไกการจำกัดอัตราคำขอ (Throttling Architecture)

### 7.1 ลำดับชั้นการประเมิน Throttling (จากไดอะแกรมหน้า 74: เรียงจากละเอียดที่สุดไปกว้างที่สุด)
API Gateway จะตรวจสอบคำขอตามลำดับ 4 ขั้นตอนตายตัว หากเกินลิมิตในขั้นตอนใด คำขอจะถูกตัดสิทธิ์ทันทีและได้รับ HTTP Status **`429 Too Many Requests`**:

```text
  [ระดับที่ 1: ละเอียดสุด] Client-level Method Limits (Usage Plan + API Key + Method เจาะจง)
                                   │ (ผ่าน)
                                   ▼
  [ระดับที่ 2]          Client-level Overall Limits (Usage Plan + API Key รวมทุก Method)
                                   │ (ผ่าน)
                                   ▼
  [ระดับที่ 3]          Stage & Method-level Limits (จำกัดรวมตาม Route หรือ Stage)
                                   │ (ผ่าน)
                                   ▼
  [ระดับที่ 4: กว้างสุด]  Account-level Regional Limits (ดีฟอลต์ 10,000 rps + Burst Bucket)
```

- **Usage Plans & API Keys:** ใช้วัดปริมาณและจำกัดคำขอของผู้ใช้งานแต่ละราย (Throttling: Rate/Burst, Quota: จำนวนครั้งต่อวันหรือเดือน)

---

## 8. การเพิ่มประสิทธิภาพและการติดตามผล (Optimization & Monitoring)

- **API Gateway Caching:** แคชคำตอบของ API ตาม Method และ Path เพื่อไม่ให้คำขอวิ่งลงไปยัง Backend ลดโหลดเซิร์ฟเวอร์และค่าใช้จ่าย (TTL เริ่มต้น 300 วินาที, ไคลเอนต์สามารถสั่ง Bypassed แคชได้ด้วย Header `Cache-Control: max-age=0` หากได้รับสิทธิ์)
- **Payload Compression:** บีบอัดขนาดข้อมูลขากลับด้วยอัลกอริทึม `gzip` หรือ `deflate` โดยกำหนดค่า `minimumCompressionSize` (หากตั้งค่าเป็น `0` จะสั่งบีบอัดทุกเพย์โหลด)
- **เครื่องมือมอนิเตอร์:**
  - **Amazon CloudWatch:** เก็บบันทึก Execution Logs, Access Logs และ Metrics (Latency, 4XXError, 5XXError, Count)
  - **AWS X-Ray:** ทำ Distributed Tracing วิเคราะห์เส้นทางคำขอตั้งแต่ API Gateway ผ่าน Lambda จนถึง DynamoDB
  - **AWS CloudTrail:** บันทึกประวัติการเรียกใช้ API บริหารจัดการ (Audit Trail)

---

## 9. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการแยกสภาพแวดล้อม Dev/Prod:** โจทย์ถามว่ามีระบบ Dev และ Prod ที่ต่อกับ Lambda 2 Aliases ต้องการจัดการบน API Gateway โดยใช้แรงคอนฟิกน้อยที่สุด ให้สร้าง API Gateway แยก 2 ตัวใช่หรือไม่?
   - ✅ **ที่ถูกต้อง:** ไม่ใช่! แนวทาง Best Practice ของ AWS คือ **สร้าง API Gateway ตัวเดียว แล้วใช้ Stage Variables** (เช่น `${stageVariables.lambdaAlias}`) กำหนดค่าแยกตาม Stage `dev` และ `prod`
2. ❌ **หลอกเรื่องผลตอบกลับของ Lambda Proxy Integration:** โจทย์ระบุว่าใช้ Lambda Proxy แต่ในโค้ดฟังก์ชัน Python สั่ง `return "Order Created Successfully"` หรือส่ง JSON Dict ธรรมดา แล้วทำไมไคลเอนต์ได้รับ HTTP `502 Bad Gateway`?
   - ✅ **ที่ถูกต้อง:** ในโหมด Proxy API Gateway บังคับให้ Lambda ต้องส่งคืนรูปแบบ Dict ที่มีคีย์ `"statusCode": 200` และ `"body": "..."` หากโครงสร้างขาดหายไป API Gateway จะพ่นข้อผิดพลาด 502 ทันที
3. ❌ **หลอกเรื่องความสามารถของ HTTP API vs REST API:** โจทย์ถามว่าต้องการลดค่าใช้จ่ายจึงเปลี่ยนไปใช้ HTTP API แต่ระบบเดิมมีการใช้งาน API Caching และใช้ API Key ร่วมกับ Usage Plan
   - ✅ **ที่ถูกต้อง:** **HTTP API ไม่รองรับ Caching ในตัว และไม่รองรับ Usage Plans / API Keys** หากต้องการฟีเจอร์เหล่านี้ ต้องอยู่บน REST API เท่านั้น
4. ❌ **หลอกเรื่อง CORS Preflight Failure:** เบราว์เซอร์แจ้งเตือนบล็อกคำขอ POST ข้ามโดเมน แต่นักพัฒนาไปเปิด CORS บน Method `POST` เรียบร้อยแล้ว ทำไมยังติด?
   - ✅ **ที่ถูกต้อง:** เบราว์เซอร์จะส่งคำขอตรวจสอบความปลอดภัยล่วงหน้า (Preflight Request) ด้วย Method **`OPTIONS`** เสมอ หากไม่มี Method `OPTIONS` ที่อนุญาต Headers และ Origin คำขอก็จะล้มเหลวทันที
5. ❌ **หลอกเรื่องการประเมิน Throttling:** โจทย์ถามว่าถ้าบัญชี AWS ได้รับโควตา 10,000 rps แล้ว ลูกค้าที่มี API Key รายเดียวจะยิงคำขอ 10,000 rps ได้ตลอดเวลาใช่หรือไม่?
   - ✅ **ที่ถูกต้อง:** ไม่ได้ เพราะ API Gateway ประเมินจากระดับที่ละเอียดที่สุดก่อน (Most Granular) หากลูกค้าถูกผูกไว้กับ Usage Plan ที่จำกัดไว้ที่ 500 rps คำขอที่เกิน 500 rps จะถูกตัดเป็น HTTP 429 ทันที

---

## 10. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การจัดการสภาพแวดล้อม Dev/Prod ด้วยคอนฟิกที่น้อยที่สุด (AWS Academy Slide 97-99)
**สถานการณ์:** นักพัฒนากำลังสร้างเว็บแอปพลิเคชันที่ใช้ Amazon API Gateway โดยต้องการแยกสภาพแวดล้อมการทำงานสำหรับ Development (dev) และ Production (prod) ออกจากกัน ระบบหลังบ้านขับเคลื่อนด้วย AWS Lambda ซึ่งมีการสร้าง Alias แยกเป็น `dev` และ `prod` ไว้อยู่แล้ว นักพัฒนาควรออกแบบ API Gateway อย่างไรเพื่อให้จัดการได้ง่ายและใช้แรงตั้งค่า (Configuration) น้อยที่สุด?
- ก) สร้าง REST API แยกกัน 2 ตัว โดยตัวหนึ่งผูกกับ Lambda alias `dev` และอีกตัวผูกกับ `prod` จากนั้นแยกดีพลอยคนละ Stage
- ข) สร้าง REST API เพียงตัวเดียว และกำหนดการเชื่อมต่อ Lambda โดยใช้ Stage Variable แทนชื่อ Alias จากนั้นดีพลอยไปยัง 2 Stages (`dev` และ `prod`) และกำหนดค่าตัวแปรในแต่ละสเตจให้ตรงกับ Alias ที่ต้องการ
- ค) สร้าง REST API ตัวเดียว เชื่อมกับ Alias `dev` แล้วเปิด Canary Release สำหรับรองรับทราฟฟิกของ `prod`
- ง) รวมโค้ด Dev และ Prod ไว้ใน Lambda Alias เดียวกัน แล้วเขียน if-else ในโค้ดเพื่อตรวจจับ Host Header
- **เฉลย:** **ข) สร้าง REST API เพียงตัวเดียว และกำหนดการเชื่อมต่อ Lambda โดยใช้ Stage Variable แทนชื่อ Alias จากนั้นดีพลอยไปยัง 2 Stages (`dev` และ `prod`) และกำหนดค่าตัวแปรในแต่ละสเตจให้ตรงกับ Alias ที่ต้องการ**
- **จุดหลอก (Exam Trap):** การสร้าง 2 API (ข้อ ก) ทำให้เกิดภาระในการอัปเดตสคีมาซ้ำซ้อนสองรอบ ส่วนการใช้ Canary (ข้อ ค) มีไว้สำหรับทยอยอัปเกรดเวอร์ชัน ไม่ใช่การแยกสภาพแวดล้อม
- **เหตุผลทางเทคนิค:** Stage Variables ออกแบบมาเพื่อกรณีนี้โดยตรง ช่วยให้ Route เดิมใน API เดียวกันสามารถชี้ไปยัง Lambda Function หรือ Alias ที่ต่างกันได้ตาม Stage ที่ถูกเรียกใช้

### ข้อที่ 2: ข้อผิดพลาด 502 Bad Gateway บน Lambda Proxy Integration
**สถานการณ์:** นักพัฒนาเชื่อมต่อ API Gateway เข้ากับฟังก์ชัน AWS Lambda ผ่านโหมด Lambda Proxy Integration เมื่อทดสอบยิงคำขอผ่านเบราว์เซอร์ พบว่าได้รับผลลัพธ์เป็น HTTP Status `502 Bad Gateway` แต่เมื่อตรวจสอบใน CloudWatch Logs พบว่าโค้ดฟังก์ชัน Lambda ประมวลผลสำเร็จและไม่มี Error ใดๆ สาเหตุที่เป็นไปได้มากที่สุดคืออะไร?
- ก) ฟังก์ชัน Lambda ใช้เวลาประมวลผลนานเกิน 29 วินาที ทำให้อินทิเกรชันหมดเวลา (Timeout)
- ข) ฟังก์ชัน Lambda คืนค่า (Return) เป็นข้อความสตริงธรรมดา โดยไม่ได้ส่งกลับเป็น JSON Object ที่มีโครงสร้างระบุ `statusCode` และ `body`
- ค) IAM Role ของ API Gateway ไม่มีสิทธิ์เรียกใช้ Lambda function
- ง) สเตจที่เรียกใช้งานยังไม่ได้เปิดระบบ API Gateway Caching
- **เฉลย:** **ข) ฟังก์ชัน Lambda คืนค่า (Return) เป็นข้อความสตริงธรรมดา โดยไม่ได้ส่งกลับเป็น JSON Object ที่มีโครงสร้างระบุ `statusCode` และ `body`**
- **จุดหลอก (Exam Trap):** ข้อ ก จะส่งคืนสถานะ `504 Gateway Timeout` ไม่ใช่ 502; ข้อ ค จะส่งคืน `500 Internal Server Error` หรือ `403 Forbidden`
- **เหตุผลทางเทคนิค:** Lambda Proxy Integration มีข้อกำหนดตายตัวว่าผลลัพธ์จาก Lambda จะต้องถูกส่งกลับมาเป็น Schema ที่ API Gateway รู้จัก หากโค้ดส่งคืนข้อความลอยๆ API Gateway จะไม่สามารถแปลงผลตอบกลับได้และพ่นข้อผิดพลาด `502 Bad Gateway` ทันที

### ข้อที่ 3: การเลือกกลไกยืนยันตัวตนสำหรับเว็บแอปพลิเคชันที่มีผู้ใช้ภายนอกจำนวนมาก
**สถานการณ์:** ระบบสั่งอาหารออนไลน์ต้องการเปิด API บน API Gateway สำหรับให้ลูกค้าทั่วไปล็อกอินผ่าน Mobile App เพื่อดูเมนูและสั่งอาหาร ผู้ใช้งานจะทำการยืนยันตัวตนผ่าน Amazon Cognito User Pools และได้รับ JWT Token กลับมา สถาปัตยกรรมการตรวจสิทธิ์ใดที่ช่วยลด Latency และลดต้นทุนค่าประมวลผลได้ดีที่สุด?
- ก) สร้าง Lambda Authorizer เพื่อรับ JWT Token มาถอดรหัสและตรวจสอบลายเซ็นด้วยโค้ด Python
- ข) ใช้ Cognito User Pools Authorizer ที่ฝังมากับ API Gateway โดยตรง
- ค) ส่ง Access Key ID และ Secret Access Key ของบัญชี AWS ให้แก่ผู้ใช้งานเพื่อใช้ IAM Authorization (SigV4)
- ง) ปิดการยืนยันตัวตนบน API Gateway แล้วส่ง Token ไปตรวจสอบภายในฟังก์ชัน Lambda หลังบ้าน
- **เฉลย:** **ข) ใช้ Cognito User Pools Authorizer ที่ฝังมากับ API Gateway โดยตรง**
- **จุดหลอก (Exam Trap):** การใช้ Lambda Authorizer (ข้อ ก) ทำงานได้จริง แต่ต้องเสียค่าใช้จ่ายและเกิด Latency จากการรัน Lambda Function เพิ่มอีกตัวในทุกคำขอ ส่วนข้อ ค เป็นข้อห้ามร้ายแรงด้านความปลอดภัย
- **เหตุผลทางเทคนิค:** Cognito User Pools Authorizer ทำงานในระดับเนทีฟบน API Gateway โดยระบบจะตรวจสอบความถูกต้องของ JWT Token ให้ทันทีโดยไม่ต้องรันโค้ด Compute เพิ่มเติม จึงประหยัดและรวดเร็วที่สุด

### ข้อที่ 4: การป้องกัน API ด้วยการจำกัดอัตราคำขอของลูกค้ารายบุคคล
**สถานการณ์:** บริษัท SaaS ให้บริการข้อมูลสภาพอากาศผ่าน REST API โดยมีลูกค้าสมัครสมาชิกหลายระดับ (Free, Pro, Enterprise) บริษัทต้องการจำกัดให้ลูกค้ากลุ่ม Free สามารถเรียกใช้ API ได้ไม่เกิน 5 คำขอต่อวินาที และไม่เกิน 1,000 คำขอต่อวัน วิศวกรควรนำฟีเจอร์ใดของ API Gateway มาใช้งาน?
- ก) ตั้งค่า Account-level Throttling บนคอนโซล API Gateway
- ข) สร้าง Usage Plan พร้อมกำหนดค่า Rate/Burst Throttling และ Quota จากนั้นสร้าง API Key ผูกเข้ากับ Usage Plan ให้ลูกค้าแต่ละราย
- ค) ติดตั้ง AWS WAF แล้วเขียน Rule กรองตาม IP Address ของลูกค้า
- ง) เขียนโค้ดใน Lambda Function เพื่อนับจำนวนคำขอลงในตาราง DynamoDB
- **เฉลย:** **ข) สร้าง Usage Plan พร้อมกำหนดค่า Rate/Burst Throttling และ Quota จากนั้นสร้าง API Key ผูกเข้ากับ Usage Plan ให้ลูกค้าแต่ละราย**
- **จุดหลอก (Exam Trap):** การใช้ WAF (ข้อ ค) หรือเขียนเช็กใน Lambda (ข้อ ง) มีค่าใช้จ่ายสูงและซับซ้อน ส่วน Account-level (ข้อ ก) เป็นการจำกัดทราฟฟิกรวมทั้งบัญชี ไม่ใช่รายบุคคล
- **เหตุผลทางเทคนิค:** Usage Plan ร่วมกับ API Key ออกแบบมาเพื่อการแบ่ง Tier ลูกค้าโดยเฉพาะ สามารถกำหนดได้ทั้ง Rate (คำขอต่อวินาที) และ Quota (โควตารายวัน/สัปดาห์/เดือน) ที่ระดับเกตเวย์ก่อนถึงระบบหลังบ้าน

### ข้อที่ 5: การเชื่อมต่อ API Gateway สาธารณะเข้ากับระบบไมโครเซอร์วิสในไพรเวตซับเน็ต
**สถานการณ์:** ธนาคารแห่งหนึ่งต้องการสร้าง API Gateway เพื่อให้แอปพลิเคชันบนมือถือเข้าใช้งาน แต่ระบบประมวลผลบัญชีหลังบ้านติดตั้งอยู่บน Amazon ECS Containers ภายใน Private Subnet ของ Amazon VPC ซึ่งไม่มี Public IP Address และห้ามเปิดช่องทางให้อินเทอร์เน็ตเข้าถึงโดยตรง ควรออกแบบการเชื่อมต่ออย่างไรให้ปลอดภัยและได้มาตรฐาน?
- ก) สร้าง Internet Gateway ให้กับ Private Subnet แล้วต่อตรงเข้ากับ ECS
- ข) กำหนด Backend Integration บน API Gateway เป็นแบบ Private Integration โดยใช้ VPC Link เชื่อมต่อไปยัง Network Load Balancer (NLB) ใน VPC
- ค) ใช้ Edge-optimized Endpoint แล้วตั้ง Security Group อนุญาต 0.0.0.0/0
- ง) ย้าย ECS Containers ทั้งหมดออกมาไว้บน Public Subnet
- **เฉลย:** **ข) กำหนด Backend Integration บน API Gateway เป็นแบบ Private Integration โดยใช้ VPC Link เชื่อมต่อไปยัง Network Load Balancer (NLB) ใน VPC**
- **จุดหลอก (Exam Trap):** ข้อ ก, ค, และ ง เป็นการละเมิดนโยบายความมั่นคงปลอดภัยโดยการเปิดระบบหลังบ้านออกสู่สาธารณะ
- **เหตุผลทางเทคนิค:** Private Integration ผ่าน VPC Link ช่วยให้ API Gateway ที่อยู่บนเน็ตเวิร์กของ AWS สามารถส่งทราฟฟิกเข้าสู่ Private Subnet ภายใน VPC ของลูกค้าได้อย่างปลอดภัยผ่าน NLB/ALB โดยที่ระบบหลังบ้านไม่ต้องเปิด Public IP
