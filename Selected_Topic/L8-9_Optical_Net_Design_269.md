# เอกสารการบรรยาย: L8-9 Optical Net Design 269 - Link Budget Design & FTTx PON

> ไฟล์ต้นฉบับ: `L8-9 Optical Net Design 269.pdf` | จำนวนหน้าทั้งหมด: 33 หน้า

> ผู้บรรยาย: รศ.ดร.ชวลิต เบญจางคประเสริฐ

---

## Slide Page 1

Optical Networking
(Link Budget Design)
รศ.ดร.ชวลิต เบญจางคประเสริฐ


---

## Slide Page 2

Optical Power Budget
* BER is a key objective of the optical system design.
* Goal is to get from Tx to Rx with a BER < BER threshold    
   of the Rx.
* BER thresholds are on data sheets.
* Typical minimum acceptable rate is 10-12
The Optical Power Budget is : 
Optical Power Budget = Power Sent –Receiver Sensitivity
2


---

## Slide Page 3

Terminology—Fiber Impairments
• Attenuation = Loss of power in dB/km.
• Chromatic Dispersion = Spread of light pulse in 
ps/nm-km.
• Optical Signal-to-Noise Ratio (OSNR) = Ratio of 
optical signal power to noise power for the receiver.
3


---

## Slide Page 4

4

### รายละเอียดชนิดของเส้นใยแก้วนำแสง Single-Mode (Types of Single-Mode Fiber)
1. **SMF (Standard Single-Mode Fiber - ITU-T G.652):**
   - ออกแบบให้จุดกระจายแสงเป็นศูนย์ (Zero Chromatic Dispersion) ที่ความยาวคลื่น **1310 nm**
   - เป็นสายที่มีการติดตั้งใช้งานแพร่หลายที่สุดในโลกตั้งแต่ปี 1986 และมีราคาถูกที่สุด
2. **DSF (Dispersion Shifted Fiber - ITU-T G.653):**
   - ออกแบบย้ายจุด Zero Dispersion ไปอยู่ที่ **1550 nm** ซึ่งเป็นย่านที่มีค่าการสูญเสียกำลังแสงต่ำที่สุด (~0.2 dB/km)
   - เหมาะสำหรับการส่งแบบ Single-Channel ความเร็วสูง แต่ไม่เหมาะกับระบบ WDM เนื่องจากเกิดผลกระทบไม่เชิงเส้น Four-Wave Mixing (FWM) อย่างรุนแรง
3. **NZDSF (Non-Zero Dispersion Shifted Fiber - ITU-T G.655):**
   - พัฒนาขึ้นในช่วงกลางทศวรรษ 1990 ออกแบบให้มีค่าการกระจายแสงเล็กน้อยแต่ไม่เป็นศูนย์ (Non-Zero Dispersion) ตลอดช่วงย่าน 1550 nm (C และ L Bands) เพื่อขจัดปัญหา Four-Wave Mixing ในระบบ DWDM
   - ตัวอย่างผลิตภัณฑ์เชิงพาณิชย์: Lucent TrueWave, Corning LEAF / MetroCor, Alcatel TeraLight, Pirelli FreeLight / WideLight


---

## Slide Page 5

5
Mgmt: Management

### รายละเอียดตารางเปรียบเทียบ: เส้นใยแก้วนำแสงแต่ละชนิดกับเทคโนโลยีการส่ง (Different Solutions for Fiber Types)
- **SMF (G.652):** ดีมาก (Good) สำหรับ TDM 1310 nm, พอใช้ได้ (OK) สำหรับ TDM 1550 nm, พอใช้ได้สำหรับ DWDM แต่ต้องมีการจัดการการกระจายแสง (Dispersion Management)
- **DSF (G.653):** พอใช้ได้สำหรับ TDM 1310 nm, ดีมากสำหรับ TDM 1550 nm, แต่แย่มาก (Bad) สำหรับ DWDM ในย่าน C-Band เนื่องจากปัญหา FWM
- **NZDSF (G.655):** พอใช้ได้สำหรับ TDM 1310 nm, ดีมากสำหรับ TDM 1550 nm, และดีเยี่ยม (Good) สำหรับ DWDM ครอบคลุมทั้ง C-Band และ L-Band
- **Extended Band (G.652.C / G.652.D):** ลดทอน Water Peak ในย่าน 1383 nm ทำให้รองรับ CWDM ได้ครบทั้ง 18 ช่องความยาวคลื่น (>8 Wavelengths)


