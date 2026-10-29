# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 7: Developing Event-Driven Serverless Solutions (AWS Lambda)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 79 หน้า พร้อมถอดความโครงสร้าง Invocation Models, สถาปัตยกรรม X-Ray และ Concurrency ครบถ้วน

---

## 1. ภาพรวมการประมวลผลแบบ Serverless (Serverless Computing & Core Concepts)

- **AWS Lambda:** บริการประมวลผลแบบ Serverless (Function-as-a-Service: FaaS) ที่ช่วยให้สามารถรันโค้ดได้โดยไม่ต้องจัดเตรียม (Provision) หรือบริหารจัดการเซิร์ฟเวอร์
- **คุณลักษณะสำคัญ (Key Characteristics):**
  - **No Server Management:** ไม่ต้องดูแลระบบปฏิบัติการ ไม่ต้องแพตช์ความปลอดภัย
  - **Auto-scaling:** สเกลขึ้น-ลงตามปริมาณคำขอแบบเรียลไทม์ (จาก 0 ถึงหลายหมื่นคำขอพร้อมกัน)
  - **Pay-per-use:** คิดค่าบริการตามเวลาที่โค้ดทำงานจริง (ปัดเศษขึ้นทีละ **1 มิลลิวินาที**) และจำนวนคำขอ โดยไม่คิดเงินเมื่อระบบว่าง (Zero Idle Cost)
  - **Built-in Fault Tolerance & High Availability:** ทำงานกระจายข้ามหลาย Availability Zone อัตโนมัติ

---

## 2. โมเดลการเรียกใช้งานฟังก์ชัน (Lambda Invocation Models)

ข้อสอบ AWS ออกลึกเรื่องความแตกต่างของ 3 โมเดลนี้มาก:

| หัวข้อ | 1. Synchronous (Push Model) | 2. Asynchronous (Push Model) | 3. Event Source Mapping (Pull/Polling) |
| :--- | :--- | :--- | :--- |
| **บริการต้นทาง (Sources)** | **API Gateway**, Application Load Balancer (ALB), Amazon Cognito, AWS SDK | **Amazon S3**, **Amazon SNS**, Amazon EventBridge, AWS CloudTrail | **Amazon Kinesis**, **DynamoDB Streams**, **Amazon SQS** |
| **พฤติกรรมการเรียก** | ผู้เรียกจะ **รอ (Wait)** จนกว่า Lambda จะรันจบและส่ง Response กลับ | ผู้เรียกยิงคำขอแล้วจบงานทันที ระบบส่งคืนสถานะ **HTTP 202 Accepted** | Lambda ทำหน้าที่เป็นตัว Poller ดึงข้อมูลจากคิว/สตรีมมาป้อนให้ตัวเอง |
| **การเข้าคิวภายใน** | ไม่มีการเข้าคิว ยิงตรงเข้าสู่ Environment | **Lambda มีคิวภายใน (Internal Queue)** พักข้อมูลก่อนส่งให้ฟังก์ชัน | มี Poller ภายในจัดการ Batching ข้อมูล |
| **การ Retry เมื่อโค้ดพัง** | ❌ **ไม่มี Built-in Retry** (ผู้เรียกต้องเขียนลูป Retry เอง) | **Retry อัตโนมัติ 2 ครั้ง** (รันรวมสูงสุด 3 รอบ) ปรับแต่งได้ 0–2 ครั้ง | ขึ้นกับประเภท: Stream หรือ Queue |
| **การจัดการข้อผิดพลาด (Error Handling)** | คืนค่า Error กลับไปให้ไคลเอนต์ทันที | ส่งต่อลง **Dead-Letter Queue (DLQ)** หรือ **Lambda Destinations** (SQS/SNS/EventBridge) | **Stream:** บล็อกค้างทั้ง Shard<br>**Queue:** ตีข้อความกลับคืนคิวรอ Retry |
| **API Parameter** | `--invocation-type RequestResponse` | `--invocation-type Event` | ทำงานเบื้องหลังผ่าน Event Source Mapping |

