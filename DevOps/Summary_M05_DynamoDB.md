# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 5: Developing Flexible NoSQL Solutions (Amazon DynamoDB)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 74 หน้า พร้อมถอดความสูตรคำนวณ RCU/WCU และสถาปัตยกรรม Global Tables ครบถ้วน

---

## 1. ภาพรวมและเปรียบเทียบประเภทฐานข้อมูล (Database Options)

| คุณสมบัติ | ฐานข้อมูลเชิงสัมพันธ์ (Relational / SQL) | ฐานข้อมูลแบบไม่สัมพันธ์ (Nonrelational / NoSQL) |
| :--- | :--- | :--- |
| **รูปแบบข้อมูล** | ตาราง มีแถว (Rows) และคอลัมน์ (Columns) | Key-Value, เอกสาร (Documents), กราฟ (Graphs) |
| **โครงสร้าง (Schema)** | สคีมาตายตัว (Fixed Schema), เน้น Data Integrity | สคีมายืดหยุ่น (Dynamic Schema), ข้อมูลแต่ละแถวมีฟิลด์ต่างกันได้ |
| **การสเกล (Scaling)** | **Vertical Scaling** (เพิ่ม CPU/RAM ของเครื่องเซิร์ฟเวอร์) | **Horizontal Scaling** (กระจายข้อมูลข้ามหลายโหนดเซิร์ฟเวอร์) |
| **ความเร็ว Throughput** | ปานกลาง หาก Read/Write มหาศาลจะมีค่าใช้จ่ายสูงมาก | รองรับปริมาณ Read/Write ระดับมหาศาล (Microsecond to Millisecond) |
| **บริการบน AWS** | **Amazon RDS**, **Amazon Aurora** | **Amazon DynamoDB**, **Amazon ElastiCache**, **Amazon Neptune** |

---

## 2. องค์ประกอบพื้นฐานและระบบกุญแจหลัก (DynamoDB Core Components & Keys)

### 2.1 องค์ประกอบแกนหลัก
1. **Table (ตาราง):** กลุ่มของข้อมูล (เทียบเท่า Table ใน SQL)
2. **Item (รายการข้อมูล):** แถวข้อมูลแต่ละแถว (เทียบเท่า Row/Record ใน SQL) ขนาดสูงสุดของ 1 Item คือ **ไม่เกิน 400 KB** (รวมชื่อและค่า Attribute)
3. **Attributes (คุณลักษณะ):** ฟิลด์ข้อมูลใน Item (เทียบเท่า Column ใน SQL) รองรับ Scalar (String, Number, Binary, Boolean, Null), Document (List, Map/JSON), และ Set

### 2.2 ประเภทของ Primary Key (หัวใจของการกระจายข้อมูล)
- **1) Simple Primary Key (Partition Key หรือ HASH Key เท่านั้น):**
  - ใช้ Attribute เดียวเป็น Primary Key
  - DynamoDB นำค่าของ Partition Key เข้า **Internal Hash Function** เพื่อตัดสินใจว่าข้อมูล Item นั้นจะถูกส่งไปเก็บไว้ที่ **Physical Partition (พาร์ติชันทางกายภาพ)** ใด
  - ห้ามมี Item ที่มี Partition Key ซ้ำกันเด็ดขาด
- **2) Composite Primary Key (Partition Key + Sort Key หรือ HASH + RANGE Key):**
  - ใช้ 2 Attributes ร่วมกันระบุตัวตน
  - **Partition Key (HASH):** กำหนดว่าข้อมูลจะลงพาร์ติชันทางกายภาพใด
  - **Sort Key (RANGE):** จัดเรียงข้อมูลที่อยู่ใน Partition Key เดียวกันตามลำดับจากน้อยไปมาก (**Ascending Order**)
  - ข้อมูลสามารถมี Partition Key ซ้ำกันได้ แต่คู่ของ `(Partition Key + Sort Key)` ต้องไม่ซ้ำกัน