---

## Slide Page 6

6

### รายละเอียดข้อจำกัดจาก Chromatic Dispersion (Limitations from Chromatic Dispersion)
- การกระจายแสงทำให้สัญญาณพัลส์เกิดการบิดเบี้ยวและยืดกว้างออกตามแกนเวลา (Pulse Smearing / Broadening) ส่งผลให้เกิดการซ้อนทับกันระหว่างบิต (Intersymbol Interference: ISI)
- ระบบที่มี Bit Rate สูงกว่าจะมีความไวต่อ Chromatic Dispersion มากกว่าอย่างมหาศาล โดยระยะทางสูงสุดจะแปรผกผันกับกำลังสองของ Bit Rate:
  * **ระบบ 10 Gbps:** สามารถส่งข้อมูลบนสาย SMF-28 ได้ไกลประมาณ **60 km** ก่อนที่พัลส์จะซ้อนทับกันเกินเกณฑ์
  * **ระบบ 40 Gbps:** ระยะทางสูงสุดลดลงเหลือเพียง **4 km** (ลดลงถึง 16 เท่า บนสาย SMF-28)


---

## Slide Page 7

7

### รายละเอียดแนวทางการแก้ปัญหา Chromatic Dispersion (Combating Chromatic Dispersion)
1. **การใช้สายใยแก้วชนิดพิเศษ:** เช่น DSF (G.653), NZDSF (G.655) และสายชดเชยการกระจายแสง (DCF: Dispersion Compensating Fiber)
2. **การใช้เครื่องส่งเลเซอร์ที่มีความกว้างสเปกตรัมแคบมาก (Narrow Spectral Width Transmitters):** เช่น เลเซอร์ชนิด Distributed Feedback (DFB) หรือ External Cavity Laser เพื่อลดผลต่างความเร็วของแต่ละความยาวคลื่น
3. **การฟื้นฟูสัญญาณพัลส์ (O-E-O Regeneration):** แปลงสัญญาณแสงเป็นไฟฟ้าเพื่อ Re-shape, Re-time, Re-generate แล้วแปลงกลับเป็นสัญญาณแสง


---

## Slide Page 8

8

### รายละเอียดกราฟการชดเชยการกระจายแสง (Dispersion Compensation Profile)
- **กรณีไม่ชดเชย (No Compensation):** ค่า Cumulative Dispersion จะสะสมติดลบลงเรื่อยๆ ตามระยะทาง (เช่น จาก 0 ps/nm ลงไปถึง -500 ps/nm ที่ปลายทาง)
- **กรณีมีการชดเชย (With Compensation):** เมื่อส่งผ่านสายเคเบิลไปช่วงหนึ่ง ค่าการกระจายแสงจะลดลง จากนั้นนำเข้าโมดูลชดเชย (Dispersion Compensators) ซึ่งมีค่าการกระจายแสงเป็นบวก ดึงค่า Dispersion กลับขึ้นมาใกล้ 0 ps/nm ทำให้ควบคุมค่าการกระจายแสงรวมให้อยู่ในช่วงแคบๆ ได้ตลอดเส้นทาง


---

## Slide Page 9

Span Design
9

### รายละเอียดการคำนวณ Span Design Limits - ขีดจำกัดด้านการลดทอนกำลังแสง (Attenuation Limit)
**พารามิเตอร์ของระบบ:**
- กำลังส่งของเครื่องส่ง (Tx Power): **0 dBm**
- ความไวของเครื่องรับ (Rx Sensitivity): **-28 dBm**
- ขีดจำกัดการทน Dispersion ของเครื่องรับ: **1600 ps/nm**
- ความต้องการ OSNR ขั้นต่ำ: **21 dB**
- ระยะทางของ Span: **120 km**
- ค่า Loss ของสายเคเบิล: **0.25 dB/km** (สูญเสียรวมตลอด Span = 120 x 0.25 = **30 dB**)
- อัตรา Dispersion ของสายเคเบิล: **18 ps/(nm*km)**