### เจาะลึกความต่างของ Pull Model (จากไดอะแกรมหน้า 22):
1. **Stream-based Polling (Kinesis & DynamoDB Streams):**
   - ดึงข้อมูลเป็นชุดตามแนวทางของ **Shard**
   - ⚠️ **กฎสำคัญ:** **Errors in a shard block further processing** (หากมี Record ใดทำงานล้มเหลว ระบบจะหยุดรอและ Retry ซ้ำๆ จนกว่าจะหมดอายุ เพื่อรักษาลำดับเวลาก่อน-หลังของข้อมูลใน Shard ไม่ให้ข้อมูลใหม่แซงหน้า)
2. **Queue-based Polling (Amazon SQS):**
   - ดึงข้อมูลจากคิวเป็น Batch
   - **Errors in a batch are returned to the queue** (หากมีข้อผิดพลาด ข้อความชุดนั้นจะถูกส่งกลับเข้าคิว SQS และจะปรากฏขึ้นมาใหม่เมื่อพ้นช่วง Visibility Timeout)

---

## 3. สถาปัตยกรรมสิทธิ์ความปลอดภัย (Lambda Permissions: Inbound vs Outbound)

สไลด์หน้า 27-32 แยกความปลอดภัยของ Lambda ออกเป็น 2 ฝั่งชัดเจน:

### 3.1 Invocation Permissions (Resource-based Policy / Function Policy)
- **ทิศทาง:** การเข้าถึง **ขาเข้า (Inbound)**
- **หน้าที่:** กำหนดว่า **"ใครหรือบริการใด มีสิทธิ์สั่งรัน (Invoke) ฟังก์ชันนี้ได้บ้าง?"**
- ผูกติดกับตัวฟังก์ชัน Lambda โดยตรง และอนุญาต Action `lambda:InvokeFunction`
- ตัวอย่าง: S3 Bucket ต้องการทริกเกอร์ Lambda เมื่อมีไฟล์อัปโหลดเข้ามา ต้องแนบ Resource Policy ให้ S3 หรือใช้คำสั่ง:
  ```bash
  aws lambda add-permission \
    --function-name my-function \
    --action lambda:InvokeFunction \
    --statement-id s3-trigger \
    --principal s3.amazonaws.com \
    --source-arn arn:aws:s3:::myBucket1
  ```

### 3.2 Execution Role (IAM Role)
- **ทิศทาง:** การเข้าถึง **ขาออก (Outbound)**
- **หน้าที่:** กำหนดว่า **"ฟังก์ชัน Lambda มีสิทธิ์ไปทำอะไรกับบริการอื่นบน AWS ได้บ้าง?"**
- ประกอบด้วย 2 ส่วน:
  1. **Trust Policy:** อนุญาตให้ Service Principal `lambda.amazonaws.com` สามารถ Assume Role นี้ได้ (`sts:AssumeRole`)
  2. **Permissions Policy:** สิทธิ์ที่ Lambda ต้องใช้ เช่น เขียน Log ลง CloudWatch (`logs:PutLogEvents`), อ่านเขียนตาราง DynamoDB, หรืออัปโหลดไฟล์ไป S3

---

## 4. โครงสร้างฟังก์ชันและการตั้งค่าประสิทธิภาพ (Authoring & Configuration)

### 4.1 Function Handler Method
```python
def lambda_handler(event, context):
    # event: รับเพย์โหลดข้อมูลและ Header ที่ส่งมาจาก Trigger
    print("Event Payload:", event)
    
    # context: ตรวจสอบสถานะการทำงานขณะรัน
    request_id = context.aws_request_id
    remaining_time = context.get_remaining_time_in_millis()
    
    return {
        'statusCode': 200,
        'body': 'Execution successful'
    }
```
- **Event Object:** ข้อมูลคำขอที่ส่งเข้ามา มีรูปแบบเฉพาะตามประเภทของบริการต้นทาง (เช่น S3 Event, API Gateway Proxy Event)
- **Context Object:** เมธอดและพร็อพเพอร์ตี้เกี่ยวกับสภาพแวดล้อมขณะรัน เช่น `aws_request_id`, `log_stream_name`, และ `get_remaining_time_in_millis()`

