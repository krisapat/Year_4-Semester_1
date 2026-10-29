# 📌 สรุปเนื้อหา: AWS Academy Cloud Developing - Module 8: Introducing Containers and Container Services (Docker, ECS, Fargate & Elastic Beanstalk)

> เอกสารสรุปเนื้อหาบทเรียนและการวิเคราะห์จุดหลอกข้อสอบฉบับสมบูรณ์ (100% Comprehensive & Zero Content Loss)
> อ้างอิงจากสไลด์ต้นฉบับ 77 หน้า พร้อมถอดความโครงสร้าง Dockerfile, ECS Fargate vs EC2, และนโยบาย Deployment ครบถ้วน

---

## 1. วิวัฒนาการของโมเดลการดีพลอย (Evolution of Deployment Models)

เปรียบเทียบสถาปัตยกรรม 3 รูปแบบ (จากสไลด์หน้า 10-12):

| มิติ | Bare-Metal Servers | Virtual Machines (VMs) | Containers (Docker) |
| :--- | :--- | :--- | :--- |
| **โครงสร้างพื้นฐาน** | ติดตั้งแอปบนฮาร์ดแวร์จริงโดยตรง | ฮาร์ดแวร์ -> Host OS -> Hypervisor -> **Guest OS แยกแต่ละตัว** | ฮาร์ดแวร์ -> Host OS -> **Container Engine (แชร์ Kernel เดียวกัน)** |
| **การแยกระบบ (Isolation)** | ไม่แยก แอปแย่งทรัพยากรกัน | แยกระดับฮาร์ดแวร์และ OS สมบูรณ์ | **แยกระดับ Process และ User Space** |
| **ขนาดและความเร็ว** | ขนาดใหญ่มาก บูตหลักนาทีถึงชั่วโมง | ขนาดใหญ่ (หลัก GBs เพราะมี OS เต็ม) บูตหลักนาที | **เบามาก (หลัก MBs) บูตเร็วในระดับมิลลิวินาที/วินาที** |
| **การใช้ทรัพยากร** | สิ้นเปลืองที่สุด | ปานกลาง มี Overhead จาก Guest OS ทุกตัว | **คุ้มค่าสูงสุด (High Resource Utilization)** |
| **ความเข้ากันได้** | ติดปัญหา Environment บนเครื่องต่างกัน | ปัญหา Environment น้อยลง | **พกพาง่ายสูงสุด (Write once, run anywhere)** |

---

## 2. องค์ประกอบของ Docker และคำสั่ง CLI ที่สำคัญ (Docker Fundamentals)

### 2.1 องค์ประกอบหลัก 5 ส่วน (Docker Components)
1. **Dockerfile:** ไฟล์ข้อความธรรมดาที่ระบุชุดคำสั่งทีละบรรทัดเพื่อสร้าง Container Image
2. **Container Image:** แม่แบบแบบอ่านอย่างเดียว (**Read-Only Template**) ประกอบขึ้นจาก Image Layers ที่ซ้อนทับกัน
3. **Container Layer (Thin Writable Layer):** เลเยอร์บางๆ ด้านบนสุดที่เขียนได้ (Read/Write) ถูกสร้างขึ้นเมื่อรันคอนเทนเนอร์ เพื่อเก็บไฟล์ชั่วคราวและการเปลี่ยนแปลงขณะทำงาน
4. **Container:** อินสแตนซ์ที่กำลังทำงานจริง (Runnable Instance) ของ Image
5. **Container Registry:** คลังจัดเก็บ Image เช่น Docker Hub หรือ **Amazon ECR**

### 2.2 โครงสร้างและคำสั่งสำคัญใน Dockerfile (หน้า 18-21)
```dockerfile
# 1. Base Image ที่นำมาเป็นฐาน
FROM centos:7

# 2. ติดตั้งแพ็กเกจและอัปเดตระบบปฏิบัติการ (สร้าง Layer ใหม่)
RUN yum -y update && yum -y install httpd

# 3. เปิดพอร์ตที่แอปพลิเคชันจะเปิดรับการเชื่อมต่อ
EXPOSE 80

# 4. ก็อปปี้ไฟล์สคริปต์จากโฮสต์เข้าไปใน Image และให้สิทธิ์ Execute
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# 5. คำสั่งเริ่มต้นที่จะรันเมื่อคอนเทนเนอร์ถูกสตาร์ต
CMD ["/run-httpd.sh"]
```