**ผลการคำนวณกำลังแสงตามระยะทาง:**
- ที่ 0 km (ออกจาก Tx): กำลังแสง = 0 dBm
- ที่ 20 km: กำลังแสง = 0 - (20 x 0.25) = -5 dBm
- ที่ 100 km: กำลังแสง = -5 - (80 x 0.25) = -25 dBm
- ที่ 120 km (เข้าสู่ Rx): กำลังแสง = 0 - 30 = **-30 dBm**
**บทสรุปปัญหา:** กำลังแสงที่เครื่องรับ (-30 dBm) ต่ำกว่าความไวของเครื่องรับ (-28 dBm) อยู่ 2 dB ทำให้สัญญาณขาดหาย ไม่สามารถใช้งานได้ ต้องใช้อุปกรณ์ขยายสัญญาณ (Amplifier)


---

## Slide Page 10

10

### รายละเอียดการคำนวณ Span Design Limits - การใช้เครื่องขยายสัญญาณ EDFA (Amplification)
**พารามิเตอร์ของ EDFA:**
- อัตราขยาย (Gain): **23 dB** (กำลังส่งออกสูงสุด Max Output = **+17 dBm**)
- Noise Figure: < 6 dB
- กำลังแสงอินพุตสูงสุด (Max Input): **-6 dBm**

**การคำนวณกำลังแสงเมื่อติดตั้ง EDFA:**
- สัญญาณจาก Tx (0 dBm) ผ่านตัวลดทอนสัญญาณ (Attenuator) **-6 dB** เพื่อให้ได้กำลังอินพุตพอดีกับ Max Input ของ EDFA ที่ **-6 dBm**
- ผ่าน EDFA เพิ่มกำลังส่งออกไปที่ Max Output = **+17 dBm** (ที่จุด 0 km)
- ที่ 20 km: กำลังแสงลดลง 5 dB เหลือ **+12 dBm**
- ที่ 100 km: กำลังแสงลดลงอีก 20 dB เหลือ **-8 dBm**
- ที่ 120 km: กำลังแสงลดลงอีก 5 dB เข้าสู่ Rx ที่ **-13 dBm**
**ผลลัพธ์ด้านกำลังแสง:** กำลังแสง -13 dBm เหนือกว่าเกณฑ์ Rx Sensitivity (-28 dBm) อยู่ถึง **15 dB** (ผ่านเกณฑ์ Attenuation)
**ปัญหาที่ยังคงอยู่:** ค่า Dispersion รวมที่ 120 km = `120 km x 18 ps/(nm*km) = 2160 ps/nm` ซึ่งเกินขีดจำกัดที่ Rx ทนได้ (1600 ps/nm) จึงต้องทำการชดเชย Dispersion ต่อไป


---

## Slide Page 11

11

### รายละเอียดการคำนวณ Span Design Limits - ขีดจำกัดด้านการกระจายแสง (Dispersion Limit)
- พัลส์ใน Time Domain เกิดการยืดกว้างอย่างต่อเนื่อง:
  * ที่ 0 km: พัลส์คมชัด มี Dispersion = **0 ps/nm**
  * ที่ 20 km: Dispersion สะสม = `20 x 18 = 360 ps/nm`
  * ที่ 100 km: Dispersion สะสม = `100 x 18 = 1800 ps/nm` (เริ่มล้นขอบ Time Slot)
  * ที่ 120 km: Dispersion สะสม = `120 x 18 = 2160 ps/nm` (บานออกนอกช่องสัญญาณอย่างรุนแรง ก่อให้เกิด ISI)
- สเปกตรัมใน Wavelength Domain ยังคงเท่าเดิม แต่รูปคลื่นใน Time Domain พังทลาย เกินเกณฑ์ 1600 ps/nm


---

## Slide Page 12

12

### รายละเอียดการคำนวณ Span Design Limits - การชดเชยด้วยม้วนสาย DCF (Dispersion Compensation)
**พารามิเตอร์ของโมดูล DCF (Dispersion Compensating Fiber):**
- อัตราการชดเชย Dispersion: **-600 ps/nm**
- การสูญเสียกำลังแสงแทรก (Insertion Loss): **10 dB**