---

## 3. ดัชนีรอง (Secondary Indexes: GSI vs LSI)

ใช้สำหรับคิวรีข้อมูลด้วย Attribute อื่นที่ไม่ใช่ Primary Key หลักของตาราง ถือเป็นจุดที่ข้อสอบ AWS ออกลึกที่สุด:

| คุณสมบัติ | Global Secondary Index (GSI) | Local Secondary Index (LSI) |
| :--- | :--- | :--- |
| **Partition Key** | **แตกต่าง** จาก Base Table ได้อย่างอิสระ | **ต้องเหมือนกับ Base Table 100%** |
| **Sort Key** | แตกต่างจาก Base Table หรือไม่มีก็ได้ | **ต้องแตกต่าง** จาก Base Table |
| **เวลาที่สร้างได้** | สร้างพร้อมตาราง หรือ **สร้างย้อนหลังในภายหลังได้ตลอดเวลา** | **ต้องสร้างพร้อมกับตารางเท่านั้น** (สร้างย้อนหลังไม่ได้เด็ดขาด) |
| **ขีดจำกัดขนาดข้อมูล** | ไม่จำกัดขนาดข้อมูลต่อ Partition Key | จำกัดขนาดข้อมูลรวมไม่เกิน **10 GB ต่อ 1 Partition Key** |
| **Read Consistency** | รองรับเฉพาะ **Eventual Consistency** เท่านั้น | รองรับทั้ง **Strongly Consistent** และ **Eventual Consistency** |
| **การคิด Throughput** | **มี RCU / WCU แยกต่างหากเป็นของตัวเอง** | **แชร์ RCU / WCU ร่วมกับ Base Table** |
| **ผลกระทบต่อ Throughput** | หาก Write บน GSI ถูก Throttled อาจส่งผลให้ Write ตารางหลักพัง | แชร์ขีดจำกัดร่วมกัน หากพาร์ติชันตึงจะติด Throttling ร่วมกัน |

- **Projected Attributes (การเลือกฟิลด์มาใส่ใน Index):**
  - `KEYS_ONLY`: เก็บเฉพาะคีย์ของตารางหลักและคีย์ของ Index (ประหยัดพื้นที่และ Throughput สุด)
  - `INCLUDE`: เลือกเจาะจงเฉพาะบาง Attribute ที่ต้องใช้บ่อย
  - `ALL`: ก็อปปี้ทุก Attribute ในตารางหลักมาใส่ใน Index (เปลืองพื้นที่และ Throughput สูงสุด แต่ไม่ต้องไป Fetch ตารางหลักซ้ำ)

---

## 4. ความสม่ำเสมอของข้อมูลและสูตรคำนวณ Throughput (RCU / WCU)

### 4.1 ระดับความสม่ำเสมอในการอ่านข้อมูล (Read Consistency)
- **Eventually Consistent Read (ค่าเริ่มต้น):** อ่านข้อมูลทันที ข้อมูลอาจยังไม่อัปเดตหากเพิ่ง Write ไปเสี้ยววินาทีก่อนหน้า (ใช้ 0.5 RCU ต่อ 4 KB)
- **Strongly Consistent Read:** ส่งคืนข้อมูลที่อัปเดตล่าสุด 100% เสมอ โดยอ่านจากโหนดเสียงข้างมาก (ใช้ 1 RCU ต่อ 4 KB)

### 4.2 กฎและสูตรคำนวณ Read Capacity Units (RCU)
- **กฎพื้นฐาน:**
  - 1 RCU = อ่านแบบ **Strongly Consistent** จำนวน 1 ครั้ง/วินาที สำหรับ Item ขนาดไม่เกิน **4 KB**
  - 1 RCU = อ่านแบบ **Eventually Consistent** จำนวน 2 ครั้ง/วินาที สำหรับ Item ขนาดไม่เกิน **4 KB**