### 2.3 ขั้นตอนการ Push Image ขึ้นสู่ Amazon ECR (สไลด์หน้า 45 - ออกสอบทุกรอบ)
1. **สร้าง ECR Repository:**
   ```bash
   aws ecr create-repository --repository-name hello-world --region us-east-1
   ```
2. **Build และติด Tag ให้ตรงกับ ECR Registry URI:**
   ```bash
   docker build -t hello-world .
   docker tag hello-world:latest 123456789012.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest
   ```
3. **ล็อกอินเข้าสู่ Amazon ECR ผ่าน Docker CLI:**
   ```bash
   aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com
   ```
4. **Push Image ขึ้น ECR:**
   ```bash
   docker push 123456789012.dkr.ecr.us-east-1.amazonaws.com/hello-world:latest
   ```

---

## 3. บริการจัดการคอนเทนเนอร์บน AWS (Amazon ECS & EKS)

### 3.1 องค์ประกอบเชิงสถาปัตยกรรมของ Amazon ECS
- **Task Definition:** พิมพ์เขียวไฟล์ JSON ระบุว่าคอนเทนเนอร์ต้องใช้ Image ใด, กำหนด CPU/RAM เท่าไร, แมปพอร์ตอย่างไร, ใช้ IAM Role ใด และกำหนด Environment Variables อะไรบ้าง
- **Task:** อินสแตนซ์คอนเทนเนอร์เดี่ยวที่กำลังรันจริงตาม Task Definition
- **Service:** ตัวควบคุมที่คอยดูแลให้มี Task รันอยู่ตามจำนวนที่กำหนด (**Desired Count**) สเกลขึ้น-ลง และเชื่อมต่อเข้ากับ Application Load Balancer (ALB) อัตโนมัติ
- **Cluster:** ขอบเขตเชิงตรรกะ (Logical Grouping) ที่รวม Tasks และ Services เข้าด้วยกัน

---

## 4. เปรียบเทียบ Launch Types: AWS Fargate vs Amazon EC2

สไลด์หน้า 44 ถือเป็นหัวใจสำคัญของการเลือกใช้งานในข้อสอบ:

| หัวข้อ | AWS Fargate (Serverless Launch Type) | Amazon EC2 Launch Type |
| :--- | :--- | :--- |
| **การจัดการโครงสร้างพื้นฐาน** | **ไม่ต้องจัดการเซิร์ฟเวอร์ใดๆ (Serverless)** AWS ดูแล VM, Host OS และ Docker Engine ให้ 100% | **ผู้ใช้ต้องดูแลเซิร์ฟเวอร์ EC2 เอง** รวมถึงการแพตช์ Host OS, จัดการ Cluster และตั้งขนาด Instance |
| **สิ่งที่คุณต้องดูแล** | เฉพาะไฟล์ Image คอนเทนเนอร์ และการคอนฟิก Task Definition | ดูแลทั้งเครื่อง EC2, Docker Daemon, และคอนเทนเนอร์ |
| **เกณฑ์การเลือกใช้ที่เหมาะสม (Criteria)** | - ระบบที่มีทราฟฟิก **ผันผวนขึ้นลงรุนแรง (Wide swings in demand)**<br>- เวิร์กโหลดขนาดใหญ่ที่ต้องการ **ลด Overhead ในการบริหารจัดการ**<br>- สภาพแวดล้อมทดสอบขนาดเล็ก (Small test environments)<br>- งานประมวลผลแบบแบตช์ตามรอบเวลา (**Batch workloads on a schedule**) | - เวิร์กโหลดที่มี **ความต้องการทรัพยากรคงที่ คาดเดาได้ชัดเจน**<br>- ต้องการประหยัดต้นทุนด้วย **Reserved Instances หรือ Savings Plans**<br>- องค์กรที่มีข้อกำหนด **Security Compliance ที่ต้องคุมระดับ Kernel/OS เอง**<br>- มีเครื่อง EC2 Capacity เหลืออยู่แล้วในระบบ |