**ผลการคำนวณสุทธิที่ปลายทาง (หลังผ่าน DCF ก่อนเข้า Rx):**
1. **การคำนวณ Dispersion สุทธิ:**
   `Dispersion รวม = 2160 ps/nm + (-600 ps/nm) = 1560 ps/nm`
   *ผลลัพธ์:* 1560 ps/nm ต่ำกว่าขีดจำกัด 1600 ps/nm (ผ่านเกณฑ์ Dispersion)
2. **การคำนวณกำลังแสงสุทธิ:**
   `กำลังแสง = -13 dBm - 10 dB = -23 dBm`
   *ผลลัพธ์:* -23 dBm สูงกว่าความไวของเครื่องรับ -28 dBm อยู่ 5 dB (ผ่านเกณฑ์ Optical Power Budget)
ระบบสามารถทำงานได้อย่างสมบูรณ์ทั้งด้านกำลังแสงและคุณภาพพัลส์


---

## Slide Page 13

13

### รายละเอียดการคำนวณ Span Design Limits - ขีดจำกัดสัญญาณรบกวน OSNR (Limits of Amplification)
**สถาปัตยกรรมโครงข่ายแบบ Multi-Span:**
- ระยะทางรวม 4 Spans (Span ละ 60 km รวมระยะทาง 240 km)
- การสูญเสียต่อ Span = `60 km x 0.25 dB/km = 15 dB/span`
- ทุก Span มีการติดตั้ง EDFA และ DCF เพื่อขยายกำลังแสงกลับมาที่ +17 dBm

**การสะสมของสัญญาณรบกวน ASE (Amplified Spontaneous Emission Noise):**
- แม้กำลังสัญญาณจะถูกดึงกลับมาที่ +17 dBm เท่าเดิมทุกสถานี แต่อุปกรณ์ EDFA จะสร้างสัญญาณรบกวน ASE สะสมเพิ่มขึ้นเรื่อยๆ
- **Span 1:** ค่า OSNR = **39 dB**
- **Span 2:** ค่า OSNR = **33 dB** (ลดลง 6 dB จากการเบิ้ลจำนวนแอมป์)
- **Span 3:** ค่า OSNR = **27 dB**
- **Span 4:** ค่า OSNR = **21 dB** (แตะเกณฑ์ขั้นต่ำที่ต้องการพอดี)
- **End of Line (หลัง Span 4):** ค่า OSNR ตกฮวบลงเหลือ **15 dB** ซึ่งมีสถานะ **"Too Low"** ต่ำกว่าเกณฑ์มาตรฐาน 21 dB
**ข้อสรุปเชิงวิศวกรรม:** เราไม่สามารถต่อขยายแอมพลิฟายเออร์ไปได้เรื่อยๆ โดยไม่มีที่สิ้นสุด เพราะแม้กำลังวัตต์จะพอ แต่ OSNR จะเสื่อมลงจนเครื่องรับแยกบิตไม่ได้ ต้องตั้งสถานี 3R Regenerator (O-E-O) เพื่อล้าง Noise


---

## Slide Page 14

OADM
OADM
OADM
OADM
Wavelengths 1 2 3 4
1 2 3 4
1 2 3 4
1 2 3 4
N
o
d
e
A
N
o
d
e
D
N
o
d
e
B
N
o
d
e
C
Note wavelength reuse of "blue" wavelength (no. 3), links Node A and B as well as Node C and A  
OADM: Optical Add-Drop Multiplexer
Simple Optical Network Example
14


---

## Slide Page 15

Multi-Service Access Node (MSAN)
15
A multi-service access node (MSAN), also known as a multi-
service access gateway (MSAG), is a device typically installed 
in a telephone exchange which connects customers' telephone 
lines to the core network, to provide telephone, ISDN, and 
broadband such as DSL all from a single platform.
Integrating 
all 
services 
on 
a 
single 
node, 
which 
typically backhauls all data streams over IP or Asynchronous 
Transfer Mode can be more cost effective and may provide new 
services to customers quicker than previously possible.


---

## Slide Page 16