### 4.2 การจัดสรรทรัพยากร (Resource Tuning)
- **Memory (RAM):** ปรับได้ตั้งแต่ **128 MB ถึง 10,240 MB (10 GB)**
  - ⚠️ **กฎเหล็กของ Lambda:** **พลังของ CPU และแบนด์วิดท์เครือข่ายจะสเกลขึ้นตามขนาดของ Memory โดยอัตโนมัติเป็นเส้นตรง** (ไม่สามารถปรับ CPU แยกเดี่ยวได้ หากต้องการ CPU แรงขึ้น ต้องเพิ่ม Memory)
- **Timeout:** ระยะเวลาสูงสุดที่อนุญาตให้ฟังก์ชันรันได้ ตั้งแต่ **1 วินาที ถึง 15 นาที (900 วินาที)** หากเกินเวลาระบบจะตัดการทำงานทันที
- **Concurrency (การทำงานพร้อมกัน):**
  - **Account Limit:** ดีฟอลต์จำกัดที่ 1,000 Concurrent Invocations ต่อภูมิภาค (สามารถขอขยายได้)
  - **Reserved Concurrency:** จองโควตาความสามารถในการรันไว้ให้ฟังก์ชันนั้นโดยเฉพาะ และทำหน้าที่เป็นเพดานกันไม่ให้ฟังก์ชันสเกลจนทำให้ระบบหลังบ้าน (เช่น RDS) พัง
  - **Provisioned Concurrency:** สั่งเตรียม Execution Environment ล่วงหน้าให้อยู่ในสถานะ Warm ตลอดเวลา **เพื่อแก้ปัญหา Cold Start Latency ได้ 100%** (คิดค่าบริการคงที่รายชั่วโมง)

---

## 5. การพัฒนาและแนวปฏิบัติที่ดี (Best Practices for Lambda)

1. **เขียนโค้ดแบบไร้สถานะ (Stateless):** อย่าเก็บ State ของผู้ใช้ไว้ในหน่วยความจำของฟังก์ชัน เพราะ Container พร้อมที่จะถูกทำลายและสร้างใหม่ตลอดเวลา
2. **Reuse Execution Environment (Execution Context Reuse):**
   - อะไรที่ต้องเชื่อมต่อหรือโหลดครั้งเดียว เช่น **Database Connection Pools, AWS SDK Clients, HTTP Clients** ให้ประกาศไว้นอกฟังก์ชัน Handler (Global Scope)
   - เมื่อมีคำขอใหม่เข้ามาและใช้ Warm Container ระบบจะไม่ต้องเสียเวลาสร้าง Connection ใหม่
3. **การประมวลผลไฟล์ชั่วคราว:** โฟลเดอร์ `/tmp` มีพื้นที่ชั่วคราวเริ่มต้น 512 MB (ขยายได้ถึง 10 GB) ข้อมูลใน `/tmp` จะคงอยู่ตลอดอายุของ Container นั้น
4. **หลีกเลี่ยง Recursive Code:** ห้ามเขียนฟังก์ชัน Lambda ที่ทริกเกอร์ตัวเองซ้ำ หรือเรียกฟังก์ชันอื่นแบบลูกโซ่ที่ย้อนกลับมาหาตัวเอง เพราะจะทำให้ Concurrency เต็มและบิลพุ่งทะยาน

---

## 6. การแพ็กเกจ การปรับใช้ และเลเยอร์ (Packaging, Layers & Versioning)

### 6.1 ตัวเลือกการดีพลอย (Deployment Options)
- **.zip Archive:**
  - อัปโหลดตรงผ่านคอนโซล/CLI ไม่เกิน 50 MB
  - อัปโหลดผ่าน S3 ได้สูงสุด 250 MB (ขนาดรวมหลังจากแตกไฟล์ Zip)
- **Container Image (Docker Image):**
  - แพ็กเกจโค้ดและไลบรารีเป็น Container Image จัดเก็บบน **Amazon ECR**
  - รองรับขนาดอิมเมจสูงสุดถึง **10 GB** เหมาะกับงาน Machine Learning หรือโมเดลขนาดใหญ่