---

## 5. การปรับใช้คอนเทนเนอร์ด้วย AWS Elastic Beanstalk

- **AWS Elastic Beanstalk:** แพลตฟอร์มแบบ Platform-as-a-Service (PaaS) สำหรับนักพัฒนาที่ต้องการนำเว็บแอปพลิเคชันหรือคอนเทนเนอร์ Docker ขึ้นสู่ออนไลน์อย่างรวดเร็ว โดยระบบจะจัดการ Capacity Provisioning, Load Balancing, Auto Scaling, และ Health Monitoring ให้อัตโนมัติ
- **Multicontainer Docker Platform:** ใช้ไฟล์ **`Dockerrun.aws.json`** ในการระบุรายละเอียดคอนเทนเนอร์หลายตัว โดย Beanstalk จะไปสร้างและสั่งงาน Amazon ECS ให้เบื้องหลังโดยที่นักพัฒนาไม่ต้องปวดหัวกับการคอนฟิก ECS เอง

### 5.2 สิทธิ์ IAM ใน Elastic Beanstalk (สไลด์หน้า 52)
1. **Service Role (`aws-elasticbeanstalk-service-role`):** มอบสิทธิ์ให้ตัวบริการ Elastic Beanstalk ไปสั่งสร้างและจัดการบริการอื่นๆ ของ AWS แทนตัวเรา
2. **Instance Profile (`aws-elasticbeanstalk-ec2-role`):** ผูกติดกับ EC2 Instances ที่ถูกเปิดขึ้นมาใน Environment เพื่อให้เครื่องนั้นดึงไฟล์จาก S3 และส่ง Log เข้า CloudWatch ได้

---

## 6. นโยบายการดีพลอยบน Elastic Beanstalk (Deployment Policies Spectrum)

สไลด์หน้า 57-58 และ 61 นำเสนอแกนเปรียบเทียบระหว่าง **ความเร็ว (Faster)** กับ **การควบคุมและความปลอดภัย (More Control)**:

```text
[เร็วสุด / Downtime] ───────────────────────────────────────────> [ช้าสุด / ปลอดภัยสุด]
   All at once   ──>   Rolling   ──>   Rolling with batch   ──>   Immutable   ──>   Traffic splitting
```

