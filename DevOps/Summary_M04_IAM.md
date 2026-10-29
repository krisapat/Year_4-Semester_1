# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 4: Securing Access to Cloud Resources (AWS IAM & Shared Responsibility)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 51 หน้า พร้อมถอดความโครงสร้างนโยบายและ Decision Tree แผนผังการประเมินสิทธิ์ครบถ้วน

---

## 1. ภาพรวมและแก่นสำคัญ (Core Concept)

- **AWS Identity and Access Management (IAM):** บริการจัดการการยืนยันตัวตนและการกำหนดสิทธิ์การเข้าถึงทรัพยากรบน AWS อย่างปลอดภัย โดยไม่มีค่าใช้จ่ายเพิ่มเติม
- **สองเสาหลักความปลอดภัย (Security Fundamentals):**
  1. **การยืนยันตัวตน (Authentication - AuthN):** ตรวจสอบว่า "ผู้ขอเข้าใช้งานคือใคร?" (Who is requesting access?) ผ่านข้อมูลระบุตัวตน (Credentials) เช่น รหัสผ่าน, Access Keys, หรือ MFA
  2. **การอนุญาตสิทธิ์ (Authorization - AuthZ):** ตรวจสอบว่า "ผู้ใช้งานที่ผ่านการยืนยันแล้ว สามารถทำอะไรได้บ้าง?" (What are they allowed to do?) ผ่านเอกสารนโยบาย (IAM Policies)

---

## 2. โมเดลความรับผิดชอบร่วม (AWS Shared Responsibility Model)

ข้อสอบออกทุกชุด เป็นเส้นแบ่งขอบเขตความปลอดภัยระหว่าง AWS และลูกค้า:

| มิติความปลอดภัย | ความรับผิดชอบของ AWS (**Security OF the Cloud**) | ความรับผิดชอบของลูกค้า (**Security IN the Cloud**) |
| :--- | :--- | :--- |
| **ความหมาย** | ความปลอดภัยของโครงสร้างพื้นฐานคลาวด์ | ความปลอดภัยของสิ่งที่ลูกค้านำไปรันบนคลาวด์ |
| **ฮาร์ดแวร์ / เครือข่าย** | Data Centers, เซิร์ฟเวอร์จริง, สายเคเบิล, Regions, AZs, Edge Locations | การตั้งค่า Security Groups, Network ACLs, Route Tables, Subnets |
| **ระบบปฏิบัติการ (OS)** | OS ของบริการ Managed Services (เช่น S3, DynamoDB, Lambda) | **Guest OS** บน EC2 (การแพตช์ความปลอดภัย, อัปเดต OS, Antivirus) |
| **การควบคุมสิทธิ์** | การแยก Tenant ในระดับ Hypervisor และระบบหลังบ้าน | **IAM Users, Groups, Roles, Policies, Password Policy, MFA** |
| **การจัดการข้อมูล** | การทำลายดิสก์ฮาร์ดแวร์ที่ปลดระวางตามมาตรฐานความปลอดภัย | การสำรองข้อมูล (Backup), การจำแนกประเภทข้อมูล |
| **การเข้ารหัส (Encryption)** | จัดหาระบบฮาร์ดแวร์และอัลกอริทึมเข้ารหัส (เช่น AWS KMS) | **Client-side & Server-side Encryption, การเปิด HTTPS/TLS** |

---

## 3. องค์ประกอบและโครงสร้างของ IAM (IAM Entities)

### 3.1 Account Root User (บัญชีรูท)
- สร้างขึ้นพร้อมกับการเปิดบัญชี AWS ใช้อีเมลและรหัสผ่านในการล็อกอิน
- มีสิทธิ์สูงสุดแบบไร้ขีดจำกัด (Unrestricted Access) ข้ามทุกทรัพยากรในบัญชี
- ⚠️ **Best Practice & จุดตายข้อสอบ:** **ห้าม** ใช้ Root User ในการทำงานประจำวัน หรือใช้รันแอปพลิเคชันเด็ดขาด ต้องล็อกเก็บไว้ เปิดใช้งาน MFA ขั้นสูงสุด และสร้าง IAM User ที่มีสิทธิ์เท่าที่จำเป็นมาใช้งานแทน