### 6.2 Lambda Layers (เลเยอร์รวมโค้ดและไลบรารี)
- รวมไลบรารี Dependencies หรือ Custom Runtime ที่ใช้ร่วมกันในหลายๆ ฟังก์ชัน
- **ประโยชน์:** ลดขนาดไฟล์อัปโหลดของฟังก์ชัน, อัปเดต Dependencies ที่จุดเดียว, หลีกเลี่ยงข้อจำกัด Package Size Limit
- **ข้อจำกัด:** 1 ฟังก์ชันผูกได้สูงสุด **5 Layers** และขนาดรวมแตกไฟล์ต้องไม่เกิน **250 MB**

### 6.3 เวอร์ชันและนามแฝง (Versioning & Aliases)
- **`$LATEST`:** เวอร์ชันหลักที่กำลังแก้ไข (Mutable)
- **Published Versions (เวอร์ชัน 1, 2, 3):** สแนปช็อตของ `$LATEST` ที่ถูกล็อกถาวร **ห้ามแก้ไขโค้ดและการตั้งค่าเด็ดขาด (Immutable)**
- **Aliases (เช่น `dev`, `test`, `prod`):** ตัวชี้ (Mutable Pointers) ที่ชี้ไปยัง Version ใดก็ได้
  - รองรับ **Routing Configuration (Traffic Shifting):** แบ่งเปอร์เซ็นต์ทราฟฟิก เช่น ส่งทราฟฟิก 90% ไปเวอร์ชัน 1 และส่ง 10% ไปเวอร์ชัน 2 เพื่อทำ Canary Testing

---

## 7. การตรวจสอบและดีบักระบบ (Monitoring & AWS X-Ray)

### 7.1 Amazon CloudWatch
- บันทึก `START`, `END`, `REPORT` และข้อความจาก `print()` หรือ Logging Library ลง CloudWatch Logs
- บรรทัด `REPORT` จะระบุ: `Duration`, `Billed Duration`, `Memory Size`, และ `Max Memory Used`
- **CloudWatch Lambda Insights:** รวบรวมเมทริกซ์ประสิทธิภาพเชิงลึก (CPU, Memory, Network)

### 7.2 AWS X-Ray (ระบบ Distributed Tracing - จากตารางหน้า 62)
เปิดใช้งานง่ายเพียงคลิกเดียว (Active Tracing) เพื่อทำแผนผัง Service Map และวิเคราะห์จุดคอขวด:
- **Segments:** ข้อมูลงานที่ประมวลผลโดยคอมพิวท์รีซอร์สนั้นๆ (เช่น เวลาที่ Lambda ทำงาน)
- **Subsegments:** การเจาะลึกรายละเอียดภายใน Segment เช่น เวลาที่ใช้ในการเรียก DynamoDB, S3 หรือบริการภายนอก
- **Annotations vs Metadata (จุดออกสอบประจำ):**
  - **Annotations:** Key-Value ที่ถูก **Indexed โดย X-Ray** สามารถนำไปเขียน **Filter Expressions** เพื่อค้นหาและจัดกลุ่ม Trace ในคอนโซลได้ (เช่น `annotation.CustomerId = "1234"`)
  - **Metadata:** Key-Value ชนิดใดก็ได้ที่ **ไม่ถูก Index** ใช้สำหรับบันทึกข้อมูลบริบทเพิ่มเติม แต่ไม่สามารถใช้ค้นหาหรือกรอง Trace ได้

---

## 8. ตารางเปรียบเทียบเชิงสถาปัตยกรรม (Comparison Tables)

### 8.1 Comparison: Annotations vs Metadata ใน AWS X-Ray

| คุณสมบัติ | Annotations | Metadata |
| :--- | :--- | :--- |
| **การทำ Index** | **ถูก Index โดยระบบ X-Ray** | ❌ **ไม่ถูก Index** |
| **การค้นหาและกรองข้อมูล** | นำไปเขียน Filter Expressions เพื่อค้นหากลุ่ม Trace ได้ | ค้นหาไม่ได้ นำมาทำ Filter ไม่ได้ |
| **ชนิดของข้อมูล** | String, Number, Boolean พื้นฐาน | Object, Array หรือข้อมูลโครงสร้างใดๆ ก็ได้ |
| **วัตถุประสงค์หลัก** | ใช้จัดกลุ่มและวิเคราะห์ปัญหา เช่น ค้นหาเคสที่เกิด Error ตาม User | ใช้บันทึกข้อมูลประกอบเพื่อเปิดดูรายละเอียดเชิงลึกของ Request |