| นโยบายการดีพลอย | การทำงาน | ข้อดี | ข้อเสีย / ผลกระทบ |
| :--- | :--- | :--- | :--- |
| **1. All at once** | ดีพลอยโค้ดเวอร์ชันใหม่ลงในเครื่องทุกเครื่องพร้อมกันในทันที | **เร็วที่สุด** ไม่เสียเวลาแบ่งรอบ | **เกิด Downtime ชั่วขณะ** และหากโค้ดพังระบบจะดับทั้งระบบ |
| **2. Rolling** | แบ่งเครื่องออกเป็น Batch (เช่น ทีละ 20%) แล้วทยอยอัปเดตทีละชุด | ไม่เกิด Full Downtime | **ลดทอนความสามารถในการรับโหลด (Reduced Capacity)** เพราะเครื่องที่กำลังอัปเดตจะหยุดรับงาน |
| **3. Rolling with additional batch** | เปิดเครื่องใหม่เพิ่มขึ้นมา 1 ชุดก่อนเริ่มอัปเดต แล้วค่อยทยอยอัปเดตเครื่องเดิมทีละชุด | ไม่เกิด Downtime และ **คงความสามารถรับโหลดได้ 100% ตลอดเวลา** | ใช้เวลาดีพลอยนานกว่า Rolling ปกติเล็กน้อย และมีค่าใช้จ่ายเครื่องชั่วคราว |
| **4. Immutable** | สร้าง Auto Scaling Group ใหม่คู่ขนานขึ้นมา ดีพลอยโค้ดลงเครื่องใหม่ที่สะอาด 100% ผ่าน Health Check แล้วจึงสลับทราฟฟิกและลบชุดเก่าทิ้ง | ปลอดภัยมาก ไร้ปัญหา Environment ตกค้าง, **Rollback ปลอดภัยและรวดเร็วทันที** | ใช้เวลานานขึ้น และต้องใช้ทรัพยากรเครื่องเพิ่มขึ้นเป็น 2 เท่าชั่วคราว |
| **5. Traffic splitting (Canary)** | เปิดเครื่องชุดใหม่ทั้งชุด แล้วแบ่งทราฟฟิกจริงเพียงบางส่วน (เช่น 15% นาน 10 นาที) วิ่งไปทดสอบ หากผ่านจึงสลับทราฟฟิก 100% | **ควบคุมความปลอดภัยสูงสุด (Canary Testing)** จำกัดผลกระทบต่อผู้ใช้งานหากมีบั๊ก | **ใช้เวลานานที่สุด** และต้องจ่ายค่าเครื่องชุดใหม่เต็มพิกัดช่วงทดสอบ |
| **6. Blue/Green Deployment** | สร้าง Environment ใหม่ (Green) แยกต่างหาก ทดสอบจนมั่นใจ แล้วกด **`Swap Environment URLs`** (สลับ DNS CNAME ผ่าน Route 53) | **Zero Downtime**, ทดสอบระบบจริงได้ก่อนเปิด และ **Instant Rollback เพียงกด Swap กลับ** | ต้องบริหารจัดการ 2 สภาพแวดล้อมพร้อมกัน |

---

## 7. ⚠️ จุดหลอกและข้อควรระวังในห้องสอบ (Exam Traps & Pitfalls)

1. ❌ **หลอกเรื่องความเชี่ยวชาญต่ำแต่ต้องการรันคอนเทนเนอร์:** โจทย์ถามว่าทีมงานไม่มีประสบการณ์เรื่อง AWS หรือ Containers เลย แต่อยากเริ่มต้นย้ายเว็บแอปพลิเคชันไปรันบน Docker และทดลองอย่างรวดเร็วที่สุด ควรเลือกบริการใด?
   - ✅ **ที่ถูกต้อง:** **ใช้ AWS Elastic Beanstalk (Multicontainer Docker)** เพราะ Beanstalk ดูแลโครงสร้าง ECS และ Network ให้หมด ไม่ต้องเริ่มสร้าง Cluster หรือ Task Definition เองจากศูนย์ (ตอบ ECS หรือติดตั้ง Docker บน EC2 เองจะผิดเพราะต้องใช้ความเชี่ยวชาญสูง)
2. ❌ **หลอกเรื่องการเลือก Fargate vs EC2:** โจทย์ถามว่ามีระบบคำนวณเงินเดือนที่ทำงานเป็นรอบทุกสิ้นเดือน (Batch workload on a schedule) หรือมีทราฟฟิกที่ไม่แน่นอนผันผวนหนัก ต้องการประหยัดแรงดูแลระบบ ควรเลือก Launch Type ใด?
   - ✅ **ที่ถูกต้อง:** **เลือก AWS Fargate** เพราะไม่ต้องเปิดเครื่อง EC2 ทิ้งไว้ให้เสียเงิน และไม่ต้องมาคอยบริหารจัดการแพตช์ OS
3. ❌ **หลอกเรื่อง Rolling Deployment ที่ห้ามเสีย Capacity:** โจทย์ระบุว่าห้ามเกิด Downtime และ **ห้ามให้ประสิทธิภาพการรับโหลดของระบบลดลงเด็ดขาด (Maintain 100% Capacity at all times)** ควรเลือกนโยบายใดของ Elastic Beanstalk?
   - ✅ **ที่ถูกต้อง:** ต้องเลือก **Rolling with additional batch** (เพราะ Rolling ธรรมดาจะดึงเครื่องออกไประหว่างอัปเดต ทำให้ Capacity ลดลง)