### 3.2 IAM Users (ผู้ใช้งานเดี่ยว)
- ตัวแทนบุคคลหรือบริการที่ต้องการเข้าถึง AWS แบบระยะยาว (Long-term Credentials)
- **ประเภท Credentials:**
  1. **Username + Password (+ MFA):** สำหรับล็อกอินเข้า AWS Management Console
  2. **Access Key ID + Secret Access Key:** สำหรับเข้าถึงผ่าน AWS CLI, SDKs หรือ REST APIs (คู่คีย์มีได้สูงสุด 2 ชุดต่อ 1 User)

### 3.3 IAM Groups (กลุ่มผู้ใช้งาน)
- รวมกลุ่ม IAM Users เพื่อให้ง่ายต่อการผูกนโยบายสิทธิ์ (Policies) ร่วมกัน
- **ข้อจำกัดสำคัญ (ข้อสอบชอบออก):**
  - กลุ่ม **ไม่สามารถ** ซ้อนกลุ่มได้ (No Nested Groups) เช่น เอา Group A ไปใส่ใน Group B ไม่ได้
  - กลุ่ม **ไม่สามารถ** ถูกระบุเป็น `Principal` ใน Resource-based Policy ได้ (อนุญาตสิทธิ์ให้ทั้ง Group ผ่าน Bucket Policy ไม่ได้ ต้องระบุเป็น User หรือ Role)

### 3.4 IAM Roles (บทบาทและสิทธิ์ชั่วคราว)
- ไม่ได้ผูกติดกับบุคคลใดบุคคลหนึ่ง แต่เปิดให้ "สวมบทบาท" (Assume Role) ได้
- จ่ายสิทธิ์ในรูปแบบ **Temporary Security Credentials** ผ่านบริการ AWS STS (Security Token Service) ซึ่งจะหมดอายุอัตโนมัติ
- **กรณีการใช้งานหลัก (Primary Use Cases):**
  1. **Applications บน EC2 / Lambda:** มอบสิทธิ์ให้โค้ดเรียกบริการอื่น โดยไม่ต้องฮาร์ดโค้ด Access Key ลงในเครื่อง
  2. **Cross-Account Access:** ให้สิทธิ์ผู้ใช้งานจาก AWS Account A เข้ามาจัดการ Resource บน Account B
  3. **Federated Identity:** รองรับการล็อกอินผ่าน Identity Provider ภายนอก (เช่น Google, Active Directory, SAML 2.0)

### 3.5 การจัดการไฟล์ Credentials สำหรับนักพัฒนา
- ไฟล์เก็บคีย์ในเครื่องเครื่องพัฒนา:
  - Linux / macOS: `~/.aws/credentials`
  - Windows: `C:\Users\USERNAME\.aws\credentials`
- โครงสร้าง Profile และการเรียกใช้ในโค้ด (Boto3):
  ```ini
  [default]
  aws_access_key_id = AKIAIOSFODNN7EXAMPLE
  aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

  [prod]
  aws_access_key_id = AKIAI44QH8DHBEXAMPLE
  aws_secret_access_key = je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
  ```
  ```python
  import boto3
  session = boto3.Session(profile_name='prod')
  s3 = session.client('s3')
  ```

---

## 4. นโยบายสิทธิ์และตรรกะการประเมินสิทธิ์ (Policies & Evaluation Logic)

### 4.1 ประเภทของ IAM Policies
1. **Identity-based Policies:** ผูกติดกับ User, Group, หรือ Role เขียนด้วย JSON
   - **AWS Managed Policies:** AWS สร้างและดูแลให้ อัปเดตสิทธิ์อัตโนมัติ (เช่น `AdministratorAccess`)
   - **Customer Managed Policies:** ผู้ใช้สร้างและควบคุมเอง ปรับแต่งสิทธิ์ได้ละเอียด มี Versioning และ Rollback ได้
   - **Inline Policies:** ฝังอยู่ใน Entity นั้นๆ แบบ 1 ต่อ 1 ลบ Entity ทิ้ง นโยบายจะหายไปด้วย
2. **Resource-based Policies:** ฝังอยู่กับทรัพยากรโดยตรง (เช่น S3 Bucket Policy, KMS Key Policy) เพื่อกำหนดว่าใครเข้าถึงได้บ้าง

