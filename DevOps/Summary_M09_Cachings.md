# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 9: Caching Information for Scalability (ElastiCache, CloudFront & Edge Functions)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 65 หน้า พร้อมถอดความโครงสร้าง Cache Strategies, Memcached vs Redis, และ Lambda@Edge vs CloudFront Functions ครบถ้วน

---

## 1. ภาพรวมและหลักการทำงานของ Caching (Core Concepts)

- **Caching:** เทคนิคการนำสำเนาของข้อมูลที่ถูกเรียกใช้บ่อยหรือผ่านการประมวลผลที่ซับซ้อน มาจัดเก็บไว้ในหน่วยความจำชั่วคราวความเร็วสูง (In-Memory) เพื่อให้การเรียกใช้ครั้งถัดไปรวดเร็วขึ้นในระดับ Sub-millisecond และลดภาระของระบบหลังบ้าน (Database / Origin)
- **ประเภทเวิร์กโหลดที่เหมาะกับการทำ Caching (สไลด์หน้า 11):**
  1. **Read-Heavy Workloads (งานอ่านหนัก):** เช่น โซเชียลมีเดีย, หน้าโปรไฟล์ผู้ใช้, เว็บบอร์ด Q&A (ช่วยลด Read IOPS บนฐานข้อมูล)
  2. **Compute-Intensive Workloads (งานคำนวณหนัก):** เช่น การจัดอันดับ Leaderboard เกม, ระบบ Recommendation แนะนำสินค้า, แบบจำลองคำนวณสถิติ HPC
- **4 คำถามประกอบการตัดสินใจก่อนเปิด Cache (สไลด์หน้า 12):**
  1. การดึงข้อมูลนั้นต้องใช้ Query ที่ช้าและสิ้นเปลืองทรัพยากรใช่หรือไม่?
  2. ข้อมูลนั้นค่อนข้างนิ่ง (Static) และถูกเข้าถึงบ่อยใช่หรือไม่?
  3. ธุรกิจยอมรับให้ข้อมูลมีความคลาดเคลื่อนล่าช้า (Stale Data) ได้บ้างหรือไม่?
  4. ประสิทธิภาพที่ได้คุ้มกับความซับซ้อนและค่าใช้จ่ายของแคชที่เพิ่มขึ้นหรือไม่?

---

## 2. Amazon ElastiCache (ระบบแคชฐานข้อมูลในหน่วยความจำ)

บริการ Managed In-Memory Data Store ที่ให้ Latency ต่ำกว่า 1 มิลลิวินาที รองรับ 2 เอนจินมาตรฐาน:

| คุณสมบัติ | ElastiCache for Memcached | ElastiCache for Redis |
| :--- | :--- | :--- |
| **สถาปัตยกรรม CPU** | **Multithreading** (ใช้ CPU หลายคอร์เต็มประสิทธิภาพ) | Single-threaded execution core (มี I/O Thread แยก) |
| **โครงสร้างข้อมูล** | จัดเก็บแบบ **Key-Value แบบเรียบง่ายเท่านั้น** | **รองรับ Complex Data Types** (Hashes, Lists, Sets, Sorted Sets, Bitmaps, Geospatial) |
| **ความคงทนของข้อมูล (Persistence)** | ❌ **ไม่มี** (รีสตาร์ตแล้วข้อมูลหายหมด) | **รองรับ Persistence** (Snapshot RDB และ AOF Log) |
| **การทำสำเนา (Replication & HA)** | ❌ ไม่มี Replication (ใช้ Partitioning กระจายโหนด) | **รองรับ High Availability (Multi-AZ with Auto-Failover)** มี Read Replicas ได้สูงสุด 5 โหนดต่อ Shard |
| **ฟีเจอร์ขั้นสูง** | Auto Discovery โหนดอัตโนมัติ | **Publish / Subscribe (Pub/Sub)**, Redis Streams, Geospatial |
| **ความเหมาะสมในการเลือกใช้ (Suitability)** | **เมื่อต้องการโมเดลที่เรียบง่ายที่สุด (Simplest model possible)** | **เมื่อต้องการความคงทนของข้อมูล (Data Persistence), โครงสร้างข้อมูลซับซ้อน หรือระบบ HA** |