- **ขั้นตอนการคำนวณ:**
  1. นำขนาด Item มาปัดเศษขึ้นให้เป็นจำนวนเท่าของ 4 KB: `ceil(Item Size / 4 KB)`
  2. คูณด้วยจำนวนการอ่านต่อวินาที (Reads per second)
  3. หากเป็น **Strongly Consistent**: นำผลคูณมาใช้ได้ทันที
  4. หากเป็น **Eventually Consistent**: นำผลลัพธ์มา **หารด้วย 2**

> **ตัวอย่างโจทย์จริง (Slide 36-37):**
> อ่านข้อมูล 20 รายการต่อวินาที แต่ละรายการมีขนาด 11 KB ด้วยโหมด Eventual Consistency ต้องจัดสรรกี่ RCU?
> - ขั้นที่ 1: ปัดเศษ 11 KB ขึ้นเป็นพหุคูณของ 4 KB -> ได้ 12 KB
> - ขั้นที่ 2: คำนวณจำนวนบล็อก 4 KB: `12 / 4 = 3`
> - ขั้นที่ 3: คูณด้วยจำนวนรายการต่อวินาที: `3 * 20 = 60`
> - ขั้นที่ 4: ปรับตาม Eventual Consistency (หาร 2): `60 / 2 = 30 RCUs` (ตอบ 30 RCUs)

### 4.3 กฎและสูตรคำนวณ Write Capacity Units (WCU)
- **กฎพื้นฐาน:**
  - 1 WCU = เขียนข้อมูลจำนวน 1 ครั้ง/วินาที สำหรับ Item ขนาดไม่เกิน **1 KB**
- **ขั้นตอนการคำนวณ:**
  1. นำขนาด Item มาปัดเศษขึ้นให้เป็นจำนวนเท่าของ 1 KB: `ceil(Item Size / 1 KB)`
  2. แปลงความถี่การเขียนให้เป็น "ครั้งต่อวินาที" (Writes per second)
  3. คูณจำนวนบล็อก 1 KB ด้วยจำนวนการเขียนต่อวินาที

> **ตัวอย่างโจทย์จริง (Slide 38-39):**
> เขียนข้อมูล 120 รายการต่อนาที แต่ละรายการมีขนาด 7 KB ต้องจัดสรรกี่ WCU?
> - ขั้นที่ 1: ขนาด 7 KB พอดีบล็อก 1 KB -> ได้ 7 บล็อก
> - ขั้นที่ 2: แปลงความถี่เป็นต่อวินาที: `120 รายการ / 60 วินาที = 2 รายการต่อวินาที`
> - ขั้นที่ 3: คูณบล็อกด้วยความถี่: `7 * 2 = 14 WCUs` (ตอบ 14 WCUs)

### 4.4 โหมด Throughput: Provisioned vs On-Demand
- **Provisioned Mode:** ผู้ใช้กำหนด RCU และ WCU ล่วงหน้า จ่ายเงินตามที่จอง เหมาะกับ Workload ที่มี Traffic คาดเดาได้
- **On-Demand Mode:** จ่ายตามจำนวนครั้งที่มีคำขอเข้ามาจริง (Pay-per-request) สเกลรับโหลดพีกอัตโนมัติทันที เหมาะกับแอปเปิดใหม่ที่ยังไม่รู้ Traffic ชัดเจน หรือระบบที่มี Traffic ผันผวนรุนแรง

---

## 5. DynamoDB Streams และ Global Tables

### 5.1 DynamoDB Streams (กลไกตรวจจับการเปลี่ยนแปลงข้อมูล - CDC)
- บันทึกการเปลี่ยนแปลงข้อมูลระดับ Item (Create, Update, Delete) แบบเรียลไทม์และเรียงตามลำดับเวลา (Time-ordered Sequence)
- สตรีมถูกแบ่งออกเป็น **Shards** จัดเก็บข้อมูลได้นานสูงสุด **24 ชั่วโมง**
- **ข้อมูลใน Record (Stream Views):**
  - `KEYS_ONLY`: บันทึกเฉพาะคีย์ของ Item ที่ถูกแก้
  - `NEW_IMAGE`: บันทึกภาพข้อมูลทั้งก้อนหลังถูกแก้ไข
  - `OLD_IMAGE`: บันทึกภาพข้อมูลทั้งก้อนก่อนถูกแก้ไข
  - `NEW_AND_OLD_IMAGES`: บันทึกทั้งภาพก่อนและหลังแก้ไข (ใช้มากที่สุด)