16
BT : British Telecommunications

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 17

Broadband Access Service 
17
Digital subscriber line (DSL) is the most widely deployed 
broadband technology worldwide. This delivery option uses 
existing telephone lines to send broadband information on a 
different frequency than is used for the existing voice service. 
Many generations of DSL are used for residential service, 
including Very High Speed Digital Subscriber Line 2 (VDSL2) 
and versions of Asymmetric Digital Subscriber Line (ADSL, 
ADSL2, and ADSL2+). These variations of DSL primarily offer 
asymmetric residential broadband service where different 
upstream and downstream speeds are implemented. (VDSL2 
also supports symmetric operation.) Other DSL variations, like 
High bit rate Digital Subscriber Line (HDSL) and Symmetric 
Digital Subscriber Line (SDSL), provide symmetric speeds and 
are typically used in business applications.


---

## Slide Page 18

Broadband Access Service 
18
Active Ethernet
Active Ethernet uses traditional Ethernet technology to deliver 
broadband service across a fiber-optic network. Active Ethernet 
does not provide a separate channel for existing voice service, so 
VoIP (or TDM-to-VoIP) equipment is required. In addition, 
sending full-speed (10 or 100 Mbps) Ethernet requires 
significant power, necessitating distribution to Ethernet switches 
and optical repeaters located in cabinets outside of the central 
office. Due to these restrictions, early Active Ethernet 
deployments typically appear in densely populated areas.


---

## Slide Page 19

Broadband Access Service 
19
Passive Optical Networking
Passive Optical Networking (PON), like Active Ethernet, uses 
fiber-optic cable to deliver services to the premises. This 
delivery option provides higher speeds than DSL but lower 
speeds than Active Ethernet. Though PON provides higher speed 
to each subscriber, it requires a higher investment in cable and 
connectivity. A key advantage of PON is that it does not require 
any powered equipment outside of the central office. Each fiber 
leaving the central office is split using a non-powered optical 
splitter. The split fiber then follows a point-to-point connection 
to each subscriber.


---

## Slide Page 20

Broadband Access Service 
20
PON technologies fall into three general categories:
ATM PON (APON), APON—The first passive optical network 
standard is primarily used for business applications.
Broadband PON (BPON), BPON—Based on APON, BPON 
adds wave division multiplexing (WDM), dynamic and higher 
upstream bandwidth allocation, and a standard management 
interface to enable mixed-vendor networks.
Gigabit-capable PON (GPON), GPON—The most recent PON 
adaptation, GPON is based on BPON but supports higher rates, 
enhanced security, and a choice of which Layer 2 protocol to use 
(ATM, Generic Equipment Model [GEM], or Ethernet).


---

## Slide Page 21

Broadband Access Service 
21
Ethernet PON (EPON)—Provides capabilities similar to GPON, 
BPON, and APON, but uses Ethernet standards. These standards 
are defined by the IEEE. Gigabit Ethernet PON (GEPON) is the 
highest speed version.
Wave Division Multiplexing PON (WDM-PON) — A 
nonstandard PON which, as the name implies, provides a 
separate wavelength to each subscriber.


---

## Slide Page 22

Broadband Access Service 
22
FTTx
The term fiber to the x (FTTx) describes how far into the 
network fiber-optic cabling runs before a switch to copper 
cabling takes place. 
The following terms are used to describe the termination point 
of fiber-optic cable in a network:
Fiber to the Premises (FTTP), Fiber to the Home (FTTH), Fiber 
to the Business (FTTB)—Fiber extends all the way to the 
subscriber. PON is most common for residential access, 
although Active Ethernet can be efficiently used in dense areas 
such as apartment complexes. Active Ethernet is more common 
for delivering services to businesses.


---

## Slide Page 23

Broadband Access Service 
23
Fiber to the Curb (FTTC)—Fiber extends most of the way 
(typically, 500 feet/150 meters or less) to the subscriber. Existing 
copper is used for the remaining distance to the subscriber.
Fiber to the Node/Neighborhood (FTTN)—Fiber extends to 
within a few thousand feet of the subscriber and converted to 
xDSL for the remaining distance to the subscriber.
Fiber to the Exchange (FTTE)—A typical central office-based 
xDSL implementation in which fiber is used to deliver traffic to 
the central office and xDSL is used on the existing local loop.