---

## 3. กลยุทธ์การแคชข้อมูล (Caching Strategies: Lazy Loading vs Write-Through)

สไลด์หน้า 46-50 ถือเป็นข้อสอบวิเคราะห์สถานการณ์ที่ออกบ่อยที่สุด:

| มิติ | Lazy Loading (Cache-Aside) | Write-Through |
| :--- | :--- | :--- |
| **กลไกการทำงาน** | **แคชจะถูกอัปเดตเมื่อจำเป็นเท่านั้น (เมื่อเกิด Cache Miss)**<br>1. แอปค้นในแคช<br>2. หากเจอ (Hit) ส่งคืนทันที<br>3. หากไม่เจอ (Miss) วิ่งไปอ่าน DB แล้วนำมาเขียนลงแคช | **แคชจะถูกอัปเดตทันทีที่มีการเขียนข้อมูลลง DB**<br>1. แอปเขียนข้อมูลลง Database<br>2. แอปเขียนข้อมูลชุดเดียวกันลงใน Cache ทันที |
| **ความสดใหม่ของข้อมูล** | **เสี่ยงต่อการได้ข้อมูลเก่า (Stale Data)** หากข้อมูลใน DB มีการแก้แต่แคชยังไม่หมดอายุ | **ข้อมูลในแคชสดใหม่เสมอ (No Stale Data)** สอดคล้องกับ DB ตลอดเวลา |
| **ผลกระทบด้านความเร็ว (Penalty)** | **Cache Miss Penalty:** คำขอแรกที่ไม่เจอในแคชจะช้าลงเพราะต้องวิ่ง 3 ต่อ (App -> Cache -> DB -> Cache) | **Write Penalty:** การเขียนข้อมูลจะช้าลง 2 เท่าในทุกคำขอเขียน เพราะต้องรอเขียนทั้ง DB และ Cache |
| **ผลกระทบเมื่อแคชพัง (Node Failure)** | **ไม่ร้ายแรง (Non-fatal):** ระบบยังทำงานต่อไปได้โดยแอปจะวิ่งตรงไปอ่าน DB แทน | เกิดข้อมูลสูญหายหรือข้อมูลไม่ตรงกันหากโหนดแคชล่ม |
| **การจัดการพื้นที่แคช** | ดีเยี่ยม มีเฉพาะข้อมูลที่ถูกเรียกใช้จริงในแคช | **เกิด Cache Churn / Unused Data:** มีข้อมูลที่ไม่เคยถูกอ่านถูกยัดเข้ามาเปลืองพื้นที่แคช |
| **Use Cases ที่เหมาะสม** | ข้อมูลโปรไฟล์ผู้ใช้, รายการสินค้าทั่วไป (อ่านบ่อย เขียนนานๆ ที) | **ตารางคะแนนเกมแบบเรียลไทม์ (Top 100 Leaderboard)**, ยอดเงินคงเหลือ, ข่าวเด่น 10 อันดับแรก |

> **Best Practice:** แนวทางที่ดีที่สุดสำหรับระบบ Lazy Loading คือการ **กำหนดค่า TTL (Time to Live)** กำกับไว้เสมอ เพื่อให้ข้อมูลที่ค้างในแคชหมดอายุและไปโหลดใหม่จาก DB โดยอัตโนมัติ

---

## 4. Amazon CloudFront (Content Delivery Network - CDN)