### 8.2 Comparison: Reserved Concurrency vs Provisioned Concurrency

| มิติ | Reserved Concurrency | Provisioned Concurrency |
| :--- | :--- | :--- |
| **เป้าหมายหลัก** | รับประกันโควตา และป้องกันไม่ให้สเกลเกินพิกัดจนระบบหลังบ้านล่ม | **กำจัดปัญหา Cold Start 100%** สำหรับระบบที่ต้องการ Latency ต่ำมาก |
| **การทำงาน** | กันจำนวนการรันพร้อมกันไว้ในพูล ไม่ให้ฟังก์ชันอื่นแย่ง | อุ่นสภาพแวดล้อม (Warm Environments) ไว้ล่วงหน้าพร้อมรับคำขอทันที |
| **ค่าใช้จ่าย** | **ฟรี** (ไม่มีค่าใช้จ่ายเพิ่มเติม คิดตามการรันจริง) | **มีค่าบริการคงที่** ตามจำนวนและระยะเวลาที่สั่ง Warm ค้างไว้ |

---

## 9. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการเพิ่ม CPU ให้ Lambda:** โจทย์ถามว่าฟังก์ชันคำนวณกราฟิกทำงานช้า ต้องการเพิ่ม vCPU จาก 1 คอร์เป็น 4 คอร์ จะเข้าไปปรับคอนฟิกตรงไหน?
   - ✅ **ที่ถูกต้อง:** ใน Lambda **ไม่มีการตั้งค่า CPU โดยตรง** แต่ CPU จะถูกจัดสรรตามสัดส่วนของ **Memory (RAM)** ดังนั้นการเพิ่ม CPU จะต้องทำโดยการ **เพิ่มขนาด Memory**
2. ❌ **หลอกเรื่องไฟล์ Dependencies ขนาดใหญ่เกินลิมิต:** โจทย์ถามว่าโปรเจกต์มีไลบรารีขนาดใหญ่จนแพ็กเกจ Zip เกิน 50 MB ทำให้ไม่สามารถแก้ไขหรืออัปโหลดตรงผ่านหน้าเว็บคอนโซลได้ ควรแก้ปัญหาอย่างไร?
   - ✅ **ที่ถูกต้อง:** สร้าง **Lambda Layer** เพื่อแยก Dependencies ออกมา หรือแพ็กเกจเป็น **Container Image** แล้วอัปโหลดขึ้น Amazon ECR (รองรับสูงสุด 10 GB)
3. ❌ **หลอกเรื่องการจัดการฐานข้อมูล Connection Pool:** โจทย์ถามว่าเมื่อมีทราฟฟิกยิงเข้ามา 10,000 คำขอพร้อมกัน ทำไมฐานข้อมูล Amazon RDS PostgreSQL ถึงล่มและติด Connection Limit?
   - ✅ **ที่ถูกต้อง:** Lambda สเกลแบบแยก Container ทำให้แต่ละ Container เปิด Connection ตรงเข้าสู่ RDS จนล้น ทางแก้คือต้องติดตั้ง **Amazon RDS Proxy** คั่นกลางเพื่อทำ Connection Pooling
4. ❌ **หลอกเรื่องการค้นหา Trace ใน AWS X-Ray:** โจทย์ถามว่าต้องการค้นหา Trace เฉพาะคำขอที่เกิดจาก `AccountId: 9999` ต้องใส่ข้อมูลลงใน X-Ray ด้วยวิธีใด?
   - ✅ **ที่ถูกต้อง:** ต้องบันทึกเป็น **Annotation** เท่านั้น เพราะ Annotation มีการทำ Index จึงใช้ค้นหาผ่าน Filter Expression ได้ (หากบันทึกเป็น Metadata จะไม่สามารถค้นหาได้)
