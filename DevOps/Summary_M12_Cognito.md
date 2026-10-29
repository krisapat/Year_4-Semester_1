# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 12: Developing Secure Applications on AWS (AWS STS & Amazon Cognito)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 50 หน้า พร้อมถอดความโครงสร้าง STS API Operations, User Pools vs Identity Pools, และโทเคน JWT ทั้ง 3 ชนิดครบถ้วน

---

## 1. ภาพรวมการรักษาความปลอดภัยและการเข้ารหัส (Security Fundamentals & ACM)

- **สองแกนหลักของความปลอดภัยแอปพลิเคชัน (สไลด์หน้า 16):**
  1. **การยืนยันตัวตน (Authentication - AuthN):** การตรวจสอบเพื่อยืนยันว่า "ผู้ใช้คือใคร?" (Verify identity) ผ่าน Identity Provider (IdP)
  2. **การอนุญาตสิทธิ์ (Authorization - AuthZ):** การตรวจสอบเพื่อกำหนดว่า "ผู้ใช้นั้นมีสิทธิ์ทำอะไรได้บ้าง?" (Verify permissions)
- **การเข้ารหัสการเชื่อมต่อเครือข่าย (TLS/SSL & ACM - สไลด์หน้า 9-12):**
  - เข้ารหัสข้อมูลระหว่างทาง (Data in transit) ผ่านโปรโตคอล HTTPS
  - **AWS Certificate Manager (ACM):** บริการออก จัดการ และต่ออายุ (Automatic Renewal) ใบรับรอง SSL/TLS สาธารณะได้ฟรีโดยไม่มีค่าใช้จ่ายเพิ่มเติม และรองรับ Private CA สำหรับระบบงานภายในองค์กร

---

## 2. AWS Security Token Service (AWS STS) และคีย์ชั่วคราว

- **ทำไมต้องใช้ Temporary Security Credentials? (สไลด์หน้า 17):**
  - ❌ **Bad Practice:** การฮาร์ดโค้ด Access Key ถาวรลงในโค้ด, ฝังใน AMI, หรือแชร์คีย์ระหว่างผู้ใช้ เสี่ยงต่อการรั่วไหล
  - ✅ **Best Practice:** ใช้ **IAM Role ร่วมกับ AWS STS** เพื่อขอรับข้อมูลประจำตัวชั่วคราว (Access Key ID, Secret Access Key, Session Token) ที่มีอายุจำกัดและหมดอายุอัตโนมัติ
- **ตารางสรุปคำสั่ง API ของ AWS STS (สไลด์หน้า 22 - ข้อสอบชอบออก):**

| คำสั่ง API | กลุ่มเป้าหมายที่ได้รับคีย์ชั่วคราว | ระยะเวลาอายุเริ่มต้น (Default Duration) | Use Cases สำคัญ |
| :--- | :--- | :--- | :--- |
| **`AssumeRole`** | ผู้ใช้งาน IAM ที่มีอยู่เดิมในระบบ | **1 ชั่วโมง** (ปรับได้ 15 นาที - 12 ชั่วโมง) | ใช้สำหรับการเข้าถึงทรัพยากร **ข้ามบัญชี (Cross-Account Access)** หรือแอปบน EC2 |
| **`AssumeRoleWithSAML`** | ผู้ใช้งานระดับองค์กร (Enterprise Federated Users) | 1 ชั่วโมง | ยืนยันตัวตนผ่านระบบองค์กรเดิม เช่น **Active Directory, ADFS หรือ SAML 2.0 IdP** |
| **`AssumeRoleWithWebIdentity`** | ผู้ใช้งานทั่วไปผ่าน Web/Social IdP สาธารณะ | 1 ชั่วโมง | ยืนยันตัวตนผ่าน **Google, Facebook, Apple, หรือ Amazon** |
| **`GetFederationToken`** | ผู้ใช้ภายนอกที่เชื่อมต่อผ่าน Custom Identity Broker | **12 ชั่วโมง (นานกว่าคำสั่งอื่นอย่างมีนัยสำคัญ)** | ใช้สำหรับแอปพลิเคชันที่ต้องการคีย์ชั่วคราวที่มีอายุยาวเป็นพิเศษ (ปรับได้ถึง 36 ชม.) |
| **`GetSessionToken`** | ผู้ใช้งาน IAM ที่มีอยู่เดิม | 12 ชั่วโมง (สำหรับ IAM User) | ใช้เพิ่มระดับความปลอดภัย **บังคับให้ต้องยืนยันตัวตนผ่าน MFA** ก่อนเรียกใช้ API |