- **Amazon CloudFront:** เครือข่ายกระจายเนื้อหาทั่วโลก ทำงานร่วมกับ Edge Locations และ Regional Edge Caches เพื่อส่งมอบข้อมูล สื่อวิดีโอ และ API ให้ผู้ใช้ด้วยความเร็วสูงสุด
- **Cache Key (หัวใจของการแคชหน้าเว็บ - สไลด์หน้า 34):**
  - **ดีฟอลต์ (Default Cache Key):** ประกอบด้วย **Domain Name + URL Path** ของคำขอเท่านั้น
  - ค่า Header, Query Strings และ Cookies จะถูกตัดทิ้ง ไม่นำมาคิดเป็น Cache Key (เช่น `example.com/page?id=1` กับ `example.com/page?id=2` จะได้ผลลัพธ์แคชหน้าเดียวกัน)
  - **การปรับแต่งด้วย Cache Policies:** สามารถระบุให้ CloudFront นำ Query Strings, Cookies หรือ HTTP Headers เฉพาะตัว เข้ามาร่วมคำนวณใน Cache Key ได้ตามพฤติกรรมของเนื้อหา
- **การหมดอายุและการล้างแคช (Expiration & Invalidation):**
  - ควบคุมผ่านค่า **Minimum TTL, Maximum TTL, และ Default TTL (ดีฟอลต์ 24 ชั่วโมง หรือ 86,400 วินาที)** ร่วมกับ Response Header จาก Origin (`Cache-Control: max-age` หรือ `Expires`)
  - **Cache Invalidation:** สั่งล้างไฟล์ในแคชก่อนหมดอายุทันที เช่น สั่ง Invalidate `/index.html` หรือ `/images/*` เมื่อมีการอัปเดตเวอร์ชันใหม่
- **Amazon S3 Transfer Acceleration:** ฟีเจอร์เร่งความเร็วการอัปโหลดไฟล์ขนาดใหญ่ขึ้นสู่ S3 ข้ามทวีป โดยให้ไคลเอนต์อัปโหลดเข้าสู่ CloudFront Edge Location ที่ใกล้ที่สุด แล้ววิ่งต่อเข้า S3 ผ่านเครือข่ายไฟเบอร์ส่วนตัวของ AWS

---

## 5. การประมวลผลที่ขอบเครือข่าย (Edge Functions: CloudFront Functions vs Lambda@Edge)

สไลด์หน้า 43 ถือเป็นตารางเปรียบเทียบหมัดต่อหมัดที่สำคัญมากในข้อสอบ AWS:

| คุณสมบัติ | CloudFront Functions (รุ่นเบา) | Lambda@Edge (รุ่นเต็ม) |
| :--- | :--- | :--- |
| **สถาปัตยกรรม** | **Native Feature ฝังใน CloudFront** (รันในระดับ Edge Locations กว่า 400+ จุด) | **ส่วนต่อขยายของ AWS Lambda** (รันบน Regional Edge Caches กว่า 13+ จุด) |
| **ระยะเวลาประมวลผล** | **สั้นระดับเสี้ยววินาที (Sub-milliseconds)** | รันได้สูงสุด **5 วินาที (สำหรับ Viewer events)** หรือ **30 วินาที (สำหรับ Origin events)** |
| **ขีดจำกัดทรัพยากร** | **RAM ไม่เกิน 2 MB**, ขนาดโค้ดไม่เกิน **10 KB** | **RAM สูงสุด 10,240 MB (10 GB)**, ขนาดแพ็กเกจสูงสุด **50 MB** |
| **ภาษาที่รองรับ** | **JavaScript (ECMAScript 5.1 compliant)** เท่านั้น | **Node.js** หรือ **Python** |
| **จุดเชื่อมต่อ Event Triggers** | **เฉพาะ 2 จุดด้านนอกสุดเท่านั้น:**<br>1. Viewer Request<br>2. Viewer Response | **ครบทั้ง 4 จุดของวงจรคำขอ:**<br>1. Viewer Request<br>2. Viewer Response<br>3. **Origin Request**<br>4. **Origin Response** |
| **การเข้าถึง Network / Body** | ❌ **ไม่สามารถเข้าถึง Network ภายนอกได้** และไม่สามารถเข้าถึง Body ของคำขอ | **สามารถเรียก API ภายนอกได้** และสามารถอ่าน/แก้ไข Request Body ได้ |
| **Use Cases ที่เหมาะสม** | - การแปลง Header หรือ Normalization ของ Cache Key<br>- การทำ URL Redirects / Rewrites (HTTP 301/302)<br>- การตรวจสอบความถูกต้องของ JWT Token ขั้นพื้นฐาน | - การทำ Server-Side Rendering (SSR)<br>- การปรับขนาดรูปภาพแบบ Dynamic ตามขนาดหน้าจอ (Image Resizing)<br>- การทำ Complex Authentication ร่วมกับฐานข้อมูลภายนอก |