### 4.2 โครงสร้างไฟล์นโยบาย JSON (Policy Structure)
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3AndDynamoDB",
      "Effect": "Allow",
      "Action": [
        "dynamodb:*",
        "s3:*"
      ],
      "Resource": [
        "arn:aws:dynamodb:us-east-1:123456789012:table/pollynotes",
        "arn:aws:s3:::polly-notes-web/*"
      ]
    },
    {
      "Sid": "DenyEverythingElse",
      "Effect": "Deny",
      "Action": ["s3:*"],
      "NotResource": [
        "arn:aws:s3:::polly-notes-web/*"
      ]
    }
  ]
}
```

### 4.3 ตรรกะการตัดสินใจประเมินสิทธิ์ (Evaluation Decision Tree - จากไดอะแกรมหน้า 33)
เมื่อมีคำขอ (Request) เข้ามายัง AWS ระบบจะรวบรวมทุกนโยบายที่เกี่ยวข้องมาประเมินตามลำดับ 3 ขั้นตอนตายตัว:

```text
               [ รวมทุกนโยบายที่เกี่ยวข้องมาประเมิน ]
                                 │
                                 ▼
                     ┌───────────────────────┐
                     │ มี Explicit Deny ไหม? │
                     └───────────────────────┘
                                 │
                   ┌─────────────┴─────────────┐
                  YES                          NO
                   │                           │
                   ▼                           ▼
        ┌──────────────────────┐   ┌───────────────────────┐
        │  DENY (ปฏิเสธทันที)  │   │ มี Explicit Allow ไหม? │
        └──────────────────────┘   └───────────────────────┘
                                               │
                                 ┌─────────────┴─────────────┐
                                YES                          NO
                                 │                           │
                                 ▼                           ▼
                      ┌──────────────────────┐   ┌──────────────────────┐
                      │  ALLOW (อนุญาตสิทธิ์) │   │ DENY (Implicit Deny) │
                      └──────────────────────┘   └──────────────────────┘