4. ❌ **หลอกเรื่องขั้นตอนการ Push Image ขึ้น ECR:** โจทย์ถามว่าสั่ง `docker push` ไปยัง ECR แล้วติด Error `no basic auth credentials` ทั้งๆ ที่เครื่องมีสิทธิ์ IAM แล้ว ขาดขั้นตอนใด?
   - ✅ **ที่ถูกต้อง:** ขาดขั้นตอนการเรียกคำสั่ง **`aws ecr get-login-password | docker login`** เพื่อยืนยันตัวตนกับ Docker Daemon
5. ❌ **หลอกเรื่องสิทธิ์ของคอนเทนเนอร์บน ECS:** โจทย์ถามว่าคอนเทนเนอร์ที่รันบน ECS ต้องการเข้าถึงตาราง DynamoDB ควรแนบ IAM Policy ให้กับใคร?
   - ✅ **ที่ถูกต้อง:** ต้องแนบให้กับ **ECS Task Role** (กำหนดสิทธิ์ให้แอปในคอนเทนเนอร์) ไม่ใช่ *Task Execution Role* (ซึ่งมีไว้ให้ ECS Agent ไปดึงรูปจาก ECR และส่ง Log ไป CloudWatch)

---

## 8. 📝 คลังข้อสอบจำลองสถานการณ์จริง (Scenario-Based Exam Simulation)

### ข้อที่ 1: การเริ่มต้นใช้งานคอนเทนเนอร์สำหรับทีมที่ไม่มีประสบการณ์ (AWS Academy Slide 73-75)
**สถานการณ์:** สถาปนิกคลาวด์ต้องการย้ายเว็บแอปพลิเคชันของบริษัทไปสู่ระบบคอนเทนเนอร์ สมาชิกในทีมพัฒนายังไม่มีความเชี่ยวชาญด้าน AWS และไม่มีประสบการณ์ในการดูแลคอนเทนเนอร์มาก่อน แต่ต้องการเริ่มต้นใช้งานอย่างรวดเร็วและสามารถทดลองระบบได้ทันที สถาปัตยกรรมใดเหมาะสมที่สุด?
- ก) ใช้ AWS Elastic Beanstalk เพื่อเปิดใช้งาน Multicontainer Docker Environment
- ข) ใช้ Amazon ECR เพื่อจัดเก็บ Docker Images ที่ทีมงานสร้างขึ้นเองจากศูนย์
- ค) สร้าง EC2 Instances ร่วมกับ Auto Scaling แล้วเขียนสคริปต์ติดตั้ง Docker บนทุกเครื่อง
- ง) สร้างคลัสเตอร์ Amazon ECS ขึ้นมาและบริหารจัดการเครื่อง EC2 Instances ภายในคลัสเตอร์เอง
- **เฉลย:** **ก) ใช้ AWS Elastic Beanstalk เพื่อเปิดใช้งาน Multicontainer Docker Environment**
- **จุดหลอก (Exam Trap):** การใช้ ECS หรือการติดตั้ง Docker บน EC2 เอง (ข้อ ค และ ง) จำเป็นต้องมีความรู้เชิงลึกเรื่องการคอนฟิกเน็ตเวิร์ก VPC, Task Definitions และ Cluster Scaling
- **เหตุผลทางเทคนิค:** Elastic Beanstalk ช่วยลดความซับซ้อนทั้งหมด โดยเตรียมระบบ Load Balancer, Auto Scaling, และ Container Runtime ให้พร้อมใช้งาน เพียงแค่ส่งไฟล์โค้ดและ `Dockerrun.aws.json` ขึ้นไป ระบบก็เริ่มทำงานได้ทันที

