# AGENT.MD: Project Context & Knowledge Base (Year 4, Semester 1)

> เอกสารสรุปบริบทและสถาปัตยกรรมของโปรเจกต์ สำหรับเอด้า (Ada) หรือ Agent ในการเข้ามารับช่วงต่อและพัฒนาฟีเจอร์ได้อย่างรวดเร็ว

---

## 1. ข้อมูลพื้นฐานของโปรเจกต์ (Project Overview)
- **ตำแหน่งโฟลเดอร์หลัก:** `C:\Users\krisapat\Desktop\Year_4, Semester_1`
- **เป้าหมาย:** ระบบรวมสรุปเนื้อหาบทเรียนและระบบจำลองข้อสอบ 3 วิชาหลักสำหรับปี 4 เทอม 1
- **เทคโนโลยีแกนหลัก:** Standalone Single-file Web Application (`index.html`)
  - Pure CSS (ห้ามใช้ Framework หนักๆ หรือ CDN ภายนอกที่ไม่เสถียร)
  - Dark Theme, Linear & Apple Glassmorphism (`backdrop-filter: blur(16-20px)`, เส้นขอบบาง `rgba(255, 255, 255, 0.08)`)
  - **กฎการออกแบบของเจ้านาย:** ไร้อิโมจิใน UI, ไม่ตีกรอบซ้อนกรอบ (หลีกเลี่ยง Nested Card ซ้อน Card), และปุ่ม Back ต้องอยู่เหนือกล่องเนื้อหาเสมอ

---

## 2. สถานะของแต่ละรายวิชา (Subject Status)

### 1) UX/UI Design (`/UxUi`)
- **รูปแบบข้อสอบ:** ปรนัย (ข้อกา) เน้นข้อสอบวิเคราะห์และ "โจทย์หลอกดักทางความคิด"
- **สถานะปัจจุบัน:** **เสร็จสมบูรณ์ 100% (ทั้ง 6 บทเรียน)**
  - บทที่ 2: Psychology in UX/UI (จิตวิทยาการรับรู้, 12 Dark Patterns, Cognitive Load, 6 Design Laws)
  - บทที่ 3: Problem Statement, User Persona & User Journey Map (5W1H, POV, 4 Pain Points)
  - บทที่ 4: Research Ethics & PDPA (Belmont Report, กลุ่มเปราะบาง, Privacy vs Confidentiality, Consent)
  - บทที่ 5: Usability Test Design (10 Heuristics, NN/g 5-user rule, Think-Aloud, A/B Testing, Unhappy Path)
  - บทที่ 8: Wireframe, Prototype & Visual Hierarchy (Fidelity 3 ระดับ, 12 Prototypes, Visual Hierarchy 9 องค์ประกอบ)
  - บทที่ 9: UX/UI Measurement & Statistics (CSAT, NPS, CES, Real FCR, T-test, ANOVA, Regression)
- **Artifacts ที่สร้างไว้:**
  - ไฟล์ Markdown ดิบพร้อมถอดภาพ: `2_*.md`, `3_*.md`, `4_*.md`, `5_*.md`, `8_*.md`, `9_*.md`
  - ไฟล์สรุปเจาะลึกและคลังข้อสอบ 60 ข้อ: `Summary_2_*.md` ถึง `Summary_9_*.md`
  - ฝังเข้าสู่ `index.html` พร้อมระบบตรวจคำตอบ วิเคราะห์จุดหลอก และนับคะแนนเรียลไทม์แล้ว

### 2) Selected Topic in IoT System and Information Engineering (`/Selected_Topic`)
- **รูปแบบข้อสอบ:** อัตนัย (ข้อเขียนเชิงวิเคราะห์และคำนวณ)
- **สถานะปัจจุบัน:** **แปลงไฟล์ PDF เป็น Markdown ครบทั้ง 8 ชุด (385 หน้า) 100%**
  - `L1_IoT_169.md` (37 หน้า) - ภาพรวม IoT และการออกแบบระบบ RFID
  - `L2_IoT_169.md` (64 หน้า) - กระบวนการออกแบบ 10 ขั้นตอน และ Smart Farming พืช/สัตว์น้ำ/ปศุสัตว์
  - `L3_IoT_169.md` (44 หน้า) - M2M Architecture และ Digital Twins 4 ระดับ
  - `L4_IoT_169_ATM_MPLS.md` (67 หน้า) - เซลล์ ATM 53 ไบต์, UNI/NNI Headers, MPLS 32 บิต (Push/Swap/Pop)
  - `L5_WiFi_in_Practice.md` (37 หน้า) - กราฟ RSSI/SNR/Noise Floor, ช่องสัญญาณ 2.4 GHz และการรวมช่อง 5 GHz
  - `L6_IoT_169_SONET.md` (59 หน้า) - เฟรม STS-1 810 ไบต์ (125 µs), Overheads, Virtual Tributaries, UPSR/BLSR Ring
  - `L7_WDM_DWDM_MUX_169.md` (77 หน้า) - Wavelength vs Frequency, CWDM 20 nm, DWDM Grid, Optical Bands O/E/S/C/L/U
  - `L8-9_Optical_Net_Design_269.md` (33 หน้า) - **[จุดเก็งข้อสอบหลัก]** Span Design 120 km และ PON Link Budget