```

1. **ลำดับที่ 1 (Explicit Deny Check):** หากพบนโยบายใดระบุ `"Effect": "Deny"` ที่ตรงกับคำขอ คำขอจะถูก **ปฏิเสธทันที (Denied)** โดยไม่มีข้อยกเว้น แม้จะมี Allow อีก 100 ข้อก็ตาม
2. **ลำดับที่ 2 (Explicit Allow Check):** หากไม่มี Deny และมีนโยบายระบุ `"Effect": "Allow"` ตรงกับคำขอ คำขอจะถูก **อนุญาต (Allowed)**
3. **ลำดับที่ 3 (Default Implicit Deny):** หากไม่มีทั้ง Deny และ Allow ระบบจะตัดสิทธิ์เป็น **ปฏิเสธโดยปริยาย (Implicit Deny)** ตามหลักความปลอดภัยเริ่มต้น

---

## 5. การวิเคราะห์สถานการณ์สิทธิ์ (IAM Scenarios 1–6 จากสไลด์ 37-42)

- **Scenario 1 & 2 (Root Login):** การล็อกอินด้วยอีเมลของบัญชีจะเข้าถึงในฐานะ **Account Root User** ซึ่งมีสิทธิ์เต็มทุกประการ ไม่ปลอดภัยสำหรับการทำงานประจำวัน
- **Scenario 3 (Individual IAM User):** สร้าง IAM User แยกรายบุคคล (เช่น `sofia`) และผูกนโยบายผ่าน User หรือ Group ปลอดภัยและสามารถตรวจสอบย้อนหลัง (Audit) ได้ว่าใครเป็นคนทำ
- **Scenario 4 & 5 (Multiple Group Inheritance):** สมาชิกที่อยู่หลายกลุ่ม (เช่น Sofía อยู่ทั้ง `Admins` และ `DBAdmins`) จะได้รับสิทธิ์สะสม (Cumulative) ของทุกกลุ่มรวมกัน โดยที่ Explicit Deny จากกลุ่มใดกลุ่มหนึ่งจะหักล้าง Allow ทั้งหมด
- **Scenario 6 (Role Delegation):** ผู้ใช้สามารถเปลี่ยนบริบทการทำงานได้ชั่วคราวผ่านการ Assume Role (เช่น `TempDBRole`) โดยระบบจะออก STS Token ชั่วคราวให้ เมื่อหมดเวลาก็กลับสู่สิทธิ์เดิม

---

## 6. ตารางเปรียบเทียบเชิงสถาปัตยกรรม (Comparison Tables)

### 6.1 เปรียบเทียบ IAM Entities

| หัวข้อ | IAM User | IAM Group | IAM Role |
| :--- | :--- | :--- | :--- |
| **ความหมาย** | ตัวตนถาวรของบุคคลหรือระบบ | รวมกลุ่ม User เพื่อผูกสิทธิ์ | บทบาทชั่วคราวที่ใครก็สวมได้ |
| **ประเภท Credentials** | Password หรือ Access Keys ถาวร | ไม่มี Credentials ในตัวเอง | Security Tokens ชั่วคราว (STS) |
| **การผูก Policies** | ผูกได้โดยตรง | ผูกได้โดยตรง (แจกจ่ายสู่สมาชิก) | ผูกได้ (ทั้ง Permissions & Trust) |
| **ความสัมพันธ์** | อยู่ในหลาย Group ได้ | สมาชิกเป็น User เท่านั้น (ห้ามซ้อน Group) | สวมได้โดย Users, EC2, หรือข้าม Account |
| **ความเสี่ยงความปลอดภัย** | สูงหากทำคีย์หลุด (ต้องคอยหมุนคีย์) | ต่ำ (ขึ้นกับสิทธิ์ที่ผูก) | ต่ำมาก (คีย์หมดอายุอัตโนมัติ) |

### 6.2 เปรียบเทียบ Managed Policy vs Inline Policy

| มิติ | AWS Managed Policy | Customer Managed Policy | Inline Policy |
| :--- | :--- | :--- | :--- |
| **ผู้สร้าง/ดูแล** | AWS ดูแลให้ 100% | ผู้ดูแลระบบขององค์กรสร้างเอง | ผู้ดูแลระบบฝังไว้ใน Entity เดี่ยว |
| **การนำกลับมาใช้ซ้ำ** | นำไปผูกกับหลาย Entity ได้ | นำไปผูกกับหลาย Entity ได้ | **ใช้ซ้ำไม่ได้** (ผูกขาด 1:1 กับ Entity นั้น) |
| **การอัปเดตสิทธิ์** | แก้ไขเนื้อหาไม่ได้ (AWS ปรับปรุงให้) | แก้ไขที่เดียว มีผลกับทุก Entity ทันที | ต้องเข้าไปแก้ทีละ Entity |
| **การทำ Versioning** | มี Version ควบคุมโดย AWS | รองรับ Versioning และ Rollback ได้ 5 เวอร์ชั่น | ไม่รองรับ Versioning |

---

## 7. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการเก็บ Access Key บน EC2 / AMI:** ข้อสอบชอบให้สถานการณ์ว่า "แอปพลิเคชันบน EC2 ต้องต่อ DynamoDB ให้เขียนสคริปต์ดึง Access Key จากไฟล์ข้อความบนเครื่อง หรือฝังไว้ใน Custom AMI หรือดึงจาก S3"
   - ✅ **ที่ถูกต้อง:** ผิดหลักความปลอดภัย 100%! วิธีแก้ที่ถูกต้องตามแบบแผน AWS คือ **สร้าง IAM Role แล้วแนบให้กับ EC2 Instance Profile** แอปพลิเคชันจะดึง Temporary Credentials ผ่าน Instance Metadata Service (IMDS) อัตโนมัติ ปลอดภัยและไม่ต้องบริหารจัดการคีย์
2. ❌ **หลอกเรื่องความสัมพันธ์ระหว่าง Allow และ Deny:** ข้อสอบมักหลอกว่า User A มีสิทธิ์ระดับ `AdministratorAccess` (Allow `*`) แต่อยู่ใน Group ที่มีคำสั่ง Deny `s3:DeleteBucket` ถามว่า User A จะลบ Bucket ได้หรือไม่?
   - ✅ **ที่ถูกต้อง:** **ลบไม่ได้เด็ดขาด!** เพราะใน IAM กฎเหล็กคือ **Explicit Deny ชนะเสมอ (Deny Always Wins)** ไม่ว่า Allow จะมาจากสิทธิ์ Admin ก็ตาม
3. ❌ **หลอกเรื่อง IAM Group ใน Bucket Policy:** โจทย์ถามว่าต้องการให้สมาชิกในกลุ่ม `DevTeam` เข้าถึง S3 Bucket ได้ จึงใส่ ARN ของ Group ลงในฟิลด์ `Principal` ของ Bucket Policy
   - ✅ **ที่ถูกต้อง:** ไวยากรณ์จะผิดพลาดทันที เพราะ **IAM Group ไม่ใช่ Principal** ไม่สามารถนำไปใส่ใน Resource-based Policy ได้ หากต้องการแชร์ ต้องระบุเป็น IAM Role หรือ IAM Users เป็นรายคน
4. ❌ **หลอกเรื่อง Shared Responsibility บน EC2 vs S3:** ข้อสอบถามว่า "ใครเป็นผู้รับผิดชอบการอัปเดตแพตช์ระบบปฏิบัติการของ Amazon S3 และ EC2 ตามลำดับ?"
   - ✅ **ที่ถูกต้อง:** S3 เป็นบริการ Managed Service ดังนั้น **AWS เป็นผู้รับผิดชอบ OS**; ส่วน EC2 เป็น IaaS ดังนั้น **ลูกค้าต้องเป็นผู้รับผิดชอบ OS และการแพตช์ความปลอดภัยเอง**

---

## 8. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การรักษาความปลอดภัยของข้อมูลประจำตัวบน EC2 (AWS Academy Slide 47-49)
**สถานการณ์:** บริษัทแห่งหนึ่งจัดเก็บ Access Key ID และ Secret Access Key ไว้ในไฟล์ข้อความธรรมดาบน Custom Amazon Machine Image (AMI) โดยแอปพลิเคชันที่สร้างจาก AMI นี้ต้องใช้คู่คีย์ดังกล่าวเพื่อเข้าถึงตาราง DynamoDB ทีมความปลอดภัยสั่งระงับและบังคับให้ปรับปรุงระบบให้มีความปลอดภัยสูงสุดตามมาตรฐาน AWS สถาปัตยกรรมใดตอบโจทย์นี้?
- ก) ย้าย Access Key ไปเก็บไว้ใน Amazon S3 Bucket แบบส่วนตัว แล้วให้ Instance ดาวน์โหลดมาตอนบูต
- ข) ส่งค่า Access Key เข้าไปใน Instance ผ่านทาง EC2 User Data
- ค) ติดตั้ง Key Server ขึ้นมาใน Private Subnet เพื่อจ่าย Access Key ให้ Instance เมื่อร้องขอ
- ง) สร้าง IAM Role ที่มีสิทธิ์เข้าถึงตาราง DynamoDB แล้วเปิดใช้งาน Instance โดยผูกเข้ากับ IAM Role ดังกล่าว
- **เฉลย:** **ง) สร้าง IAM Role ที่มีสิทธิ์เข้าถึงตาราง DynamoDB แล้วเปิดใช้งาน Instance โดยผูกเข้ากับ IAM Role ดังกล่าว**
- **จุดหลอก (Exam Trap):** ข้อ ก, ข, และ ค ยังคงเป็นการใช้งาน Long-term Access Key ที่มีความเสี่ยงต่อการรั่วไหล และ User Data (ข้อ ข) สามารถเปิดดูได้ง่ายผ่านคอนโซล EC2
- **เหตุผลทางเทคนิค:** การใช้ IAM Role ร่วมกับ EC2 Instance Profile เป็น Best Practice สากล แอปพลิเคชันจะได้รับ Temporary Credentials ที่ระบบหมุนเวียน (Rotate) คีย์ให้อัตโนมัติ ไร้ปัญหาคีย์หลุด

### ข้อที่ 2: การประเมินผลลัพธ์ของนโยบายที่มีข้อขัดแย้ง (Policy Conflict)
**สถานการณ์:** วิศวกรคลาวด์ได้รับมอบหมายนโยบาย Managed Policy จากส่วนกลางซึ่งระบุสิทธิ์ `"Effect": "Allow", "Action": "s3:*", "Resource": "*"` ต่อมาหัวหน้าทีมได้แนบ Inline Policy เพิ่มเติมที่ระบุ `"Effect": "Deny", "Action": "s3:Delete*", "Resource": "arn:aws:s3:::production-data/*"` เมื่อวิศวกรท่านนี้พยายามลบไฟล์ในถัง `production-data` ระบบจะตอบสนองอย่างไร?
- ก) ลบได้สำเร็จ เพราะ Managed Policy ระบุ Allow ระดับ `*` ซึ่งมีขอบเขตกว้างกว่า
- ข) ลบได้สำเร็จ เพราะสิทธิ์ Allow ถูกประเมินก่อน Deny ในระบบ
- ค) ลบไม่สำเร็จ (Access Denied) เพราะคำสั่ง Explicit Deny จะหักล้างสิทธิ์ Allow เสมอ
- ง) ระบบแจ้งเตือนให้ผู้ดูแลระบบยืนยันสิทธิ์ก่อนดำเนินการลบ
- **เฉลย:** **ค) ลบไม่สำเร็จ (Access Denied) เพราะคำสั่ง Explicit Deny จะหักล้างสิทธิ์ Allow เสมอ**
- **จุดหลอก (Exam Trap):** หลายคนสับสนคิดว่าสิทธิ์ที่กว้างกว่า หรือสิทธิ์จาก Managed Policy ส่วนกลางจะมีน้ำหนักมากกว่า Inline Policy
- **เหตุผลทางเทคนิค:** ตาม Decision Tree ของ IAM (หน้า 33) เมื่อพบ Explicit Deny ที่ตรงกับ Action และ Resource คำขอจะถูกตัดสิทธิ์เป็น Deny ทันทีโดยไม่สนว่าจะมี Allow อยู่กี่ข้อความ

### ข้อที่ 3: ขอบเขตความรับผิดชอบร่วมบนบริการฐานข้อมูล
**สถานการณ์:** องค์กรใช้งานระบบฐานข้อมูลบนคลาวด์ 2 รูปแบบ ได้แก่ Amazon RDS MySQL และ MySQL ที่ติดตั้งบน Amazon EC2 Instance เอง ตามข้อกำหนดของ AWS Shared Responsibility Model งานใดต่อไปนี้เป็นหน้าที่ที่ **ลูกค้าต้องจัดการเองบน EC2 แต่ AWS จัดการให้บน RDS**?
- ก) การควบคุมสิทธิ์การเข้าถึงฐานข้อมูลของผู้ใช้งาน (Database User Access Control)
- ข) การแพตช์ความปลอดภัยระดับระบบปฏิบัติการของเซิร์ฟเวอร์ (OS Security Patching)
- ค) การปรับปรุงประสิทธิภาพของคิวรี SQL ภายในแอปพลิเคชัน (SQL Query Optimization)
- ง) การจำแนกประเภทความลับของข้อมูลที่จัดเก็บในตาราง (Data Classification)
- **เฉลย:** **ข) การแพตช์ความปลอดภัยระดับระบบปฏิบัติการของเซิร์ฟเวอร์ (OS Security Patching)**
- **จุดหลอก (Exam Trap):** ข้อ ก, ค, และ ง เป็นความรับผิดชอบของลูกค้าในทั้งสองกรณี (ทั้งบน EC2 และ RDS ลูกค้าต้องดูแล Data, App, และ DB User เองเสมอ)
- **เหตุผลทางเทคนิค:** RDS เป็น Managed Service ซึ่ง AWS ดูแลตั้งแต่ Hardware, OS, และการแพตช์ Engine ฐานข้อมูลให้ แต่ถ้าลูกค้าติดตั้งบน EC2 ลูกค้าจะต้องรับผิดชอบการดูแล Guest OS และอัปเดตแพตช์ด้วยตัวเอง

### ข้อที่ 4: การให้สิทธิ์ระบบงานข้ามบัญชี (Cross-Account Delegation)
**สถานการณ์:** แอปพลิเคชันบน AWS Account A (Development) จำเป็นต้องอ่านไฟล์บันทึกประวัติการทำงานใน Amazon S3 Bucket ที่อยู่บน AWS Account B (Production) ทีมความมั่นคงปลอดภัยต้องการให้สิทธิ์เฉพาะช่วงเวลาที่จำเป็นและตรวจสอบได้ ควรออกแบบสถาปัตยกรรมอย่างไร?
- ก) ส่ง Access Key ของ Root User บัญชี B ให้นักพัฒนาบัญชี A นำไปฝังในโค้ด
- ข) สร้าง IAM User บนบัญชี B แล้วส่ง Access Key ถาวรไปเก็บไว้บนเครื่องเซิร์ฟเวอร์บัญชี A
- ค) สร้าง IAM Role บนบัญชี B ที่มีสิทธิ์อ่าน S3 พร้อมกำหนด Trust Policy ให้บัญชี A สามารถ Assume Role ได้
- ง) ทำการ Peering ระหว่างทั้งสองบัญชีแล้วเปิด Public Read บน S3 Bucket ของบัญชี B
- **เฉลย:** **ค) สร้าง IAM Role บนบัญชี B ที่มีสิทธิ์อ่าน S3 พร้อมกำหนด Trust Policy ให้บัญชี A สามารถ Assume Role ได้**
- **จุดหลอก (Exam Trap):** ข้อ ก และ ข ใช้ Long-term Credentials ข้ามบัญชีซึ่งผิดมาตรฐานอย่างร้ายแรง ส่วนข้อ ง การเปิด Public Read ทำให้ข้อมูลรั่วไหลสู่สาธารณะ
- **เหตุผลทางเทคนิค:** การใช้ IAM Role ข้ามบัญชีผ่าน STS AssumeRole เป็นแนวทางที่ปลอดภัยที่สุด เพราะระบบปลายทางควบคุม Trust Policy ได้เอง และฝั่งต้นทางจะได้รับคีย์ชั่วคราวที่มีอายุจำกัด

### ข้อที่ 5: การออกแบบกลุ่มผู้ใช้งานตามหลักสิทธิ์ขั้นต่ำ (Least Privilege)
**สถานการณ์:** บริษัทมีนักพัฒนาเข้าใหม่ 5 คน ทุกคนต้องพัฒนาโค้ดบน AWS Lambda แต่มีเพียง 2 คนที่ต้องมีสิทธิ์เข้าไปดู CloudWatch Logs เพื่อดีบักข้อผิดพลาด หากต้องการจัดการสิทธิ์ตามหลัก Principle of Least Privilege และบริหารจัดการง่ายที่สุด ควรจัดโครงสร้าง IAM อย่างไร?
- ก) แนบ Policy เต็มสิทธิ์ (AdministratorAccess) ให้ทุกคน แล้วบอกห้ามเข้าส่วนอื่น
- ข) สร้างกลุ่ม `Developers` แนบสิทธิ์ Lambda แล้วสร้างกลุ่ม `Debuggers` แนบสิทธิ์ CloudWatch Logs จากนั้นเพิ่มเฉพาะ 2 คนนั้นเข้ากลุ่ม `Debuggers` ด้วย
- ค) สร้าง IAM Role เดียวที่มีทั้งสิทธิ์ Lambda และ CloudWatch Logs แล้วให้ทุกคนใช้ร่วมกัน
- ง) ใส่สิทธิ์ CloudWatch Logs ไว้ในระดับ Root User แล้วแบ่งรหัสผ่านให้ 2 คนนั้น
- **เฉลย:** **ข) สร้างกลุ่ม `Developers` แนบสิทธิ์ Lambda แล้วสร้างกลุ่ม `Debuggers` แนบสิทธิ์ CloudWatch Logs จากนั้นเพิ่มเฉพาะ 2 คนนั้นเข้ากลุ่ม `Debuggers` ด้วย**
- **จุดหลอก (Exam Trap):** ข้อ ค ผิดเพราะอีก 3 คนจะได้รับสิทธิ์เกินความจำเป็น ส่วนข้อ ก และ ง เป็นการละเมิดความปลอดภัยขั้นรุนแรง
- **เหตุผลทางเทคนิค:** การสร้าง Group ตามหน้าที่การทำงาน (Job Function Groups) และกำหนดสิทธิ์แบบเจาะจง ช่วยให้สามารถเพิ่ม/ลดสิทธิ์ของสมาชิกได้อย่างเป็นระบบ โดยที่สมาชิกสามารถสังกัดได้มากกว่า 1 กลุ่มตามภาระงานจริง