- **การติดตามประวัติด้วย AWS CloudTrail (สไลด์หน้า 23-25):**
  - สามารถสืบหาตัวตนที่แท้จริงของผู้ใช้ภายนอก (Federated User) ที่เข้ามาสั่งลบเครื่อง EC2 โดยค้นหา Event `TerminateInstances` -> นำ ARN ของ Role ที่ถูกสวมไปค้นหา Event `AssumeRoleWithSAML` -> จะพบชื่อผู้ใช้ตัวจริงในฟิลด์ **`userName`**

---

## 3. สถาปัตยกรรม Amazon Cognito (User Pools vs Identity Pools)

จุดวัดผลที่ออกสอบมากที่สุดในหัวข้อความปลอดภัย คือการแยกความแตกต่างของ 2 บริการย่อยใน Cognito (สไลด์หน้า 29 & 35):

| มิติ | Amazon Cognito User Pools | Amazon Cognito Identity Pools (Federated Identities) |
| :--- | :--- | :--- |
| **เป้าหมายหลัก** | **การยืนยันตัวตน (Authentication - AuthN)** | **การอนุญาตสิทธิ์ (Authorization - AuthZ)** |
| **หน้าที่การทำงาน** | เป็น **สารบบผู้ใช้งาน (User Directory)** จัดการเรื่อง Sign-up, Sign-in, รีเซ็ตรหัสผ่าน, MFA และ Email/SMS Verification | เป็น **ตัวกลางแลกเปลี่ยนตั๋ว (Credential Broker)** ที่แปลงผลยืนยันตัวตนให้กลายเป็น **AWS IAM Credentials** |
| **ผลลัพธ์ที่ส่งคืน** | ส่งคืน **JSON Web Tokens (JWTs)** จำนวน 3 ใบ (ID Token, Access Token, Refresh Token) | ส่งคืน **Temporary AWS Credentials** (Access Key, Secret Key, Session Token) |
| **การเข้าถึงทรัพยากร** | ใช้ Token ยื่นผ่าน **Amazon API Gateway** หรือ Application Load Balancer เพื่อเข้าถึงระบบหลังบ้าน | ใช้คีย์ชั่วคราวเซ็นคำขอ (SigV4) เพื่อ **เข้าถึง AWS Services โดยตรง (เช่น DynamoDB, S3)** |
| **การรองรับ Guest / แขก** | ไม่รองรับ (ต้องสมัครสมาชิกหรือล็อกอินก่อน) | **รองรับ Unauthenticated (Guest) Identities** ให้สิทธิ์ผู้ใช้ที่ยังไม่ล็อกอินเข้าถึง S3 ได้ |

---

## 4. โทเคนทั้ง 3 ชนิดของ Cognito User Pools (สไลด์หน้า 32)

เมื่อผู้ใช้ล็อกอินสำเร็จ User Pool จะส่งคืน JWT Tokens ทั้ง 3 ชนิด:

1. **Identity Token (ID Token - มีการเซ็นลายเซ็น Signed):**
   - บรรจุข้อมูลอัตลักษณ์ (Claims) ของผู้ใช้งาน เช่น `sub` (User ID), `name`, `email`, วันที่ยืนยัน
   - ใช้สำหรับให้ API Gateway หรือแอปพลิเคชันฝั่งไคลเอนต์ตรวจสอบว่า "ผู้ใช้คนนี้คือใคร"
2. **Access Token (มีกาเซ็นลายเซ็น Signed):**
   - บรรจุสิทธิ์และขอบเขตการเข้าถึง (Custom Scopes และ Groups)
   - ใช้สำหรับอนุญาตสิทธิ์ในการเรียกใช้งาน REST API ตาม Endpoint ที่ได้รับอนุญาต
3. **Refresh Token (มีการเข้ารหัส Encrypted):**
   - บรรจุข้อมูลความปลอดภัยที่ใช้สำหรับ **ขอรับ ID Token และ Access Token ใบใหม่** เมื่อโทเคนเดิมหมดอายุ โดยที่ผู้ใช้ไม่ต้องกรอกรหัสผ่านใหม่