- **งานถัดไปที่ต้องทำ (Next Action):**
  - สรุปวิธีทำข้อสอบข้อเขียนและวิธีตรวจสอบการออกแบบระบบไฟเบอร์ของ L8-9 หน้า 9-13 (3 ขีดจำกัด: Attenuation, Dispersion, OSNR)
  - จัดทำเฉลยแสดงวิธีทำทีละบรรทัด (Step-by-Step Derivation), ตารางแจกแจงตัวแปร และคีย์เวิร์ดบังคับ
  - สร้างโหมดข้อเขียนใน `index.html` สำหรับ Selected Topic

### 3) DevOps (`/DevOps`)
- **สถานะปัจจุบัน:** รอดาวน์โหลดไฟล์สไลด์เข้ามาในโฟลเดอร์ `DevOps/`
- **สล็อตในหน้าเว็บ:** ทำปุ่มแท็บสแตนด์บายไว้แล้ว เมื่อได้ไฟล์มาให้แปลงเป็น Markdown -> สรุปเนื้อหา -> นำเข้า `index.html`

---

## 3. สถาปัตยกรรมไฟล์ภายในโปรเจกต์ (File Tree)
```text
C:\Users\krisapat\Desktop\Year_4, Semester_1\
├── index.html                                 # Standalone Portal (สรุปเนื้อหา + ระบบสอบ)
├── agent.md                                   # เอกสารบริบทและสถาปัตยกรรมระบบ (ไฟล์นี้)
├── DevOps\                                    # โฟลเดอร์วิชา DevOps (รอไฟล์)
├── Selected_Topic\                            # โฟลเดอร์วิชา Selected Topic (PDF + MD รวม 8 ชุด)
│   ├── L1_IoT_169.md ... L7_WDM_DWDM_MUX_169.md
│   └── L8-9_Optical_Net_Design_269.md
└── UxUi\                                      # โฟลเดอร์วิชา UX/UI (PDF + MD + Summaries)
    ├── 2_Psychology_in_UX_UI.md ... 9_UX_UI_measurement.md
    ├── Summary_2_Psychology_in_UX_UI.md
    ├── Summary_3_User_Journey_Persona_Problem_statement.md
    ├── Summary_4_Ethics.md
    ├── Summary_5_Usability_Test_Design_ST.md
    ├── Summary_8_Wireframe_st.md
    └── Summary_9_UX_UI_measurement.md
```

---

## 4. แนวทางการพัฒนาและข้อควรระวังสำหรับ Agent
1. **การรักษาความสมบูรณ์ของ Single-File (`index.html`):** เมื่อมีการอัปเดตสรุปหรือเพิ่มข้อสอบของ Selected Topic หรือ DevOps ให้แก้ไขหรือรันสคริปต์ประกอบไฟล์ลงใน `index.html` ให้จบในไฟล์เดียว เพื่อให้ผู้ใช้เปิดไฟล์ดูได้สะดวกโดยไม่ต้องติดตั้งสภาพแวดล้อมเซิร์ฟเวอร์
2. **ห้ามลดทอนคุณภาพการถอดความหมายของรูปภาพ:** เอกสารทุกชุดได้รับการถอดความหมายของชาร์ต ตาราง และสูตรด้วย Vision Model กำกับไว้ในไฟล์ `.md` แล้ว เมื่อสรุปเนื้อหาให้ใช้ข้อมูลเสริมเหล่านั้นเป็นแกนหลักในการอ้างอิงเสมอ
3. **การคุมโทน UI:** ดำรงรักษาความเรียบง่าย สุขุม ไร้อิโมจิ คอนทราสต์อ่านง่ายตามข้อกำหนดของเจ้านายเสมอ