### ข้อที่ 2: การเลือก Launch Type สำหรับงานประมวลผลเป็นรอบเวลาที่มีการแกว่งของทราฟฟิกสูง
**สถานการณ์:** บริษัทด้านการเงินมีเวิร์กโหลดประมวลผลข้อมูลธุรกรรมที่จะทำงานทุกคืนวันศุกร์ โดยปริมาณข้อมูลจะพุ่งสูงขึ้นอย่างรวดเร็วเป็นเวลา 3 ชั่วโมง จากนั้นระบบจะว่างเปล่าตลอดทั้งสัปดาห์ ทีมวิศวกรต้องการสถาปัตยกรรมที่ช่วยลดภาระการดูแลระบบ (Low Operational Overhead) และจ่ายเงินเฉพาะเวลาที่รันจริง ควรเลือกใช้บริการใดบน Amazon ECS?
- ก) Amazon ECS ร่วมกับ EC2 Reserved Instances
- ข) Amazon ECS ร่วมกับ AWS Fargate Launch Type
- ค) ติดตั้ง Kubernetes บน EC2 Dedicated Hosts
- ง) รัน Docker Containers บนเครื่องเซิร์ฟเวอร์ On-premises
- **เฉลย:** **ข) Amazon ECS ร่วมกับ AWS Fargate Launch Type**
- **จุดหลอก (Exam Trap):** การใช้ EC2 Reserved Instances (ข้อ ก) จะทำให้ต้องจ่ายเงินค่าเครื่องตลอด 24/7 แม้ในวันที่ไม่มีงานประมวลผล
- **เหตุผลทางเทคนิค:** ตามเกณฑ์ในสไลด์หน้า 44 AWS Fargate ออกแบบมาเพื่อเวิร์กโหลดที่มีความผันผวนสูง (Wide swings in demand) และงานประมวลผลแบบแบตช์ตามรอบเวลา โดยระบบจะเปิดและคิดเงินตามเวลาที่คอนเทนเนอร์ทำงานจริงเท่านั้น และไม่ต้องเสียเวลาแพตช์ OS

### ข้อที่ 3: การดีพลอยระบบโดยคงขีดความสามารถการรับโหลดไว้ 100% ตลอดเวลา
**สถานการณ์:** แอปพลิเคชันจำหน่ายตั๋วคอนเสิร์ตทำงานอยู่บน AWS Elastic Beanstalk โดยมีเครื่อง EC2 รองรับโหลดอยู่ 10 เครื่อง ในช่วงเวลาที่มีการเปิดจองบัตร ทีมพัฒนาจำเป็นต้องปล่อยแพตช์แก้ไขด่วน โดยมีข้อกำหนดว่า **ระบบจะต้องไม่หยุดทำงาน (Zero Downtime) และต้องคงขีดความสามารถในการรองรับโหลดไว้ไม่น้อยกว่า 10 เครื่องตลอดกระบวนการดีพลอย** ควรเลือกนโยบายการดีพลอยใด?
- ก) All at once
- ข) Rolling
- ค) Rolling with additional batch
- ง) Immutable
- **เฉลย:** **ค) Rolling with additional batch**
- **จุดหลอก (Exam Trap):** การเลือก Rolling ธรรมดา (ข้อ ข) จะทำให้เครื่องที่กำลังถูกอัปเดตหยุดทำงาน ทำให้มีเครื่องรับโหลดเหลือเพียง 8 หรือ 9 เครื่อง ซึ่งขัดแย้งกับข้อกำหนด
- **เหตุผลทางเทคนิค:** Rolling with additional batch (สไลด์หน้า 57) จะทำการเปิดเครื่องชุดใหม่ขึ้นมาล่วงหน้าก่อน 1 ชุด เพื่อชดเชยเครื่องที่จะถูกดึงออกไปอัปเดต ทำให้ระบบคงขีดความสามารถในการรองรับทราฟฟิกได้เต็ม 100% ตลอดการปล่อยเวอร์ชันใหม่