- **Use Cases:** ทริกเกอร์ **AWS Lambda** เพื่อส่งแจ้งเตือน, ทำ Audit Log, หรือทำ Data Replication

### 5.2 Global Tables (ตารางแบบกระจายข้ามรีเจียน)
- ระบบฐานข้อมูลแบบ **Multi-Region, Multi-Active (Active-Active)** ข้อมูลถูกเขียนลงรีเจียนใดก็ได้
- ทำงานอยู่บนฐานของ **DynamoDB Streams** ในการซิงค์ข้อมูลข้ามรีเจียนแบบ Asynchronous (Eventual Consistency)
- **กลไกแก้ปัญหาการเขียนชนกัน (Concurrent Updates - Slide 45):**
  - ใช้หลักการ **Last Write Wins (LWW)**
  - เมื่อมีคำสั่งเขียนเข้ามาชนกันในข้อมูลเดียวกันจาก 2 รีเจียน DynamoDB จะเปรียบเทียบ Timestamp ของการเขียน และรายการที่มี Timestamp ล่าสุดจะถูกเขียนทับเป็นข้อมูลสุดท้าย
- **Read Consistency ข้ามรีเจียน (Slide 46):**
  - อ่านใน Local Region เดียวกัน: ทำได้ทั้ง Strongly Consistent และ Eventual
  - อ่านข้อมูลที่มาจาก Remote Region: จะเป็น **Eventually Consistent** เสมอ

---

## 6. การสำรองข้อมูลและการกู้คืน (Backup & Restore)

1. **On-Demand Backup:** สร้าง Snapshot ข้อมูลทั้งตารางเก็บไว้บน S3 โดย **ไม่มีผลกระทบต่อประสิทธิภาพ (Zero Impact on Performance)** หรือ Throughput ของตารางหลัก และคงอยู่ถาวรจนกว่าจะสั่งลบ
2. **Point-In-Time Recovery (PITR):** ทำการสำรองข้อมูลอัตโนมัติต่อเนื่อง ช่วยให้สามารถกู้คืนตารางย้อนหลังกลับไปยัง **วินาทีใดก็ได้ในช่วง 35 วันที่ผ่านมา** เพื่อป้องกันข้อผิดพลาดจากการเผลอลบหรือเขียนโค้ดบั๊กทับข้อมูล

---

## 7. การทำงานกับข้อมูลผ่าน SDK (DynamoDB APIs & Operations)

### 7.1 การเขียนข้อมูลเดี่ยว (Write Operations)
- `put_item`: สร้าง Item ใหม่ หรือ **เขียนทับ (Overwrite) Item เดิม** หาก Primary Key ซ้ำ
- `update_item`: แก้ไขเฉพาะบาง Attribute ผ่าน `UpdateExpression` (เช่น `SET age = :val1`) โดยไม่ต้องเขียนทับทั้งแถว
- `delete_item`: ลบ Item ตาม Primary Key ที่ระบุ
- **Condition Expressions:** ใส่เงื่อนไขกำกับก่อนเขียนหรือลบ เช่น `attribute_not_exists(username)` เพื่อกันการเขียนทับ หรือ `balance >= :val` ป้องกันยอดเงินติดลบ

### 7.2 การอ่านข้อมูล: Query vs Scan (จุดวัดผลสำคัญ)