---

## Slide Page 24

Broadband Access Service 
24
ONU (optical network units) 
 ONT (optical network terminal) 
SDU (service data unit)  
 OLT (optical line terminal) 
MHU/MTU (material handling unit)/(multi-tenant unit)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

25

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 26

26
Link Calculation แบบ Distributed Split
Splitter 1:2
Splitter 1:16
Splitter 1:16
ONU
PON OLT
Power 1 dBm
OFC G.652D
Loss 3.6 dB
OFC G.652D
Loss 13.5 dB
Rx sent. -26.5 dBm
FTTx Drop OFC G.657
Fiber loss 0.33 dB/km @1310 nm.
OFC 5 km.
Splice loss = 1 dB (1)
Connector loss = 1 dB (2)
Fiber loss 0.33 dB/km @1310 nm.
OFC 5 km.
Splice loss = 1 dB (1)
Connector loss = 1 dB (2)
Fiber loss 0.34 dB/km @1310 nm.
OFC 500 m.
Connector loss = 1 dB (2)
OFC : Optical Fiber Cable
Link margin >= 5 dB

### รายละเอียดการคำนวณ Link Calculation แบบ Distributed Split (Splitter กระจายตัว)
**โครงสร้างระบบ:**
- OLT Transmit Power: **+1 dBm** (ที่ความยาวคลื่น 1310 nm)
- ONU Rx Sensitivity: **-26.5 dBm**
- เกณฑ์ Link Margin ที่ต้องการ: **>= 5 dB**
- โครงสร้าง Splitter 2 ชั้น: ชั้นที่ 1 ใช้ **Splitter 1:2** (Loss 3.6 dB), ชั้นที่ 2 ใช้ **Splitter 1:16** (Loss 13.5 dB)
  (อัตราการแยกสัญญารวม 1:32)

**การคำนวณการสูญเสียในแต่ละช่วง (Span Loss):**
1. **Span 1 (จาก OLT ไปยัง Splitter 1:2):**
   - สายเคเบิล OFC G.652D ระยะทาง 5 km (Loss 0.33 dB/km): `5 x 0.33 = 1.65 dB`
   - Splice Loss: `1.0 dB`
   - Connector Loss: `1.0 dB`
   - Splitter 1:2 Loss: `3.6 dB`
   - รวมการสูญเสียช่วงที่ 1 = `1.65 + 1.0 + 1.0 + 3.6 = 7.25 dB`
2. **Span 2 (จาก Splitter 1:2 ไปยัง Splitter 1:16):**
   - สายเคเบิล OFC G.652D ระยะทาง 5 km (Loss 0.33 dB/km): `5 x 0.33 = 1.65 dB`
   - Splice Loss: `1.0 dB`
   - Connector Loss: `1.0 dB`
   - Splitter 1:16 Loss: `13.5 dB`
   - รวมการสูญเสียช่วงที่ 2 = `1.65 + 1.0 + 1.0 + 13.5 = 17.15 dB`
3. **Span 3 (จาก Splitter 1:16 ไปยัง ONU):**
   - สายเคเบิล FTTx Drop OFC G.657 ระยะทาง 500 m = 0.5 km (Loss 0.34 dB/km): `0.5 x 0.34 = 0.17 dB`
   - Connector Loss: `1.0 dB`
   - รวมการสูญเสียช่วงที่ 3 = `0.17 + 1.0 = 1.17 dB`

**ผลการคำนวณ Link Budget รวม:**
- การสูญเสียรวมตลอดเส้นทาง (Total Loss) = `7.25 + 17.15 + 1.17 = 25.57 dB`
- กำลังแสงที่เข้าสู่เครื่องรับ ONU (Rx Power) = `1 dBm - 25.57 dB = -24.57 dBm`
- ค่า Link Margin จริง = `-24.57 dBm - (-26.5 dBm) = 1.93 dB`
**สรุปผลการประเมิน:** ระบบนี้ได้ Margin เพียง **1.93 dB** ซึ่ง **"ไม่ผ่านเกณฑ์"** (ต่ำกว่าข้อกำหนดที่ต้องได้ >= 5 dB)