---

## 6. ตารางเปรียบเทียบเชิงสถาปัตยกรรม (Comparison Tables)

### 6.1 Comparison: ElastiCache Memcached vs Redis

| หัวข้อ | Memcached | Redis |
| :--- | :--- | :--- |
| **Core Architecture** | Multithreaded | Single-threaded core |
| **Data Types** | Simple Key-Value Strings | Strings, Hashes, Lists, Sets, Sorted Sets, Bitmaps |
| **Persistence** | ไม่มี (Ephemeral) | มี (AOF / RDB Snapshots) |
| **Replication** | ไม่มี | มี (Primary + Read Replicas สูงสุด 5 โหนด) |
| **Auto Failover** | ไม่มี | มี (Multi-AZ Failover อัตโนมัติ) |
| **Pub/Sub Messaging** | ไม่รองรับ | รองรับสมบูรณ์ |
| **คีย์เวิร์ดในข้อสอบ** | *"Simplest model possible"* | *"Data persistence", "Complex data types", "High availability"* |

### 6.2 Comparison: Lazy Loading vs Write-Through

| ปัจจัย | Lazy Loading (Cache-Aside) | Write-Through |
| :--- | :--- | :--- |
| **การเขียนลง Cache** | เขียนเมื่อเกิด Cache Miss | เขียนทันทีพร้อมกับการบันทึก DB |
| **สถานะข้อมูล** | อาจมี Stale Data (ต้องคุมด้วย TTL) | ข้อมูลตรงกับ DB เสมอ (Zero Stale) |
| **ต้นทุน Throughput** | ประหยัด เก็บเฉพาะข้อมูลที่ถูกเรียกใช้จริง | เปลืองพื้นที่ เสี่ยงต่อ Cache Churn |
| **ผลกระทบด้านความเร็ว** | เร็วในคำขอที่ Hit, ช้าในคำขอแรกที่ Miss | คำขออ่านจะเร็วเสมอ แต่คำขอเขียนจะช้าลง |

---

## 7. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องการเลือก Memcached เมื่อต้องการความคงทนของข้อมูล:** โจทย์ระบุว่าต้องการแคชระบบตะกร้าสินค้าที่ข้อมูลห้ามสูญหายเมื่อเซิร์ฟเวอร์รีบูต และต้องการโครงสร้างแบบ Map/List
   - ✅ **ที่ถูกต้อง:** **ต้องเลือก ElastiCache for Redis เท่านั้น** เพราะ Memcached เป็น Pure In-Memory ไร้ระบบ Persistence และเก็บได้แค่ String Key-Value
2. ❌ **หลอกเรื่องการเลือกใช้ Edge Function ปรับแต่ง URL Redirects:** โจทย์ถามว่าต้องการฟังก์ชันตรวจสอบ User-Agent เพื่อทำ URL Redirect อย่างง่าย โดยต้องการต้นทุนต่ำสุดและ Latency ต่ำกว่าระดับมิลลิวินาที
   - ✅ **ที่ถูกต้อง:** **ใช้ CloudFront Functions** ห้ามเลือก Lambda@Edge เพราะงานง่ายๆ เช่น Header Manipulation หรือ Redirect สามารถรันบน CloudFront Functions ได้ไวกว่าและราคาถูกกว่า 6 เท่า