| มิติ | Query Operation | Scan Operation |
| :--- | :--- | :--- |
| **การทำงาน** | ค้นหาแบบตรงจุดโดย **ต้องระบุ Partition Key เสมอ** (+ Sort Key ได้) | **อ่านทุก Item ในตารางทั้งหมด (Full Table Scan)** |
| **ประสิทธิภาพ** | รวดเร็ว มั่นคงในระดับมิลลิวินาที | ช้ามาก และแย่ลงเรื่อยๆ ตามขนาดข้อมูลในตาราง |
| **การใช้ RCU** | คิดตามขนาดของ Item ที่ตรงกับ KeyCondition เท่านั้น | **คิด RCU ตามขนาดของข้อมูลทั้งตารางที่ถูกสแกน** |
| **Filter Expression** | กรองผลลัพธ์ *หลังจาก* Query ด้วย Key แล้ว (ประหยัด RCU) | กรองผลลัพธ์ *หลังจาก* อ่านทุก Item มาแล้ว (เปลือง RCU มหาศาล) |
| **Pagination** | มีลิมิตส่งคืนข้อมูลไม่เกิน **1 MB ต่อครั้ง** หากเหลือข้อมูลจะส่ง `LastEvaluatedKey` กลับมา | มีลิมิต **1 MB ต่อครั้ง** และต้องส่ง `ExclusiveStartKey` เพื่ออ่านหน้าถัดไป |

### 7.3 การประมวลผลแบบกลุ่มและธุรกรรม (Batch vs Transaction)
- **Batch Operations:**
  - `BatchGetItem`: อ่านได้สูงสุด **100 Items** หรือไม่เกิน **16 MB**
  - `BatchWriteItem`: รวมคำสั่ง Put/Delete ได้สูงสุด **25 Items** หรือไม่เกิน **16 MB** (❌ **ไม่รองรับ UpdateItem**)
  - *หากมีบาง Item ล้มเหลว:* คำสั่งที่เหลือยังทำงานต่อสำเร็จ ระบบจะส่งคืนรายชื่อที่พังใน `UnprocessedItems` เพื่อให้ผู้ใช้ทำ Retry
- **Transactions (TransactWriteItems / TransactGetItems):**
  - รองรับ ACID 100% ทำงานแบบ **All-or-Nothing** ข้ามหลาย Item และหลาย Table ได้
  - *หากมีเพียง 1 คำสั่งล้มเหลว:* ทุกคำสั่งในธุรกรรมจะถูก **Rollback ยกเลิกทั้งหมด**
  - ⚠️ คิดค่าใช้จ่าย Throughput เป็น **2 เท่า (2x RCU / 2x WCU)** ของการเขียนอ่านปกติ

---

## 8. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการสร้าง LSI ย้อนหลัง:** โจทย์ถามว่าตารางโปรดักชันมีปัญหาค้นหาช้า ต้องการสร้าง Local Secondary Index เพิ่มเติมบนตารางที่มีอยู่แล้ว
   - ✅ **ที่ถูกต้อง:** **ทำไม่ได้เด็ดขาด!** LSI ต้องสร้างพร้อมกับตอน CreateTable เท่านั้น หากตารางสร้างไปแล้ว ทางออกเดียวคือต้องสร้างเป็น **Global Secondary Index (GSI)**
2. ❌ **หลอกเรื่อง FilterExpression ในคำสั่ง Scan:** โจทย์ถามว่าใส่ `FilterExpression` ใน Scan แล้ว จะช่วยประหยัด RCU ใช่หรือไม่?
   - ✅ **ที่ถูกต้อง:** **ไม่ช่วยประหยัด RCU เลยแม้แต่น้อย!** DynamoDB จะอ่านข้อมูลทุกแถวขึ้นมาคิดเงิน RCU ทั้งหมดก่อน จากนั้นจึงค่อยใช้ FilterExpression กรองข้อมูลทิ้งก่อนส่งให้ผู้ใช้