---

## Slide Page 27

27
Link Calculation แบบ Centralize Split
PON OLT
Splitter 1:32
ONU
OFC G.652D
FTTx Drop OFC G.657
Power 1 dBm
Fiber loss 0.33 dB/km @1310 nm.
OFC 5 km.
Splice loss = 1 dB (1)
Connector loss = 1 dB (2)
Loss 16.7 dB
Rx sent. -26.5 dBm
Fiber loss 0.34 dB/km @1310 nm.
OFC 500 m.
Connector loss = 1 dB (2)
Link margin >= 5 dB

### รายละเอียดการคำนวณ Link Calculation แบบ Centralize Split (Splitter ศูนย์กลางจุดเดียว)
**โครงสร้างระบบ:**
- OLT Transmit Power: **+1 dBm** (ที่ความยาวคลื่น 1310 nm)
- ONU Rx Sensitivity: **-26.5 dBm**
- เกณฑ์ Link Margin ที่ต้องการ: **>= 5 dB**
- โครงสร้าง Splitter จุดเดียว: ใช้ **Splitter 1:32** ที่ศูนย์กลางจุดเดียว (Insertion Loss = **16.7 dB**)

**การคำนวณการสูญเสียในแต่ละช่วง (Span Loss):**
1. **ช่วงที่ 1 (Feeder จาก OLT ไปยัง Splitter 1:32):**
   - สายเคเบิล OFC G.652D ระยะทาง 5 km (Loss 0.33 dB/km): `5 x 0.33 = 1.65 dB`
   - Splice Loss: `1.0 dB`
   - Connector Loss: `1.0 dB`
   - รวมช่วงที่ 1 = `1.65 + 1.0 + 1.0 = 3.65 dB`
2. **การสูญเสียจากตัวแยกสัญญาณ (Splitter Loss):**
   - Splitter 1:32 Loss = `16.7 dB`
3. **ช่วงที่ 2 (Drop Cable จาก Splitter 1:32 ไปยัง ONU):**
   - สายเคเบิล FTTx Drop OFC G.657 ระยะทาง 500 m = 0.5 km (Loss 0.34 dB/km): `0.5 x 0.34 = 0.17 dB`
   - Connector Loss: `1.0 dB`
   - รวมช่วงที่ 2 = `0.17 + 1.0 = 1.17 dB`

**ผลการคำนวณ Link Budget รวม:**
- การสูญเสียรวมตลอดเส้นทาง (Total Loss) = `3.65 + 16.7 + 1.17 = 21.52 dB`
- กำลังแสงที่เข้าสู่เครื่องรับ ONU (Rx Power) = `1 dBm - 21.52 dB = -20.52 dBm`
- ค่า Link Margin จริง = `-20.52 dBm - (-26.5 dBm) = 5.98 dB`
**สรุปผลการประเมิน:** ระบบนี้ได้ Margin เท่ากับ **5.98 dB** ซึ่ง **"ผ่านเกณฑ์มาตรฐาน"** อย่างสมบูรณ์ (สูงกว่าข้อกำหนดที่ต้องการ >= 5 dB)


---

## Slide Page 28

28
Specification of G652D Fibre Optic Cable
Applications
• Ethernet
• Internet Protocol (IP)
• Asynchronous Transfer Mode (ATM)
• Synchronous Optical Network (SONET)
• Wavelength Division Multiplexing (WDM)
https://briticom.net/product/g652d-fibre-optic-cable/


---

## Slide Page 29

29
https://briticom.net/product/g652d-fibre-optic-cable/

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 30

30
Spec. G657A2 Fibre Optic Cable
Applications
• All types of fibre cables with different structures
• High-performance optical network operating in 
O-E-S-C-L band
• High-speed optical routes for FTTH networks
• Cables with extreme low bending requirements
• Small-sized fibre cable and optical component
https://briticom.net/product/g657a2-fibre-optic-cable/


---

## Slide Page 31

31