3. ❌ **หลอกเรื่องการแก้ไข Request Body หรือเรียก API ภายนอกบน CloudFront Functions:** โจทย์ถามว่าต้องการเขียนฟังก์ชันตรวจสอบ Token โดยยิงไปเช็กกับระบบ Auth ภายนอกบน Edge Location
   - ✅ **ที่ถูกต้อง:** **CloudFront Functions ทำไม่ได้เด็ดขาด เพราะไม่มี Network Access!** กรณีที่ต้องยิง HTTP Call หรือต่อฐานข้อมูลภายนอก **ต้องใช้ Lambda@Edge เท่านั้น**
4. ❌ **หลอกเรื่อง Cache Miss ในระบบ Lazy Loading:** โจทย์ถามว่าระบบ Lazy Loading ทำงานช้ามากในตอนเช้าที่มีการเปิดใช้งานระบบ สาเหตุคืออะไรและแก้อย่างไร?
   - ✅ **ที่ถูกต้อง:** เกิดจากปรากฏการณ์ **Cold Cache / Cache Miss Storm** ในตอนแรกเริ่มที่ยังไม่มีข้อมูลในแคช ทางแก้คือการทำ Cache Warming หรือใช้ Write-Through ร่วมด้วย
5. ❌ **หลอกเรื่อง Default Cache Key บน CloudFront:** โจทย์ถามว่าส่งคำขอ `https://cdn.example.com/api?user=1` และ `https://cdn.example.com/api?user=2` แต่ทำไมผู้ใช้คนที่สองถึงได้ข้อมูลของคนแรก?
   - ✅ **ที่ถูกต้อง:** เพราะดีฟอลต์ของ CloudFront Cache Key จะ **ไม่นำ Query Strings มาร่วมคำนวณ** ทำให้ระบบมองว่าทั้งสองคำขอเป็น URL เดียวกัน ทางแก้คือต้องแก้ไข Cache Policy ให้นำ Query Strings มาร่วมคำนวณใน Cache Key

---

## 8. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การเลือกเอนจินแคชฐานข้อมูลที่ต้องการความเรียบง่ายที่สุด (AWS Academy Slide 61-63)
**สถานการณ์:** บริษัทพัฒนาเกมต้องการเพิ่มระบบแคชข้อมูลเซสชันชั่วคราวของผู้เล่น เพื่อลดภาระของฐานข้อมูลหลัก ทีมงานต้องการโซลูชันที่ง่ายที่สุด ไม่ต้องการฟีเจอร์ซับซ้อน ไม่จำเป็นต้องสำรองข้อมูลถาวร และต้องการระบบที่รองรับการประมวลผลแบบ Multithreading ข้อใดเป็นเหตุผลสำคัญที่สุดในการเลือกใช้ Memcached แทนที่จะเป็น Redis?
- ก) คุณต้องการความสามารถในการทำ Data Replication ข้ามโซน
- ข) คุณต้องการโมเดลการทำงานที่เรียบง่ายที่สุด (The simplest model possible)
- ค) คุณต้องการจัดเก็บข้อมูลที่มีโครงสร้างซับซ้อน เช่น Sorted Sets
- ง) คุณต้องการแคชที่ทำงานในหน่วยความจำ RAM
- **เฉลย:** **ข) คุณต้องการโมเดลการทำงานที่เรียบง่ายที่สุด (The simplest model possible)**
- **จุดหลอก (Exam Trap):** ข้อ ก และ ค เป็นคุณสมบัติเฉพาะของ Redis ไม่ใช่ Memcached ส่วนข้อ ง เป็นคุณสมบัติพื้นฐานที่ทั้งสองตัวมีเหมือนกัน
- **เหตุผลทางเทคนิค:** ตามตารางเปรียบเทียบในสไลด์หน้า 16 Memcached เหมาะสำหรับกรณีที่ต้องการระบบแคชแบบดั้งเดิมที่เรียบง่าย ไม่มีความซับซ้อนของฟีเจอร์ขั้นสูง และต้องการพลังการประมวลผลแบบ Multithreaded ล้วนๆ