3. ❌ **หลอกเรื่อง UpdateItem ใน BatchWriteItem:** โจทย์ถามว่าต้องการแก้ไขสถานะออเดอร์ 20 รายการพร้อมกันโดยใช้ `BatchWriteItem`
   - ✅ **ที่ถูกต้อง:** `BatchWriteItem` รองรับเฉพาะ **PutRequest และ DeleteRequest เท่านั้น** หากต้องการอัปเดต ต้องส่ง `update_item` ทีละคำขอ หรือใช้ `TransactWriteItems`
4. ❌ **หลอกเรื่อง Read Consistency บน GSI:** โจทย์ถามว่าต้องการอ่านข้อมูลจาก GSI แบบ Strongly Consistent เพื่อทำระบบการเงิน
   - ✅ **ที่ถูกต้อง:** **GSI รองรับเฉพาะ Eventually Consistent เท่านั้น** ไม่สามารถเปิด Strongly Consistent ได้ (มีเพียง LSI และตารางหลักเท่านั้นที่เปิดได้)
5. ❌ **หลอกเรื่องการเขียนชนกันใน Global Tables:** โจทย์ถามว่าเมื่อเกิดการเขียนข้อมูลในฟิลด์เดียวกันจาก 2 รีเจียนพร้อมกัน DynamoDB จะแจ้ง Error ชนกันหรือไม่?
   - ✅ **ที่ถูกต้อง:** ไม่เกิด Error แต่จะใช้กลไก **Last Write Wins (LWW)** โดยข้อมูลที่มี Timestamp ล่าสุดจะเขียนทับข้อมูลก่อนหน้าโดยอัตโนมัติ

---

## 9. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การตรวจจับและส่งต่อข้อมูลที่เปลี่ยนแปลง (AWS Academy Slide 71-73)
**สถานการณ์:** นักพัฒนากำลังสร้างโซลูชันโดยใช้ตาราง Amazon DynamoDB เมื่อใดก็ตามที่มีการอัปเดตข้อมูลในตาราง การเปลี่ยนแปลงนั้นจะต้องถูกส่งไปยัง AWS Lambda ทันที เพื่อให้ Lambda ส่งข้อความแจ้งเตือนไปยังทีม Operations เมื่อพบค่าที่ผิดปกติ นักพัฒนาควรแก้ไขตาราง DynamoDB อย่างไรเพื่อสร้างโซลูชันนี้?
- ก) สร้าง Global Secondary Index เพื่อเพิ่มความเร็วในการคิวรีให้โค้ดดึงข้อมูลได้เร็วขึ้น
- ข) สร้าง Local Secondary Index เพื่อให้โค้ดสามารถค้นหาความผิดปกติได้แบบ Strongly Consistent
- ค) เปิดใช้งาน DynamoDB Streams บนตารางดังกล่าว
- ง) ตั้งเวลา Cron Job บน Amazon EventBridge เพื่อสั่ง Scan ตารางทุกๆ 1 นาที
- **เฉลย:** **ค) เปิดใช้งาน DynamoDB Streams บนตารางดังกล่าว**
- **จุดหลอก (Exam Trap):** การใช้ Index (ข้อ ก และ ข) เป็นเพียงการเร่งความเร็วในการอ่านข้อมูล ไม่สามารถส่ง Event อัตโนมัติได้ ส่วนการทำ Cron Scan (ข้อ ง) สิ้นเปลือง RCU และมี Latency สูง
- **เหตุผลทางเทคนิค:** DynamoDB Streams ออกแบบมาสำหรับงาน Change Data Capture (CDC) โดยเฉพาะ เมื่อข้อมูลมีการแก้ไข จะสร้าง Record เรียงตามเวลาและสามารถตั้ง Event Source Mapping ให้ทริกเกอร์ AWS Lambda ได้ทันที