### ข้อที่ 4: การปล่อยเวอร์ชันใหม่และการ Rollback ที่ปลอดภัยสูงสุดผ่าน DNS
**สถานการณ์:** องค์กรต้องการอัปเกรดระบบหลักที่รันอยู่บน AWS Elastic Beanstalk ไปสู่เวอร์ชันใหม่ โดยต้องการให้ทีม QA เข้าไปทดสอบบนระบบโปรดักชันจริงก่อนเปิดให้ลูกค้าเข้าใช้งาน และหากพบปัญหาหลังเปิดใช้งาน จะต้องสามารถย้อนกลับ (Rollback) สู่เวอร์ชันเดิมได้ทันทีในระดับวินาทีโดยไม่กระทบต่อผู้ใช้ สถาปัตยกรรมใดตอบโจทย์นี้?
- ก) ใช้ All at once deployment แล้วเตรียมสคริปต์ดีพลอยเวอร์ชันเก่าสำรองไว้
- ข) ทำ Blue/Green Deployment โดยสร้าง Environment ใหม่ขึ้นมาทดสอบ แล้วใช้คำสั่ง Swap Environment URLs
- ค) แก้ไข Dockerfile ในเครื่องเดิมแล้วสั่ง Restart App Server
- ง) ใช้ Traffic Splitting โดยตั้ง NewVersionPercent เป็น 100% ตั้งแต่นาทีแรก
- **เฉลย:** **ข) ทำ Blue/Green Deployment โดยสร้าง Environment ใหม่ขึ้นมาทดสอบ แล้วใช้คำสั่ง Swap Environment URLs**
- **จุดหลอก (Exam Trap):** ข้อ ก และ ค ทำให้เกิด Downtime และการ Rollback ต้องใช้เวลาดีพลอยใหม่ทั้งหมด ส่วนข้อ ง ไม่เปิดโอกาสให้ QA ทดสอบระบบแยกส่วน
- **เหตุผลทางเทคนิค:** Blue/Green Deployment บน Elastic Beanstalk (สไลด์หน้า 61) ช่วยให้สามารถสร้าง Environment ใหม่ (Green) แยกเป็นอิสระเพื่อทดสอบได้เต็มที่ เมื่อพร้อมเปิดตัว เพียงกดปุ่ม Swap Environment URLs ระบบจะสลับ DNS CNAME ทันที และหากพังก็เพียงกด Swap กลับมายัง Blue ได้ในเสี้ยววินาที

### ข้อที่ 5: การแก้ปัญหา Authentication ล้มเหลวขณะ Push Docker Image ขึ้น ECR
**สถานการณ์:** นักพัฒนาสร้าง Docker Image บนเครื่องเซิร์ฟเวอร์เสร็จเรียบร้อย และทำการติดแท็ก `123456789012.dkr.ecr.us-east-1.amazonaws.com/my-app:v1` แต่เมื่อสั่ง `docker push` กลับได้รับข้อความแจ้งเตือน `denied: Your authorization token has expired. Reauthenticate and try again.` ทั้งๆ ที่ผู้ใช้รันคำสั่งด้วยสิทธิ์ IAM Administrator วิธีการแก้ไขที่ถูกต้องคืออะไร?
- ก) เพิ่ม IAM Role แนบเข้าไปในเครื่องเซิร์ฟเวอร์โดยตรง
- ข) สั่งรันคำสั่ง `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com`
- ค) ลบโฟลเดอร์ `/root/.docker` ทิ้งแล้วสร้าง Image ใหม่อีกครั้ง
- ง) เปลี่ยนชื่อ ECR Repository ให้เป็น Public Repository
- **เฉลย:** **ข) สั่งรันคำสั่ง `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com`**
- **จุดหลอก (Exam Trap):** หลายคนเข้าใจผิดว่ามี IAM ถูกต้องแล้ว Docker CLI จะคุยกับ ECR ได้เองอัตโนมัติ
- **เหตุผลทางเทคนิค:** Docker Daemon จำเป็นต้องได้รับ Authorization Token ชั่วคราวจาก ECR ซึ่งมีอายุ 12 ชั่วโมง การดึง Token ผ่าน `aws ecr get-login-password` แล้วส่งต่อให้ `docker login` เป็นขั้นตอนบังคับตามมาตรฐาน (สไลด์หน้า 45)