### ข้อที่ 2: การเลือกใช้กลยุทธ์การแคชสำหรับตารางจัดอันดับแบบเรียลไทม์
**สถานการณ์:** วิศวกรซอฟต์แวร์กำลังออกแบบระบบกระดานผู้นำคะแนนสูงสุด 10 อันดับแรก (Top 10 Leaderboard) สำหรับการแข่งขันอีสปอร์ต โดยคะแนนจะมีการอัปเดตตลอดเวลา และผู้เล่นทุกคนจะต้องเห็นคะแนนล่าสุดที่ถูกต้องตรงกัน 100% เสมอโดยไม่มีข้อมูลเก่าค้างในแคช ควรนำกลยุทธ์การแคชรูปแบบใดมาใช้?
- ก) Lazy Loading พร้อมตั้งค่า TTL ไว้ที่ 24 ชั่วโมง
- ข) Write-Through Caching
- ค) Client-side Browser Caching
- ง) Lazy Loading แบบไม่กำหนดค่า TTL
- **เฉลย:** **ข) Write-Through Caching**
- **จุดหลอก (Exam Trap):** Lazy Loading (ข้อ ก และ ง) มีความเสี่ยงที่จะเกิด Stale Data เมื่อข้อมูลมีการเปลี่ยนแปลง ซึ่งไม่เหมาะกับตารางคะแนนแบบเรียลไทม์
- **เหตุผลทางเทคนิค:** Write-Through (สไลด์หน้า 46, 49) บังคับให้อัปเดตข้อมูลลงแคชพร้อมกับตอนที่เขียนลงฐานข้อมูลเสมอ ทำให้ข้อมูลในแคชสดใหม่ตลอดเวลา ไม่มีความล่าช้าของข้อมูล และไม่มีปัญหา Cache Miss Penalty

### ข้อที่ 3: การเลือกเทคโนโลยี Edge Compute สำหรับการแปลง Header ขนาดเบา
**สถานการณ์:** เว็บไซต์ข่าวระดับโลกต้องการตรวจสอบค่า Header `CloudFront-Viewer-Country` เพื่อทำการ Redirect ผู้ใช้งานไปยัง URL ภาษาท้องถิ่นที่เหมาะสม (เช่น ผู้ใช้จากญี่ปุ่นให้ Redirect ไป `/ja/`) ฟังก์ชันนี้ต้องการ Latency ที่ต่ำที่สุดในระดับเสี้ยววินาที มีความถี่คำขอนับล้านครั้งต่อวินาที และต้องการต้นทุนที่ประหยัดที่สุด ควรเลือกเทคโนโลยีใด?
- ก) AWS Lambda ฟังก์ชันมาตรฐานในภูมิภาค us-east-1
- ข) Lambda@Edge โดยผูกเข้ากับ Origin Request Event
- ค) CloudFront Functions โดยผูกเข้ากับ Viewer Request Event
- ง) ติดตั้ง Nginx Reverse Proxy บน EC2 Instance เพื่อดักจับคำขอ
- **เฉลย:** **ค) CloudFront Functions โดยผูกเข้ากับ Viewer Request Event**
- **จุดหลอก (Exam Trap):** แม้ Lambda@Edge (ข้อ ข) จะทำได้ แต่มีต้นทุนสูงกว่าและ Latency สูงกว่า CloudFront Functions ซึ่งออกแบบมาเพื่อการจัดการ Header และ URL Redirect โดยเฉพาะ
- **เหตุผลทางเทคนิค:** ตามเกณฑ์ในสไลด์หน้า 43 CloudFront Functions ทำงานที่ Edge Location ใกล้ผู้ใช้ที่สุด มีระยะเวลาการรันระดับ Sub-millisecond รันด้วยภาษา JavaScript และคิดค่าบริการถูกกว่า Lambda@Edge อย่างมีนัยสำคัญ