---

## 5. กระบวนการทำงานแบบครบวงจร (End-to-End Flow - จากไดอะแกรมหน้า 35)

วงจรชีวิตการทำงานร่วมกันระหว่าง Mobile App, User Pools, Identity Pools และ AWS Services:

```text
  [1. ส่ง User/Pass] ──> [Amazon Cognito User Pools]
                                │
  [2. รับ JWTs 3 ใบ] <──────────┘
           │
           ▼
  [3. นำ ID Token ไปยื่น] ──> [Amazon Cognito Identity Pools]
                                       │ (ตรวจสอบ Token และ Assume IAM Role)
  [4. รับ Temporary AWS Keys] <────────┘
           │
           ▼
  [5. เซ็นชื่อ SigV4 ส่งคำขอ] ──> [Amazon DynamoDB / Amazon S3]
                                           │ (ตรวจสอบ IAM Policy)
  [6. รับข้อมูลกลับมา] <──────────────────┘
```

1. ผู้ใช้งานส่ง Username และ Password เข้าสู่ **Cognito User Pools**
2. User Pools ตรวจสอบความถูกต้องและส่งคืน **JWT Tokens** ให้กับแอป
3. แอปพลิเคชันนำ **ID Token** ไปยื่นให้กับ **Cognito Identity Pools**
4. Identity Pools ตรวจสอบความถูกต้องของ Token กับ User Pools จากนั้นจะไป Assume **IAM Role** ที่ผูกไว้
5. Identity Pools ส่งคืน **Temporary AWS Credentials** ให้กับแอปพลิเคชัน
6. แอปพลิเคชันใช้คีย์ชั่วคราวเซ็นชื่อคำขอ (SigV4) ยิงตรงเข้าสู่ **Amazon DynamoDB** หรือ **S3** โดยตรงได้อย่างปลอดภัย

---

## 6. Cognito Lambda Triggers (การต่อยอดด้วยโค้ด Serverless)

Cognito รองรับการผูก **AWS Lambda Triggers** เข้ากับเหตุการณ์ต่างๆ ในกระบวนการยืนยันตัวตน:
- **Pre Sign-up Trigger:** รันโค้ดตรวจสอบเงื่อนไขก่อนอนุญาตให้สมัครสมาชิก (เช่น แบนอีเมลจากโดเมนต้องสงสัย)
- **Post Confirmation Trigger:** รันโค้ดหลังจากผู้ใช้ยืนยันอีเมลสำเร็จ (เช่น ส่งข้อความต้อนรับ หรือสร้างข้อมูลเริ่มต้นในฐานข้อมูล)
- **Pre Authentication & Post Authentication Trigger:** รันโค้ดก่อนหรือหลังการล็อกอิน (เช่น **ยิง API ไปบันทึกประวัติการล็อกอินลงระบบ Custom Analytics**)

---

## 7. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการเลือกใช้ IAM แทน Cognito สำหรับผู้ใช้ภายนอก:** โจทย์ถามว่าแอปพลิเคชันมีผู้ใช้งานทั่วไปนับล้านคน ต้องการระบบสมัครสมาชิกและล็อกอิน ให้สร้าง IAM User ให้กับผู้ใช้ทุกคนใช่หรือไม่?
   - ✅ **ที่ถูกต้อง:** **ผิดอย่างร้ายแรง!** IAM มีไว้สำหรับพนักงานภายในองค์กรหรือระบบงาน (จำกัดจำนวน User สูงสุดไม่เกิน 5,000 ต่อบัญชี) สำหรับผู้ใช้งานแอปพลิเคชันทั่วไป **ต้องใช้ Amazon Cognito User Pools เท่านั้น**
2. ❌ **หลอกเรื่องการให้แอปมือถือเข้าถึง S3/DynamoDB โดยตรง:** โจทย์ถามว่าโมบายแอปพลิเคชันต้องการอัปโหลดรูปภาพลง S3 Bucket ส่วนตัวของผู้ใช้โดยตรง ควรใช้ส่วนประกอบใดของ Cognito?
   - ✅ **ที่ถูกต้อง:** **ต้องใช้ Cognito Identity Pools (Federated Identities)** เพื่อแลกรับ Temporary AWS IAM Credentials แล้วนำไปใช้เรียก S3 SDK (หากใช้ User Pool อย่างเดียว จะได้แค่ JWT Token ซึ่ง AWS S3 SDK ไม่สามารถนำไปใช้เรียก API ตรงๆ ได้)