5. ❌ **หลอกเรื่องการสเกลและการ Retry ของ Kinesis Poller:** โจทย์ถามว่าทำไมข้อมูลใน Kinesis Data Streams ถึงหยุดนิ่งไม่ขยับไปข้างหน้าเมื่อฟังก์ชัน Lambda เจอบั๊ก?
   - ✅ **ที่ถูกต้อง:** เพราะในโหมด Stream Polling **ข้อผิดพลาดจะบล็อกการประมวลผลทั้ง Shard** เพื่อรักษาความถูกต้องของลำดับข้อมูล (Time-order) ทางแก้คือต้องตั้งค่า BisectBatchOnFunctionError หรือ MaximumRetryAttempts และส่ง Record ที่พังลง On-failure Destination

---

## 10. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การจัดการไฟล์ Dependencies ที่มีขนาดใหญ่เกินพิกัด (AWS Academy Slide 75-77)
**สถานการณ์:** นักพัฒนากำลังทดสอบแอปพลิเคชันบนเครื่องตัวเองและได้ดีพลอยขึ้นไปยัง AWS Lambda เพื่อไม่ให้ขนาดไฟล์ของแพ็กเกจเกินขีดจำกัด จึงไม่ได้แนบโฟลเดอร์ Dependencies ไปในไฟล์ดีพลอย แต่เมื่อรันฟังก์ชันบนคลาวด์ พบว่าฟังก์ชันล้มเหลวทันทีเนื่องจากแจ้งเตือนหาโมดูล Dependencies ไม่พบ นักพัฒนาควรแก้ไขปัญหานี้ด้วยวิธีใดที่ถูกต้องและมีประสิทธิภาพที่สุด?
- ก) ใช้ Code Editor บนคอนโซลของ Lambda เพื่อเขียนโค้ดและติดตั้งโมดูลที่ขาดหายไป
- ข) สร้างไฟล์ `.zip` แยกสำหรับ Dependencies แล้วนำไฟล์ zip นั้นไปยัดใส่ไว้ในไฟล์ zip ต้นฉบับของ Lambda
- ค) เพิ่มรายชื่อและพาธของ Dependencies ที่ขาดหายไปลงใน Environment Variables ของ Lambda
- ง) สร้าง Lambda Layer ที่บรรจุ Dependencies ทั้งหมด แล้วนำ Layer ดังกล่าวมาแนบเข้ากับฟังก์ชัน Lambda
- **เฉลย:** **ง) สร้าง Lambda Layer ที่บรรจุ Dependencies ทั้งหมด แล้วนำ Layer ดังกล่าวมาแนบเข้ากับฟังก์ชัน Lambda**
- **จุดหลอก (Exam Trap):** ข้อ ก ทำไม่ได้เพราะคอนโซลไม่รองรับการติดตั้งแพ็กเกจ; ข้อ ข ไวยากรณ์ของ Zip ซ้อน Zip ไม่สามารถรันได้; ข้อ ค Environment Variables ใช้เก็บค่าสตริง ไม่สามารถใช้โหลดโมดูลโค้ดไบนารีได้
- **เหตุผลทางเทคนิค:** Lambda Layers ออกแบบมาเพื่อการแชร์โค้ด ไลบรารี และ Dependencies ขนาดใหญ่โดยเฉพาะ ช่วยลดขนาดไฟล์โค้ดของฟังก์ชัน และทำให้สามารถนำ Layer ไปใช้ซ้ำกับฟังก์ชันอื่นๆ ได้ทันที