### ข้อที่ 4: การแก้ปัญหาผู้ใช้ได้รับข้อมูลส่วนตัวของผู้อื่นจากการแคชของ CloudFront
**สถานการณ์:** แอปพลิเคชันรายงานข้อมูลสุขภาพแสดงผลกราฟสถิติตามพารามิเตอร์ของผู้ใช้ เช่น `https://health.example.com/dashboard?patient_id=101` แต่เมื่อผู้ป่วยรหัส `102` เข้าใช้งาน กลับมองเห็นกราฟของผู้ป่วยรหัส `101` อย่างไม่ถูกต้อง การตั้งค่าใดบน CloudFront ที่เป็นสาเหตุของปัญหานี้ และต้องแก้ไขอย่างไร?
- ก) Origin ส่งค่า HTTP Header `Cache-Control: no-cache` กลับมา ให้ลบ Header นี้ทิ้ง
- ข) CloudFront Cache Key ดีฟอลต์ไม่ได้รวม Query Strings เข้ามาคิดคำนวณ ให้สร้าง Cache Policy ที่ระบุให้รวม Query Strings ทั้งหมดใน Cache Key
- ค) CloudFront เกิดข้อผิดพลาดในการเชื่อมต่อ ให้เปลี่ยนไปใช้ Regional Endpoint
- ง) ผู้ใช้เปิดเบราว์เซอร์พร้อมกันหลายคน ให้เปิดใช้งาน AWS WAF เพื่อบล็อกคำขอซ้ำ
- **เฉลย:** **ข) CloudFront Cache Key ดีฟอลต์ไม่ได้รวม Query Strings เข้ามาคิดคำนวณ ให้สร้าง Cache Policy ที่ระบุให้รวม Query Strings ทั้งหมดใน Cache Key**
- **จุดหลอก (Exam Trap):** หลายคนคิดว่า CloudFront จะแยก URL ตาม Query String ให้เองตามธรรมชาติเหมือนเว็บเซิร์ฟเวอร์ทั่วไป
- **เหตุผลทางเทคนิค:** ตามสไลด์หน้า 34 CloudFront ใช้เพียง Domain Name + URL Path เป็น Cache Key โดยละเลย Query Strings ทำให้คำขอที่มี Path เดียวกันได้ไฟล์แคชอันเดิมเสมอ การใส่ Query Strings ลงใน Cache Key จึงเป็นทางแก้ที่ถูกต้อง

### ข้อที่ 5: การประมวลผลปรับขนาดรูปภาพตามขนาดหน้าจออุปกรณ์ด้วย Edge Compute
**สถานการณ์:** เว็บไซต์อีคอมเมิร์ซต้องการปรับขนาดรูปภาพสินค้า (Image Resizing) แบบ Dynamic ตามขนาดหน้าจอของอุปกรณ์ที่ร้องขอ โดยฟังก์ชันจะต้องอ่านไฟล์รูปภาพต้นฉบับจาก S3 นำมาบีบอัดขนาดผ่านไลบรารี Sharp/PIL และส่งคืนภาพใหม่กลับไป เทคโนโลยีใดสามารถรองรับการทำงานนี้ได้?
- ก) CloudFront Functions ผูกกับ Viewer Request
- ข) CloudFront Functions ผูกกับ Origin Response
- ค) Lambda@Edge ผูกกับ Origin Response
- ง) CloudFront Cache Policy กำหนดค่า TTL เป็น 0
- **เฉลย:** **ค) Lambda@Edge ผูกกับ Origin Response**
- **จุดหลอก (Exam Trap):** CloudFront Functions (ข้อ ก และ ข) มีลิมิต RAM แค่ 2 MB, รันได้เฉพาะ JS สั้นๆ ไม่มี Network Access และไม่รองรับ Origin Response จึงไม่สามารถโหลดรูปมา Resize ได้
- **เหตุผลทางเทคนิค:** งานประมวลผลขนาดใหญ่ที่ต้องแตะต้อง Response Body, ใช้ RAM สูง และเรียกใช้ไลบรารีภายนอก จำเป็นต้องใช้ **Lambda@Edge** โดยผูกไว้ที่จังหวะ **Origin Response** เพื่อดักรูปต้นฉบับจาก S3 มาปรับขนาดก่อนส่งเข้าแคชของ CloudFront