3. ❌ **หลอกเรื่องการต่ออายุ Token โดยไม่ให้ผู้ใช้ล็อกอินใหม่:** โจทย์ถามว่า ID Token หมดอายุหลังจาก 1 ชั่วโมง จะทำอย่างไรให้แอปขอ Token ใหม่โดยไม่ต้องเด้งหน้าจอให้ผู้ใช้กรอกรหัสผ่านซ้ำ?
   - ✅ **ที่ถูกต้อง:** ใช้ **Refresh Token** ส่งไปยัง Cognito User Pool เพื่อขอรับ ID Token และ Access Token ชุดใหม่
4. ❌ **หลอกเรื่อง STS API สำหรับ SAML vs Web Identity:** โจทย์ถามว่าต้องการเชื่อมต่อระบบล็อกอินของพนักงานบริษัทผ่าน Active Directory กับระบบล็อกอินผ่าน Google ของลูกค้า
   - ✅ **ที่ถูกต้อง:** สำหรับพนักงานบริษัทผ่าน SAML ใช้ **`AssumeRoleWithSAML`** ส่วนลูกค้าล็อกอินผ่าน Google/Facebook ใช้ **`AssumeRoleWithWebIdentity`**
5. ❌ **หลอกเรื่องการดักจับเหตุการณ์ Sign-in ไปบันทึกลง Analytics:** โจทย์ถามว่าต้องการให้ระบบส่งข้อมูลไป Custom Analytics ทุกครั้งที่มีคนล็อกอินสำเร็จ
   - ✅ **ที่ถูกต้อง:** ใช้ **Cognito Post-Authentication Lambda Trigger** เพื่อสั่งให้ Lambda ยิง API ไปบันทึกข้อมูล (ไม่สามารถสั่งให้ API Gateway ดักจับได้โดยตรง)

---

## 8. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การเพิ่มระบบล็อกอินและการบันทึกสถิติการล็อกอิน (AWS Academy Slide 46-48)
**สถานการณ์:** นักพัฒนากำลังเพิ่มระบบสมัครสมาชิก (Sign-up) และระบบเข้าสู่ระบบ (Sign-in) ให้กับเว็บแอปพลิเคชัน โดยมีข้อกำหนดเพิ่มเติมว่า **ทุกครั้งที่มีผู้ใช้ล็อกอินสำเร็จ ระบบจะต้องทำการเรียก API ไปยังระบบวิเคราะห์ข้อมูล (Custom Analytics Solution) เพื่อบันทึกประวัติเหตุการณ์การเข้าสู่ระบบ** นักพัฒนาควรเลือกใช้ชุดปฏิบัติการใดร่วมกัน? (เลือก 2 ข้อ)
- ก) ใช้ Amazon Cognito เพื่อจัดเตรียมระบบ Sign-up และ Sign-in ให้กับแอปพลิเคชัน
- ข) ใช้ AWS IAM เพื่อจัดเตรียมระบบ Sign-up และ Sign-in ให้กับผู้ใช้ภายนอก
- ค) กำหนดค่าให้ API Gateway ดักจับเหตุการณ์การเข้าสู่ระบบเพื่อยิง API
- ง) จัดเก็บข้อมูลรหัสผ่านใน AWS Secrets Manager และตั้งค่าการหมุนเวียนคีย์
- จ) สร้างฟังก์ชัน AWS Lambda เพื่อยิง API ไปยังระบบ Analytics โดยให้เหตุการณ์ Post-Authentication ของ Cognito เป็นตัวทริกเกอร์
- **เฉลย:** **ก) ใช้ Amazon Cognito เพื่อจัดเตรียมระบบ Sign-up และ Sign-in ให้กับแอปพลิเคชัน** และ **จ) สร้างฟังก์ชัน AWS Lambda เพื่อยิง API ไปยังระบบ Analytics โดยให้เหตุการณ์ Post-Authentication ของ Cognito เป็นตัวทริกเกอร์**
- **จุดหลอก (Exam Trap):** ข้อ ข ผิดเพราะ IAM ไม่ได้สร้างมาเพื่อรองรับผู้ใช้ทั่วไปของแอปพลิเคชัน; ข้อ ค ผิดเพราะ API Gateway ไม่มีระบบ Event Trigger ฝังในกระบวนการล็อกอินของ Cognito
- **เหตุผลทางเทคนิค:** Amazon Cognito User Pools ออกแบบมาสำหรับงาน User Management และ Sign-up/Sign-in โดยเฉพาะ (สไลด์หน้า 28-29) และมีฟีเจอร์ Lambda Triggers ในจังหวะ Post-Authentication ซึ่งสามารถสั่งรันโค้ด Lambda เพื่อส่งต่อข้อมูลไปยังระบบ Analytics ได้ทันที