### ข้อที่ 2: การกำจัดปัญหาความล่าช้าจากการ Cold Start สำหรับแอปพลิเคชันที่ต้องการความเร็วสูง
**สถานการณ์:** ระบบสั่งซื้อสินค้าแฟลชเซลล์พบปัญหาความล่าช้า (High Latency) ในช่วงวินาทีแรกของการเปิดขายสินค้า เนื่องจากระบบต้องสร้างคอนเทนเนอร์ใหม่ขึ้นมารองรับคำขอปริมาณมหาศาล (Cold Start) ผู้บริหารต้องการให้ระบบประมวลผลคำขอได้ภายในเวลาไม่เกิน 50 มิลลิวินาทีตั้งแต่คำขอแรก สถาปัตยกรรมใดตอบโจทย์นี้ได้ตรงจุดที่สุด?
- ก) ปรับตั้งค่า Timeout ของฟังก์ชัน Lambda ให้เป็น 15 นาที
- ข) เปิดใช้งาน Provisioned Concurrency บนฟังก์ชัน Lambda ให้เพียงพอกับโหลดที่คาดการณ์ไว้
- ค) เปลี่ยนการเรียกใช้งานฟังก์ชันจากแบบ Synchronous ให้เป็นแบบ Asynchronous
- ง) ย้ายโค้ดไปรันบน EC2 Instance ขนาดเล็กที่สุดจำนวน 1 เครื่อง
- **เฉลย:** **ข) เปิดใช้งาน Provisioned Concurrency บนฟังก์ชัน Lambda ให้เพียงพอกับโหลดที่คาดการณ์ไว้**
- **จุดหลอก (Exam Trap):** การปรับ Timeout (ข้อ ก) ไม่ได้ช่วยเร่งความเร็วในการบูตเครื่อง ส่วนการเปลี่ยนเป็น Async (ข้อ ค) ส่งผลให้ผู้ใช้ไม่ได้รับผลตอบกลับทันที
- **เหตุผลทางเทคนิค:** Provisioned Concurrency จะสั่งให้ AWS จัดเตรียมและอุ่นสภาพแวดล้อม (Execution Environments) พร้อมโหลดโค้ดและไลบรารีไว้ล่วงหน้า ทำให้คำขอที่เข้ามาไม่ต้องเสียเวลา Cold Start และตอบสนองได้ในระดับมิลลิวินาทีทันที

### ข้อที่ 3: การวิเคราะห์จุดคอขวดและจัดกลุ่มคำขอที่มีปัญหาด้วย AWS X-Ray
**สถานการณ์:** วิศวกรกำลังตรวจสอบประสิทธิภาพของระบบไมโครเซอร์วิสบน Serverless และต้องการใช้ AWS X-Ray เพื่อจัดกลุ่มและกรองเฉพาะ Trace ที่เกิดจากลูกค้าระดับองค์กร (Enterprise Tier) ที่ประสบปัญหาเวลาตอบสนองช้าเกินกว่า 3 วินาที วิศวกรควรส่งข้อมูลเข้าไปใน X-Ray Segment อย่างไร?
- ก) บันทึกข้อมูล Enterprise Tier ลงใน Metadata ของ Segment
- ข) บันทึกข้อมูล Enterprise Tier ลงใน Annotation ของ Segment
- ค) บันทึกข้อมูล Enterprise Tier เป็น Environment Variable ใน Lambda
- ง) พิมพ์ข้อมูล Enterprise Tier ออกทาง `print()` ลง CloudWatch Logs
- **เฉลย:** **ข) บันทึกข้อมูล Enterprise Tier ลงใน Annotation ของ Segment**
- **จุดหลอก (Exam Trap):** หลายคนสับสนระหว่าง Metadata และ Annotation โดยคิดว่า Metadata ใช้ค้นหาได้
- **เหตุผลทางเทคนิค:** ข้อมูลที่บันทึกเป็น Annotation จะถูก X-Ray ทำ Index อัตโนมัติ ทำให้สามารถนำไปเขียน Filter Expression ใน X-Ray Console (เช่น `annotation.Tier = "Enterprise"`) เพื่อจัดกลุ่มและวิเคราะห์กราฟความหน่วงได้