### รายละเอียดตารางสเปกสายใยแก้วนำแสง: G.652.D Optical Characteristics
- **Attenuation (การลดทอนกำลังแสง):**
  * ที่ 1310 nm: `<= 0.35 dB/km`
  * ที่ 1383 nm (หลังผ่านการทดสอบ H2-aging ไร้ water peak): `<= 0.35 dB/km`
  * ที่ 1460 nm: `<= 0.25 dB/km`
  * ที่ 1490 nm: `<= 0.23 dB/km`
  * ที่ 1550 nm: `<= 0.21 dB/km` (จุดต่ำสุดของเส้นใยแก้ว)
  * ที่ 1625 nm: `<= 0.23 dB/km`
- **Dispersion Coefficient (สัมประสิทธิ์การกระจายแสง):**
  * ย่าน 1285 - 1340 nm: `-3.5 ถึง +3.5 ps/(nm*km)`
  * ย่าน 1550 nm: `<= 18 ps/(nm*km)`
  * ย่าน 1625 nm: `<= 22 ps/(nm*km)`
- **Zero Dispersion Wavelength (λ0):** `1300 - 1324 nm`
- **Zero Dispersion Slope (S0):** `<= 0.092 ps/(nm^2 * km)`
- **PMD (Polarization Mode Dispersion):** `<= 0.1 ps/sqrt(km)`


---

## Slide Page 32

32

### รายละเอียดโครงสร้างสาย FTTx Drop Cable (มาตรฐาน มอก.2166-2548)
**1. สาย Duplex Patch Cord (Single-mode G.657A):**
- แกนใยแก้วนำแสง (Bare Glass Fiber Core)
- หลอดหุ้มสายแบบแน่น (Tight Buffer Tube)
- เส้นใยอะรามิดรับแรงดึง (Aramid Yarn / Kevlar)
- เปลือกนอกชนิด PVC หรือ LSZH
**2. สาย Self-Supporting Aerial Drop Cable (G.657.A2):**
- **Steel Messenger Wire:** เส้นลวดเหล็กสำหรับแขวนโยงเสาไฟฟ้า ป้องกันสายหย่อนและรับน้ำหนัก
- **LSZH Sheath Jacket:** เปลือกนอกผลิตจากวัสดุ Low Smoke Zero Halogen ป้องกันไฟลามและไม่ปล่อยควันพิษ
- **FRP Strength Members:** เส้น Fiber Reinforced Plastic จำนวน 2 เส้น ประกบขนานกับแกนแก้ว เพื่อรองรับแรงดึงภายนอก
- **Optical Fiber G.657.A2:** แกนแก้วไฟเบอร์ชนิดทนทานต่อการโค้งงอสูง
- ผ่านการรับรองมาตรฐานผลิตภัณฑ์อุตสาหกรรม **มอก.2166-2548**


---

## Slide Page 33

33

### รายละเอียดรัศมีการโค้งงอขั้นต่ำของสายใยแก้วนำแสง (Minimum Bending Radius Comparison)
เปรียบเทียบรัศมีการโค้งงอ (Bending Radius) ระหว่างมาตรฐานต่างๆ:
1. **G.652 (สาย Standard Single-Mode):** รัศมีการโค้งงอต่ำสุด **30 มม. (3.0 ซม.)** (หากดัดแคบกว่านี้ แสงจะรั่วออกจากแกนแก้ว เกิด Bending Loss มหาศาล)
2. **G.657.A1 (Bend-Insensitive Class A1):** รัศมีการโค้งงอต่ำสุด **10 มม. (1.0 ซม.)**
3. **G.657.A2 / B2 (Bend-Insensitive Class A2/B2):** รัศมีการโค้งงอต่ำสุด **7.5 มม. (0.75 ซม.)**
4. **G.657.B3 (Bend-Insensitive Class B3):** รัศมีการโค้งงอต่ำสุดเพียง **5 มม. (0.5 ซม.)**
**การประยุกต์ใช้งาน:** สายตระกูล G.657 ออกแบบมาสำหรับงาน FTTx ในบ้านและอาคารโดยเฉพาะ เพื่อให้สามารถม้วนขดเก็บในกล่องพักสายขนาดเล็ก (Wall Box) หรือเลี้ยวตามเหลี่ยมมุมผนังห้องได้โดยไม่สูญเสียสัญญาณ


---