### ข้อที่ 2: การอนุญาตให้โมบายแอปเข้าถึง DynamoDB โดยตรงอย่างปลอดภัย
**สถานการณ์:** เกมมือถือต้องการให้ผู้เล่นสามารถบันทึกคะแนนและไอเทมลงในตาราง Amazon DynamoDB ได้โดยตรงโดยไม่ต้องมีเซิร์ฟเวอร์หรือ API Gateway คั่นกลาง ผู้เล่นล็อกอินเข้าสู่ระบบด้วยบัญชี Google หรือ Apple ID วิศวกรควรออกแบบระบบความปลอดภัยอย่างไรตามมาตรฐาน AWS?
- ก) ฝัง Access Key ID และ Secret Access Key ของบัญชี AWS ไว้ในแอปพลิเคชันมือถือ
- ข) ใช้ Cognito User Pools เพื่อรับข้อมูลล็อกอิน จากนั้นนำ ID Token ไปแลก Temporary AWS Credentials ผ่าน Cognito Identity Pools ซึ่งผูกกับ IAM Role ที่มีสิทธิ์เขียน DynamoDB
- ค) ใช้ Cognito User Pools เพียงอย่างเดียว แล้วส่ง Access Token ไปเขียนลง DynamoDB
- ง) สร้าง IAM User แยกสำหรับผู้เล่นทุกคนในบัญชี AWS
- **เฉลย:** **ข) ใช้ Cognito User Pools เพื่อรับข้อมูลล็อกอิน จากนั้นนำ ID Token ไปแลก Temporary AWS Credentials ผ่าน Cognito Identity Pools ซึ่งผูกกับ IAM Role ที่มีสิทธิ์เขียน DynamoDB**
- **จุดหลอก (Exam Trap):** ข้อ ก เป็นช่องโหว่ร้ายแรงที่ทำให้คีย์หลุดได้ง่าย ส่วนข้อ ค ผิดเพราะ DynamoDB SDK ต้องการ AWS SigV4 Credentials ไม่สามารถรับ JWT Token ดิบๆ ได้
- **เหตุผลทางเทคนิค:** ตามสถาปัตยกรรมในสไลด์หน้า 35 Cognito Identity Pools ทำหน้าที่เป็นตัวแปลงสภาพ (Credential Broker) เปลี่ยนจาก JWT Token ให้กลายเป็น Temporary IAM Credentials ชั่วคราว ทำให้โมบายแอปสามารถเรียกใช้บริการ AWS ได้อย่างปลอดภัย 100%

### ข้อที่ 3: การสืบหาตัวตนของพนักงานองค์กรที่ใช้สิทธิ์ชั่วคราวผ่าน CloudTrail
**สถานการณ์:** ฝ่ายความปลอดภัยตรวจพบว่ามีเครื่อง EC2 Production ถูกสั่งลบผ่านคำสั่ง `TerminateInstances` จากการตรวจสอบพบว่าคำขอดังกล่าวใช้สิทธิ์ชั่วคราวของ IAM Role ที่สวมบทบาทเข้ามา ทีมงานต้องการสืบหาว่า **พนักงานบริษัทคนใดที่เป็นผู้สั่งรันคำสั่งนี้ผ่านระบบ Single Sign-On (Active Directory)** วิศวกรควรค้นหาข้อมูลใน AWS CloudTrail ตามขั้นตอนใด?
- ก) ค้นหาชื่อพนักงานในไฟล์คอนฟิกของ Active Directory
- ข) นำ ARN ของ IAM Role ที่พบ ไปค้นหา Event `AssumeRoleWithSAML` ใน CloudTrail แล้วตรวจสอบฟิลด์ `userName`
- ค) ดักจับทราฟฟิกเครือข่ายด้วย VPC Flow Logs
- ง) เปิดดูประวัติการล็อกอินในคอนโซลของ Amazon Cognito
- **เฉลย:** **ข) นำ ARN ของ IAM Role ที่พบ ไปค้นหา Event `AssumeRoleWithSAML` ใน CloudTrail แล้วตรวจสอบฟิลด์ `userName`**
- **จุดหลอก (Exam Trap):** หลายคนคิดว่าเมื่อสวมบทบาทเป็น Role แล้ว ตัวตนเดิมจะสูญหายไปและตามสืบไม่ได้
- **เหตุผลทางเทคนิค:** ตามกระบวนการในสไลด์หน้า 24-25 เมื่อผู้ใช้ระดับองค์กรทำการ Assume Role ผ่าน SAML ตัวตนจริงของผู้ใช้ (Federated Identity) จะถูกส่งเข้ามาและบันทึกไว้ใน Event `AssumeRoleWithSAML` ภายใต้แอตทริบิวต์ `userName` เสมอ