### ข้อที่ 2: การคำนวณ Read Capacity Units สำหรับระบบอ่านแบบสม่ำเสมอสูง
**สถานการณ์:** แอปพลิเคชันจัดอันดับคะแนนเกมออนไลน์ต้องการอ่านข้อมูลประวัติผู้เล่นจำนวน 80 ครั้งต่อวินาที ขนาดของข้อมูลผู้เล่นแต่ละคนเฉลี่ยอยู่ที่ 6 KB หากระบบต้องการให้อ่านข้อมูลแบบล่าสุดเสมอ (Strongly Consistent Read) วิศวกรต้องจัดสรรค่า RCU บนตาราง DynamoDB เท่าใดจึงจะเพียงพอและไม่เกิดปัญหา Throttling?
- ก) 80 RCUs
- ข) 120 RCUs
- ค) 160 RCUs
- ง) 240 RCUs
- **เฉลย:** **ค) 160 RCUs**
- **จุดหลอก (Exam Trap):** หลายคนนำขนาด 6 KB ไปหาร 4 ได้ 1.5 แล้วลืมปัดเศษ หรือคิดว่า Eventual Consistency เลยนำไปหาร 2 ซ้ำ
- **เหตุผลทางเทคนิค:** ขนาด 6 KB ต้องปัดเศษขึ้นเป็นพหุคูณของ 4 KB คือได้ 8 KB (คิดเป็น 2 บล็อก RCU ต่อ Item); เมื่อต้องการอ่าน 80 ครั้งต่อวินาทีแบบ Strongly Consistent จะต้องใช้: `2 * 80 = 160 RCUs`

### ข้อที่ 3: การเลือกใช้ Secondary Index บนตารางที่เปิดใช้งานไปแล้ว
**สถานการณ์:** ตาราง `Orders` ในระบบอีคอมเมิร์ซมี `CustomerId` เป็น Partition Key และ `OrderDate` เป็น Sort Key ระบบทำงานบน Production มาแล้ว 6 เดือน ต่อมาฝ่ายการตลาดต้องการฟังก์ชันค้นหาออเดอร์โดยใช้ `OrderStatus` เป็นเงื่อนไขหลักในการค้นหา วิศวกรควรดำเนินการอย่างไรโดยไม่กระทบต่อข้อมูลเดิม?
- ก) สร้าง Local Secondary Index (LSI) ใหม่ที่มี `OrderStatus` เป็น Sort Key
- ข) สร้าง Global Secondary Index (GSI) ใหม่ที่มี `OrderStatus` เป็น Partition Key
- ค) ทำการ Migrate ตารางใหม่ทั้งหมด เพราะ DynamoDB ไม่อนุญาตให้เพิ่ม Index หลังสร้างตาราง
- ง) เปลี่ยน Primary Key ของตารางเดิมให้เป็น `OrderStatus` ผ่านคำสั่ง UpdateTable
- **เฉลย:** **ข) สร้าง Global Secondary Index (GSI) ใหม่ที่มี `OrderStatus` เป็น Partition Key**
- **จุดหลอก (Exam Trap):** ข้อ ก ลวงด้วย LSI แต่ในความเป็นจริง LSI ไม่สามารถสร้างย้อนหลังได้ ส่วนข้อ ง DynamoDB ไม่อนุญาตให้แก้ไข Primary Key ของตารางที่สร้างไปแล้ว
- **เหตุผลทางเทคนิค:** Global Secondary Index (GSI) สามารถสร้างเพิ่มเติมบนตารางที่มีข้อมูลอยู่แล้วได้ตลอดเวลา และสามารถกำหนด Partition Key ใหม่ (เช่น `OrderStatus`) ได้อย่างอิสระ