### ข้อที่ 4: การรักษาความถูกต้องของลำดับข้อมูลเมื่อเกิดข้อผิดพลาดในการอ่าน Stream
**สถานการณ์:** ฟังก์ชัน Lambda ทำหน้าที่ประมวลผลข้อมูลจาก Amazon Kinesis Data Streams เพื่อคำนวณยอดเงินในบัญชีธนาคาร หากมี Record หนึ่งใน Shard มีข้อมูลผิดพลาดและทำให้โค้ดฟังก์ชันเกิด Unhandled Exception พฤติกรรมเริ่มต้นของระบบจะเป็นอย่างไร และส่งผลต่อ Record อื่นๆ ใน Shard เดียวกันอย่างไร?
- ก) Lambda จะข้าม Record นั้นไปทันที และประมวลผล Record ถัดไปต่อโดยอัตโนมัติ
- ข) Lambda จะหยุดการประมวลผล Record ทั้งหมดใน Shard นั้น และทำการ Retry ข้อมูลเดิมซ้ำๆ จนกว่าจะสำเร็จหรือข้อมูลหมดอายุ
- ค) Shard นั้นจะถูกทำลายทิ้งทันที และ Kinesis จะสร้าง Shard ใหม่ขึ้นมาแทน
- ง) Record ที่พังจะถูกส่งไปยัง SQS Dead-Letter Queue ทันทีในครั้งแรกที่รันผิดพลาด
- **เฉลย:** **ข) Lambda จะหยุดการประมวลผล Record ทั้งหมดใน Shard นั้น และทำการ Retry ข้อมูลเดิมซ้ำๆ จนกว่าจะสำเร็จหรือข้อมูลหมดอายุ**
- **จุดหลอก (Exam Trap):** ในระบบคิวทั่วไป (เช่น SQS) ข้อความที่พังจะถูกส่งกลับคิวและข้อความอื่นยังทำงานได้ แต่สำหรับระบบสตรีม กฎเหล็กคือต้องรักษาลำดับ (In-order processing)
- **เหตุผลทางเทคนิค:** ใน Stream-based Invocation (สไลด์หน้า 22) ข้อผิดพลาดใน Shard จะทำการบล็อกการทำงานของ Shard นั้นทั้งหมด (Errors in a shard block further processing) เพื่อป้องกันไม่ให้ข้อมูลในอนาคตถูกนำไปคำนวณก่อนข้อมูลในอดีต

### ข้อที่ 5: การอนุญาตให้ Amazon S3 ทริกเกอร์ฟังก์ชัน Lambda อย่างปลอดภัย
**สถานการณ์:** ผู้ดูแลระบบต้องการตั้งค่าให้ Amazon S3 Bucket ชื่อ `incoming-invoices` สามารถเรียกใช้งานฟังก์ชัน Lambda ชื่อ `process-invoice` เมื่อมีผู้อัปโหลดไฟล์ PDF เข้ามา แต่เมื่อทดสอบอัปโหลดไฟล์ พบว่า Lambda ไม่ทำงาน และไม่มี Log ใดๆ ใน CloudWatch ผู้ดูแลระบบขาดการตั้งค่าส่วนใด?
- ก) ขาดการสร้าง IAM Execution Role ให้กับ S3 Bucket
- ข) ขาดการเพิ่ม Resource-based Policy บน Lambda เพื่ออนุญาตให้ S3 เป็น Principal ที่มีสิทธิ์เรียก `lambda:InvokeFunction`
- ค) ขาดการติดตั้ง AWS Systems Manager Agent บนฟังก์ชัน Lambda
- ง) ขาดการตั้งค่า VPC Peering ระหว่าง S3 และ Lambda
- **เฉลย:** **ข) ขาดการเพิ่ม Resource-based Policy บน Lambda เพื่ออนุญาตให้ S3 เป็น Principal ที่มีสิทธิ์เรียก `lambda:InvokeFunction`**
- **จุดหลอก (Exam Trap):** การที่บริการภายนอกจะสั่ง Invoke เข้ามาที่ Lambda ต้องใช้ Resource Policy (Inbound Permission) ไม่ใช่ Execution Role (ซึ่งเป็น Outbound Permission ของตัว Lambda เอง)
- **เหตุผลทางเทคนิค:** ตามโมเดล Permissions ของ Lambda (สไลด์หน้า 28-29) การอนุญาตให้ Event Source สั่งรันฟังก์ชันได้ จะต้องเพิ่ม Resource-based Policy โดยระบุ Principal เป็น `s3.amazonaws.com` พร้อมเงื่อนไข SourceArn ของ Bucket นั้นๆ