### ข้อที่ 4: การเลือกประเภทโทเคนสำหรับการเข้าถึง API ที่มีการจำกัดขอบเขต (Custom Scopes)
**สถานการณ์:** ระบบไมโครเซอร์วิสใช้ Amazon API Gateway ในการปกป้อง REST API โดยมีการกำหนด Scope สิทธิ์ เช่น `read:orders` และ `write:orders` เมื่อผู้ใช้ล็อกอินผ่าน Cognito User Pool สำเร็จ ไคลเอนต์จะต้องส่งโทเคนประเภทใดแนบไปใน Header `Authorization` เพื่อให้ API Gateway ตรวจสอบสิทธิ์ Scope ได้อย่างถูกต้อง?
- ก) Identity Token (ID Token)
- ข) Access Token
- ค) Refresh Token
- ง) Session Token จาก AWS STS
- **เฉลย:** **ข) Access Token**
- **จุดหลอก (Exam Trap):** สับสนระหว่าง ID Token และ Access Token (คนส่วนใหญ่มักส่ง ID Token เพราะมีชื่อและอีเมล)
- **เหตุผลทางเทคนิค:** ตามข้อกำหนดในสไลด์หน้า 32 **Access Token** มีหน้าที่โดยตรงในการให้อำนาจเรียกใช้ API ตาม **Custom Scopes** ที่กำหนดไว้ ส่วน ID Token มีไว้เพื่อแสดงข้อมูลอัตลักษณ์ (Identity Claims) ของผู้ใช้เท่านั้น

### ข้อที่ 5: การเลือกใช้คำสั่ง AWS STS สำหรับการยืนยันตัวตนข้ามบัญชี
**สถานการณ์:** แอปพลิเคชันที่ทำงานบน AWS Account A (Development) จำเป็นต้องขอรับข้อมูลประจำตัวชั่วคราวเพื่อเข้าไปอ่านข้อมูลใน S3 Bucket บน AWS Account B (Production) เป็นเวลา 1 ชั่วโมง โดยบน Account B มีการสร้าง IAM Role และกำหนด Trust Policy อนุญาตให้ Account A สวมบทบาทไว้แล้ว แอปพลิเคชันบน Account A ควรเรียกใช้ API ใดของ STS?
- ก) `GetSessionToken`
- ข) `AssumeRole`
- ค) `AssumeRoleWithWebIdentity`
- ง) `GetFederationToken`
- **เฉลย:** **ข) `AssumeRole`**
- **จุดหลอก (Exam Trap):** ข้อ ค ใช้สำหรับ Web Identity สาธารณะ (Google/FB) ไม่ใช่การเชื่อมต่อระหว่างบัญชี AWS ส่วนข้อ ก ใช้สำหรับขอ Session Token ภายในบัญชีเดิมโดยเฉพาะงาน MFA
- **เหตุผลทางเทคนิค:** คำสั่ง `AssumeRole` (สไลด์หน้า 22) ออกแบบมาสำหรับการให้ IAM User หรือ Compute Service ในบัญชีหนึ่ง สวมบทบาท IAM Role ข้ามไปยังอีกบัญชีหนึ่ง (Cross-account access) โดยส่งคืนคีย์ชั่วคราวที่มีอายุเริ่มต้น 1 ชั่วโมง