### ข้อที่ 4: การจัดการกับคำสั่ง Batch ที่ล้มเหลวบางส่วน
**สถานการณ์:** แอปพลิเคชันส่งข้อมูลชุดใหญ่ 25 รายการไปยัง DynamoDB โดยใช้คำสั่ง `BatchWriteItem` แต่เนื่องจากทราฟฟิกพีกกะทันหัน ทำให้มีข้อมูล 5 รายการถูกปฏิเสธเนื่องจาก Provisioned Throughput Exceeded ระบบจะตอบสนองอย่างไร และนักพัฒนาควรเขียนโค้ดจัดการอย่างไร?
- ก) ทั้ง 25 รายการจะถูกยกเลิก (Rollback) ทั้งหมด และแจ้งเตือน TransactionCanceledException
- ข) มี 20 รายการที่เขียนสำเร็จ และอีก 5 รายการจะถูกส่งคืนในฟิลด์ `UnprocessedItems` ซึ่งนักพัฒนาต้องเขียนลูป Exponential Backoff เพื่อ Retry
- ค) DynamoDB จะเก็บ 5 รายการที่เหลือไว้ในคิวภายในและพยายามส่งซ้ำให้อัตโนมัติจนกว่าจะสำเร็จ
- ง) คำขอจะค้าง (Hang) จนกว่า Throughput จะพร้อมทำงาน
- **เฉลย:** **ข) มี 20 รายการที่เขียนสำเร็จ และอีก 5 รายการจะถูกส่งคืนในฟิลด์ `UnprocessedItems` ซึ่งนักพัฒนาต้องเขียนลูป Exponential Backoff เพื่อ Retry**
- **จุดหลอก (Exam Trap):** สับสนระหว่าง `BatchWriteItem` กับ `TransactWriteItems` (ข้อ ก เป็นพฤติกรรมของ Transaction ไม่ใช่ Batch)
- **เหตุผลทางเทคนิค:** `BatchWriteItem` ไม่ใช่ Transaction คำขอแต่ละชิ้นในชุดจะทำงานเป็นอิสระต่อกัน ชิ้นที่ผ่านจะบันทึกทันที ส่วนชิ้นที่ติด Throttled จะถูกตีกลับมาใน `UnprocessedItems` ให้นักพัฒนาเขียนโค้ด Retry เอง

### ข้อที่ 5: การออกแบบระบบรับข้อมูลที่ป้องกันการเขียนทับ
**สถานการณ์:** ระบบลงทะเบียนผู้ใช้งานต้องการบันทึกข้อมูล `UserProfile` ลงในตาราง DynamoDB โดยมี `Email` เป็น Partition Key นักพัฒนาต้องการให้แน่ใจว่า หากมีผู้ใช้พยายามสมัครด้วยอีเมลที่เคยมีอยู่ในระบบแล้ว คำขอจะต้องถูกปฏิเสธทันที และห้ามเขียนทับข้อมูลเดิม ควรนำเทคนิคใดมาใช้ร่วมกับคำสั่ง `PutItem`?
- ก) สั่ง `GetItem` เพื่อตรวจดูก่อน หากไม่เจอจึงค่อยสั่ง `PutItem` ตามไป
- ข) แนบ Condition Expression: `attribute_not_exists(Email)` ลงในคำขอ `PutItem`
- ค) เปลี่ยนไปใช้คำสั่ง `UpdateItem` แทน `PutItem`
- ง) ล็อกตารางด้วยคำสั่ง TableLock ก่อนทำการเขียนข้อมูล
- **เฉลย:** **ข) แนบ Condition Expression: `attribute_not_exists(Email)` ลงในคำขอ `PutItem`**
- **จุดหลอก (Exam Trap):** การทำ Get แล้วตามด้วย Put (ข้อ ก) ก่อให้เกิดปัญหา Race Condition (สองคนกดสมัครพร้อมกันในเสี้ยววินาที ข้อมูลจะทับกันได้)
- **เหตุผลทางเทคนิค:** Condition Expression ทำงานแบบ Atomic ณ ฝั่งเซิร์ฟเวอร์ของ DynamoDB การใส่ `attribute_not_exists(Email)` จะรับประกันว่าถ้ามี Partition Key นี้อยู่แล้ว ระบบจะยกเลิกคำขอทันทีด้วยข้อผิดพลาด `ConditionalCheckFailedException` ป้องกันการเขียนทับได้อย่างสมบูรณ์ 100%
