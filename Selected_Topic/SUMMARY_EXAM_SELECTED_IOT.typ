#set page(
  paper: "a4",
  margin: (top: 2.0cm, bottom: 2.0cm, left: 2.0cm, right: 2.0cm),
  header: context {
    if here().page() > 1 [
      #set text(font: ("Cordia New", "Leelawadee UI", "Segoe UI"), size: 10.5pt, fill: rgb("#475569"))
      #grid(
        columns: (1fr, auto),
        align(left)[*Selected Topic in IoT & Information Engineering* | สรุปเข้ม & สูตรคำนวณเข้าห้องสอบ],
        align(right)[หน้า #counter(page).display()]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
    ]
  },
  footer: context {
    if here().page() > 1 [
      #set text(font: ("Cordia New", "Leelawadee UI", "Segoe UI"), size: 10pt, fill: rgb("#94a3b8"))
      #line(length: 100%, stroke: 0.4pt + rgb("#cbd5e1"))
      #v(2pt)
      #align(center)[วิชา Selected Topic (ปี 4 เทอม 1) -- คณะวิศวกรรมศาสตร์ สจล. (KMITL)]
    ]
  }
)

#set text(
  font: ("Cordia New", "Leelawadee UI", "Segoe UI"),
  size: 13pt,
  fill: rgb("#0f172a"),
  lang: "th"
)

#set par(justify: true, leading: 0.65em)

// --- Custom Components ---
#let section-box(title, color: rgb("#1e40af"), body) = {
  rect(
    width: 100%,
    radius: 4pt,
    fill: rgb("#f8fafc"),
    stroke: 1pt + color,
    inset: (x: 10pt, y: 8pt)
  )[
    #text(weight: "bold", size: 13.5pt, fill: color)[#title]
    #v(3pt)
    #line(length: 100%, stroke: 0.5pt + color.lighten(60%))
    #v(3pt)
    #body
  ]
}

#let formula-box(title, body) = {
  rect(
    width: 100%,
    radius: 4pt,
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#3b82f6"),
    inset: (x: 10pt, y: 8pt)
  )[
    #text(weight: "bold", size: 12.5pt, fill: rgb("#1d4ed8"))[#title]
    #v(2pt)
    #body
  ]
}

// --- Title Banner ---
#align(center)[
  #text(size: 20pt, weight: "bold", fill: rgb("#1e3a8a"))[คู่มือสรุปเข้มและรวมสูตรคำนวณข้อสอบข้อเขียน] \
  #text(size: 14pt, weight: "bold", fill: rgb("#0284c7"))[วิชา Selected Topic in IoT System and Information Engineering] \
  #text(size: 11pt, fill: rgb("#64748b"))[เจาะลึก 5 ข้อสอบอัตนัย: Digital Twins, High-Speed SONET/SDH, Dispersion Complementary Design, GPON/EDFA, และ FTTx Architectures]
]
#v(6pt)
#line(length: 100%, stroke: 1.2pt + rgb("#1e3a8a"))
#v(8pt)

// ==========================================
// ข้อ 1: Digital Twins
// ==========================================
#section-box("ข้อ 1: Digital Twins (นิยาม, สถาปัตยกรรม 3 ระดับ, และ 4 ประเภท)", color: rgb("#0f766e"))[
  *1. นิยามและแนวคิดพื้นฐาน (Definition):*
  - *Digital Twin* คือตัวแทนเสมือนจริงในรูปแบบดิจิทัล (Digital Replica / Virtual Representation) ของวัตถุทางกายภาพ กระบวนการ หรือระบบจริง โดยผสานข้อมูลแบบเรียลไทม์จาก IoT Sensors, ข้อมูลในอดีต (Historical Data), และแบบจำลองทางฟิสิกส์ (Physics-based Model) เพื่อทำนายสถานะ (Predictive Maintenance), เพิ่มประสิทธิภาพ (Optimization) และควบคุมสั่งการโลกจริงแบบวงรอบปิด (Closed-loop Control)
  - *องค์ประกอบ 3 มิติ (Michael Grieves Model):*
    1. *Physical Entity:* วัตถุ เครื่องจักร หรือกระบวนการจริงในโลกกายภาพ
    2. *Virtual Entity:* โมเดลแฝดเสมือนในระบบคอมพิวเตอร์ที่จำลองกฎฟิสิกส์และพฤติกรรม
    3. *Data Connection:* ลิงก์เชื่อมโยงสองทิศทาง (Bidirectional) ระหว่างโลกจริงกับโลกเสมือนแบบเรียลไทม์

  *2. ขั้นตอนและวิวัฒนาการ 3 ขั้น (3 Life Cycle Stages):*
  - *Digital Twin Prototype (DTP):* โมเดลแฝดในขั้นออกแบบ/ก่อนสร้างจริง กำหนดคุณสมบัติ สเปก และการจำลองพฤติกรรมเสมือน
  - *Digital Twin Instance (DTI):* โมเดลแฝดของเครื่องจักรจริงรายชิ้น ผูกโยงข้อมูลการทำงาน บันทึกประวัติซ่อมบำรุง และค่าพารามิเตอร์เฉพาะเจาะจงของชิ้นนั้นๆ ตลอดอายุการใช้งาน
  - *Digital Twin Aggregate (DTA):* การรวบรวมข้อมูล DTI ของเครื่องจักรทุกเครื่องเข้าด้วยกันเพื่อวิเคราะห์และบริหารจัดการระดับโรงงานหรือโครงข่ายรวม (Fleet/System-wide Analysis)

  *3. 4 ประเภทของ Digital Twins (Classification):*
  - *Component Twin:* จำลองชิ้นส่วนเดี่ยวที่เล็กที่สุด (เช่น แบริ่ง, ข้อต่อ, วาล์ว)
  - *Asset / Product Twin:* รวมชิ้นส่วนเป็นเครื่องจักรเดี่ยว 1 เครื่อง (เช่น ปั๊มน้ำ, หุ่นยนต์แขนกล, เครื่องกำเนิดไฟฟ้า)
  - *System / Unit Twin:* ระบบหรือสายการผลิตที่ประกอบด้วยหลายเครื่องจักรทำงานร่วมกัน (เช่น สายการประกอบรถยนต์)
  - *Process Twin:* ระดับสูงสุด ผสานระบบการผลิตทั้งหมดเข้ากับซัพพลายเชนและโมเดลธุรกิจขององค์กร
]

#v(8pt)

// ==========================================
// ข้อ 2: High-Speed SONET/SDH Multiplexing
// ==========================================
#section-box("ข้อ 2: ระบบการ Multiplex ความเร็วสูง (SONET/SDH Hierarchy & Network Design)", color: rgb("#1e40af"))[
  *1. หลักการและโครงสร้างระดับสัญญาณ (Multiplexing Hierarchy):*
  - ทำงานบนพื้นฐาน *Synchronous TDM* โดยทุกโหนดในโครงข่ายซิงค์เข้ากับนาฬิกาอะตอมิกเดียวกัน ทำให้ขอบของเฟรม (Frame Boundary) และตำแหน่งไบต์แน่นอน
  - ลำดับสัญญาณไฟฟ้าเรียกว่า *STS-n* และเมื่อแปลงเป็นแสงจะเรียกว่า *OC-n*
    - $text("STS-1 / OC-1") = 51.84 text(" Mbps")$ (เฟรม 9 แถว $times$ 90 คอลัมน์ = 810 ไบต์ ทุก 125 $mu text("s")$)
    - $text("STS-3 / OC-3") = 155.52 text(" Mbps")$ (ตรงกับ STM-1 ของฝั่ง SDH)
    - $text("STS-12 / OC-12") = 622.08 text(" Mbps")$
    - $text("STS-48 / OC-48") = 2488.32 text(" Mbps")$ ($approx 2.5 text(" Gbps")$)
    - $text("STS-192 / OC-192") = 9953.28 text(" Mbps")$ ($approx 10 text(" Gbps")$)

  *2. กฎเหล็กของการ Multiplex (Golden Rules of SONET):*
  - *Byte Interleaving:* การรวมสัญญาณย่อยเข้าสู่สัญญาณความเร็วสูง ต้องสลับส่งทีละ 1 ไบต์ (Byte-by-Byte) เท่านั้น ห้ามรวมเป็นก้อนบิต เพื่อให้ปลายทางสามารถดึงไบต์ที่ต้องการออกมาได้ทันที
  - *Direct Access (No Demultiplexing Penalty):* ด้วย Synchronous + Pointer ใน Overhead ระบบสามารถดึง (Drop) หรือแทรก (Add) ทราฟฟิกย่อยออกมาได้โดย *ไม่ต้อง Demux สัญญาณความเร็วสูงทั้งหมดออกมาก่อน*
  - *Layered Overhead:* แบ่ง 4 ชั้นชัดเจน: Photonic, Section Overhead (SOH), Line Overhead (LOH), และ Path Overhead (POH) เพื่อตรวจจับ Error (BIP-8) และควบคุมการชี้ตำแหน่งข้อมูล

  *3. กรณีศึกษา: รวม OC 4 ชุดจาก ลาดกระบัง ไป ชลบุรี และกระจายให้ลูกค้า:*
  - *ต้นทาง (ลาดกระบัง):*
    1. รับสัญญาณอินพุต 4 ชุด (เช่น 4 $times$ OC-3) เข้าสู่ *STS Multiplexer*
    2. แปลงสัญญาณแสงเป็นไฟฟ้า (O-E) จัดเรียงลงใน STS-3 Synchronous Payload Envelope (SPE) พร้อมแปะ Path Overhead (POH)
    3. นำ STS-3 ทั้ง 4 สัญญาณมาทำ *Byte Interleaving Multiplexing* รวมเป็น *STS-12* (622.08 Mbps)
    4. แปะ Line Overhead (LOH) และ Section Overhead (SOH) เพื่อซิงค์เฟรมและตรวจ Error
    5. ส่งเข้าเลเซอร์ทรานสมิตเตอร์ แปลงไฟฟ้ากลับเป็นแสง *OC-12* ยิงผ่านสายไฟเบอร์ระยะไกลไปชลบุรี
  - *ปลายทาง (ชลบุรี):*
    1. รับสัญญาณแสง OC-12 เข้าสู่อุปกรณ์ *Add/Drop Multiplexer (ADM)*
    2. อ่าน Section/Line Overhead และใช้ *Payload Pointer* ชี้ตรงไปยังตำแหน่งพิกัดไบต์ของลูกค้าที่ต้องการ
    3. ทำการ *Drop* เฉพาะสัญญาณย่อย (OC-3/STS-1) ของลูกค้ารายนั้นออกมา แปลงเข้า Optical Transceiver ส่งต่อไปยังอาคารลูกค้า โดยที่ทราฟฟิกของลูกค้าโซนอื่นยังคงวิ่งผ่าน (Pass-through) ต่อไปในวงแหวนได้โดยไม่ต้องแกะ
]

#pagebreak()

// ==========================================
// ข้อ 3: Dispersion Complementary Design
// ==========================================
#section-box("ข้อ 3: การออกแบบเส้นใยแก้วนำแสงเสริมกัน (Dispersion Compensation & Practical Cuts)", color: rgb("#b45309"))[
  *1. ปัญหาและการออกแบบเพื่อเสริมกัน (Conductive / Complementary Property):*
  - *Chromatic Dispersion (CD)* เกิดจากความยาวคลื่นแต่ละสีในพัลส์แสงเดินทางด้วยความเร็วต่างกัน ส่งผลให้พัลส์แสงยืดกว้างออกใน Time Domain เกิด Inter-Symbol Interference (ISI) จนเครื่องรับอ่านบิตไม่ออก
  - สายเคเบิล Single-Mode Fiber (SMF: G.652D) ทั่วไปมีค่าการกระจายแสงเป็นบวก: $D_("SMF") approx +17 " ถึง " +18 " ps/(nm"dot"km)"$ ที่ 1550 nm
  - เพื่อให้เกิดคุณสมบัติ "เสริมกัน/หักล้างกัน" จะต้องนำสายชนิด *DCF (Dispersion Compensating Fiber)* ที่มีค่าการกระจายแสงเป็นลบสูง $D_("DCF") < 0$ มาต่อประกบแบบอนุกรม เพื่อให้ผลรวมเป็นศูนย์:
]

#v(4pt)
#formula-box("สูตรคำนวณการหักล้าง Chromatic Dispersion สุทธิ")[
  $ D_("total") = (D_1 dot L_1) + (D_2 dot L_2) = 0 " ps/nm" $
  $ L_2 = - (D_1 dot L_1) / D_2 $
  - $D_1$: Dispersion ของสายส่งหลัก (SMF) $= +18 " ps/(nm"dot"km)"$
  - $L_1$: ความยาวสายส่งหลัก (เช่น 50 km)
  - $D_2$: Dispersion ของสายชดเชย (DCF) เช่น $-90 " ps/(nm"dot"km)"$
  - $L_2$: ความยาวสาย DCF ที่ต้องใช้
]
#v(4pt)

#rect(width: 100%, radius: 4pt, fill: rgb("#fffbeb"), stroke: 1pt + rgb("#f59e0b"), inset: 8pt)[
  *ตัวอย่างคำนวณระยะ 50 กม.:*
  - สายส่งหลัก SMF ยาว $L_1 = 50 " km"$ มี Dispersion สะสม $= 50 times (+18) = +900 " ps/nm"$
  - ต้องการชดเชยด้วยม้วนสาย DCF ที่มีค่า $D_2 = -90 " ps/(nm"dot"km)"$:
    $ L_2 = (+900) / (90) = 10 " km" $
  - ผลรวม Dispersion สุทธิ $= +900 + (10 times (-90)) = 0 " ps/nm"$ (พัลส์แสงคงรูปคมชัดสมบูรณ์)

  *2. ข้อจำกัดและข้อควรระวังในการตัดสายในความเป็นจริง (Practical Spool & Splice Lengths):*
  - *มาตรฐานล้อม้วนสายเคเบิล (Drum Length):* ในทางปฏิบัติ โรงงานไม่สามารถผลิตสายเคเบิลยาวเส้นเดียว 50 กม. ได้เพราะขนาดและน้ำหนักล้อเคเบิล มาตรฐานการผลิตและขนส่งสายเคเบิลภายนอกอาคารจะยาว *2 กม. ถึง 4 กม. ต่อม้วน*
  - ดังนั้น ระยะ 50 กม. จะต้องใช้สายเคเบิลนำมาเชื่อมต่อกันจริงประมาณ $50 / 2 = 25$ ท่อน (เกิดจุด Fusion Splice ตามแนวท่อ/เสา 24 จุด)
  - *การตัดสายหน้างาน (Cut-back and Slack Allowance):* การลากสายจริงต้องเผื่อสายหย่อน (Slack) ม้วนเก็บไว้ในบ่อพัก (Handhole/Manhole) หรือตู้พักสายจุดละ 15 - 30 เมตร เพื่อให้ช่างสามารถดึงสายออกมาปอก ตัดด้วย Precision Cleaver และเชื่อมด้วยเครื่อง Fusion Splicer ได้โดยสายไม่ตึงขาด
]

#v(8pt)

// ==========================================
// ข้อ 4: GPON & EDFA Link Budget Calculation
// ==========================================
#section-box("ข้อ 4: การออกแบบ GPON และการขยายระยะด้วย Repeater / EDFA", color: rgb("#4338ca"))[
  *4.1 การออกแบบโครงสร้าง GPON 1:4 และ 1:8 User, จุด Splice, และระยะทาง Feeder สูงสุด:*
  - *สถาปัตยกรรม Splitter 2 ชั้น (Distributed Split):*
    - ชั้นที่ 1 ใช้ Splitter 1:4 (Loss $approx 7.2 " dB"$)
    - ชั้นที่ 2 ใช้ Splitter 1:8 (Loss $approx 10.5 " dB"$)
    - รองรับผู้ใช้งานรวม $= 4 times 8 = 32 " ONUs"$
    - การสูญเสียจาก Splitter รวม $= 7.2 + 10.5 = 17.7 " dB"$
  - *การวิเคราะห์จุด Splice และสิ่งที่จะป้องกัน:*
    - มีจุดเชื่อมสายแบบ Fusion Splice ตามระยะดรัม (ทุก 2-3 กม.) และจุดเข้าหัวกระจายสายประมาณ 6 - 8 จุด
    - *เหตุผล:* แต่ละจุด Fusion Splice มี Loss ต่ำเพียง $0.05 " ถึง " 0.1 " dB"$ ขณะที่หัวต่อ Connector สูญเสียถึง $0.5 " ถึง " 1.0 " dB"$
    - *ป้องกันอะไร:* ป้องกัน *Optical Return Loss (ORL) / Back Reflection* แสงสะท้อนกลับเข้าเลเซอร์ต้นทาง (Fresnel Reflection) ซึ่งทำให้เกิดเลเซอร์กระพริบ (Chirp) และ Phase Noise รุนแรง การสไปลซ์ช่วยเชื่อมเนื้อแก้วให้มีดัชนีหักเหต่อเนื่องเป็นเนื้อเดียวกัน
]

#v(4pt)
#formula-box("สูตรคำนวณ Optical Power Budget & Maximum Feeder Distance")[
  $ "Optical Power Budget (OPB)" = P_("Tx") - P_("Rx, sens") $
  $ "Max Allowable Loss" = "OPB" - "Safety Margin" (>= 5 " dB") $
  $ "Total Fixed Losses" = "Splitter Loss" + "Connector Loss" + "Splice Loss" $
  $ "Available Cable Loss" = "Max Allowable Loss" - "Total Fixed Losses" $
  $ L_("feeder, max") = "Available Cable Loss" / alpha_("fiber") $
]
#v(4pt)

#rect(width: 100%, radius: 4pt, fill: rgb("#f1f5f9"), stroke: 1pt + rgb("#64748b"), inset: 8pt)[
  *ตัวอย่างการแทนค่าคำนวณหา Feeder ไกลสุด (มาตรฐาน Class B+):*
  - $P_("Tx") = +1.5 " dBm"$, $P_("Rx, sens") = -28 " dBm"$ $==>$ $"OPB" = 1.5 - (-28) = 29.5 " dB"$
  - กำหนด Safety Margin $= 5 " dB"$ $==>$ $"Max Allowable Loss" = 29.5 - 5 = 24.5 " dB"$
  - Fixed Losses: Splitter (1:4 + 1:8) $= 17.7 " dB"$, Connectors (4 จุด $times$ 0.5 dB) $= 2.0 " dB"$, Splices (6 จุด $times$ 0.1 dB) $= 0.6 " dB"$ $==>$ รวม $= 20.3 " dB"$
  - งบประมาณกำลังแสงที่เหลือสำหรับสายเคเบิล $= 24.5 - 20.3 = 4.2 " dB"$
  - สายใยแก้วมี Loss $alpha = 0.33 " dB/km"$ (ที่ 1310 nm):
    $ L_("feeder, max") = 4.2 / 0.33 approx 12.72 " กม." $
]

#pagebreak()

// ==========================================
// ข้อ 4.2: ขยาย Feeder ด้วย EDFA & กฎเหล็กแอมป์อิ่มตัว
// ==========================================
#section-box("ข้อ 4.2: การขยายระยะ Feeder ด้วย EDFA Repeater และคุณสมบัติ Gain Saturation", color: rgb("#7e22ce"))[
  *1. พฤติกรรมของ EDFA เมื่อทำงานในย่านอิ่มตัว (Input เพิ่ม แต่ Output ไม่เพิ่ม):*
  - *สเปก EDFA ตามสไลด์:* Max Output Power (Saturation Output) $= +17 " dBm"$, Max Input Power $= -6 " dBm"$, Gain $= 23 " dB"$
  - *หลักการทำงาน:* เมื่อกำลังแสงขาเข้า (Input Power) สูง อนุภาค Erbium Ions ในสายใยแก้วจะถูกกระตุ้นปลดปล่อยโฟตอนจนหมดพลังงานจากปั๊มเลเซอร์ (Pump Laser 980/1480 nm) อัตราขยายจะเริ่มตกลง เข้าสู่สภาวะ *Gain Saturation*
  - *ผลลัพธ์เชิงวิศวกรรม:* ไม่ว่าเราจะป้อนสัญญาณขาเข้าแรงขึ้นเท่าใด กำลังแสงขาออกจะถูกล็อกเพดานไว้ที่ $+17 " dBm"$ เสมอ และหากอินพุตแรงเกิน $-6 " dBm"$ จะต้องติดตั้ง *Optical Attenuator* ลดทอนลงมาก่อนเข้า EDFA เพื่อป้องกันความบิดเบี้ยวของสัญญาณ

  *2. การคำนวณระยะ Feeder สูงสุดเมื่อติดตั้ง EDFA:*
  - สัญญาณแสงถูกขยายออกจากต้นทาง Feeder ด้วยกำลังสูงสุด $P_("out") = +17 " dBm"$ (ที่ความยาวคลื่นย่าน C-Band 1550 nm)
  - กำหนดให้กำลังแสงที่ปลายทางของ Feeder ก่อนเข้า Splitter ต้องไม่ต่ำกว่า $-10 " dBm"$ เพื่อให้ผ่าน Splitter 1:32 แล้วเข้า ONU ได้ตามเกณฑ์:
    $ "Allowable Feeder Loss" = +17 " dBm" - (-10 " dBm") = 27 " dB" $
  - สายเคเบิลที่ 1550 nm มีค่าการสูญเสียต่ำมากเพียง $alpha = 0.25 " dB/km"$:
    $ L_("feeder, max (EDFA)") = 27 / 0.25 = 108 " กม." $

  *3. กฎเหล็กและข้อจำกัดสำคัญ (Limits of Amplification - สไลด์หน้า 13):*
  - *เราไม่สามารถใส่ EDFA ต่อขยายระยะทางไปได้เรื่อยๆ อย่างไม่มีที่สิ้นสุด*
  - *เหตุผล:* ทุกครั้งที่สัญญาณผ่าน EDFA ตัวแอมป์จะสร้างสัญญาณรบกวน *ASE (Amplified Spontaneous Emission Noise)* สะสมเพิ่มขึ้นเรื่อยๆ
  - ค่า *OSNR (Optical Signal-to-Noise Ratio)* จะลดลง Span ละ $approx 6 " dB"$ เมื่อผ่านไป 4 Spans ค่า OSNR จะตกลงมาแตะ $21 " dB"$ (เกณฑ์ขั้นต่ำ) และหากขยายต่อ ค่า OSNR จะตกเหลือ $15 " dB"$ ซึ่งต่ำเกินไป ทำให้เครื่องรับเกิด Bit Error Rate (BER) มหาศาลจนระบบล่ม ต้องตั้งสถานี 3R Regenerator เพื่อถอดเป็นไฟฟ้าแล้วยิงใหม่
]

#v(8pt)

// ==========================================
// ข้อ 5: สถาปัตยกรรมโครงข่าย FTTx และเทคโนโลยีสายเคเบิลนำแสง
// ==========================================
#pagebreak()
#section-box("ข้อ 5: สถาปัตยกรรมโครงข่าย FTTx (สถาปัตยกรรม 5 รูปแบบ, อุปกรณ์หลัก, และวิศวกรรมสาย Drop Cable)", color: rgb("#047857"))[
  *1. นิยามและแนวคิดพื้นฐาน (Definition & Core Concept):*
  - *FTTx (Fiber to the 'x')* คือคำศัพท์ที่ใช้อธิบายระดับสถาปัตยกรรมของการลากสายใยแก้วนำแสง (Optical Fiber) ลึกเข้าไปในโครงข่ายการเข้าถึง (Access Network / Last Mile) ว่าไปถึงจุดใด ก่อนที่จะมีการเปลี่ยนผ่าน (Transition) ไปใช้สายตัวนำทองแดง (Copper / Twisted Pair / xDSL) หรือเข้าถึงอุปกรณ์ผู้ใช้โดยตรง
  - มีจุดประสงค์เพื่อขจัดปัญหาคอขวดของสายทองแดงเดิม ขยายแบนด์วิดท์ ยกระดับความเร็ว และลดสัญญาณรบกวนทางแม่เหล็กไฟฟ้า (EMI)

  *2. การจำแนกสถาปัตยกรรมตามจุดสิ้นสุดสายไฟเบอร์ (5 FTTx Architectures):*
  #v(2pt)
  #table(
    columns: (1.2fr, 1.4fr, 1.1fr, 1.8fr),
    inset: 3.5pt,
    fill: (col, row) => if row == 0 { rgb("#059669") } else if calc.even(row) { rgb("#f0fdf4") } else { rgb("#ffffff") },
    align: (left, left, left, left),
    table.header([*รูปแบบ*], [*จุดสิ้นสุดสายไฟเบอร์*], [*ตัวกลางส่งต่อ*], [*คุณลักษณะและการประยุกต์ใช้งาน*]),
    [*FTTH / FTTP* \ (Home / Premises)], [ลากถึงตัวบ้าน / ภายในห้องผู้พักอาศัยโดยตรง], [ไม่มี (สายไฟเบอร์ 100% ถึง ONT)], [แบนด์วิดท์สูงสุด ความหน่วงต่ำ นิยมใช้เทคโนโลยี PON เป็นหลัก],
    [*FTTB* \ (Building / Business)], [ลากถึงตู้พักสายหลักของอาคาร (MDF / Basement)], [Active Ethernet (LAN UTP) หรือ VDSL], [เหมาะสำหรับอาคารชุด คอนโดมิเนียม สำนักงาน (Multi-Tenant Unit - MTU)],
    [*FTTC* \ (Curb)], [ลากถึงริมทางเท้า / ตู้พักสายหน้าบ้าน ($<= 150$ ม.)], [สายทองแดงเดิม (Copper Pair)], [ใช้คู่สายทองแดงระยะสั้นมากเข้าสู่บ้าน ให้ความเร็วสูงกว่า FTTN],
    [*FTTN* \ (Node / Neighborhood)], [ลากถึงตู้ชุมชน / โหนดประจำหมู่บ้าน (หลัก กม.)], [xDSL (VDSL2 / ADSL2+)], [แปลงสัญญาณแสงเป็นไฟฟ้าที่ Node แล้วส่งผ่านสายโทรศัพท์เดิมสู่ผู้ใช้],
    [*FTTE* \ (Exchange)], [สิ้นสุดที่ชุมสายท้องถิ่น (Central Office)], [สายทองแดง Local Loop ทั้งระบบ], [รูปแบบดั้งเดิมของบรอดแบนด์ยุคแรก ข้อจำกัดด้านระยะทางและความเร็วสูง]
  )
  #v(2pt)

  *3. โครงสร้างอุปกรณ์หลักในระบบ FTTx / PON:*
  - *OLT (Optical Line Terminal):* อุปกรณ์ต้นทาง ติดตั้งที่ชุมสาย (Central Office) ทำหน้าที่แปลงทราฟฟิกเครือข่ายเป็นสัญญาณแสง และควบคุมการจัดสรรแบนด์วิดท์ (Dynamic Bandwidth Allocation - DBA)
  - *ODN (Optical Distribution Network):* โครงข่ายตัวกลางระหว่าง OLT ถึง ONU ประกอบด้วยสาย Feeder, สาย Distribution, ตู้พักสาย (FDH/Closure), และ *Passive Optical Splitter* ปราศจากอุปกรณ์อิเล็กทรอนิกส์ที่ต้องใช้ไฟฟ้า
  - *ONU / ONT (Optical Network Unit / Terminal):* อุปกรณ์แปลงสัญญาณแสงกลับเป็นสัญญาณไฟฟ้าส่งให้ผู้ใช้ โดย *ONT* ใช้เรียกอุปกรณ์สำหรับบ้านพักเดี่ยว (FTTH/Single-User) ส่วน *ONU* มักรองรับพอร์ตเชื่อมต่อหลายคู่สายสำหรับอาคารรวม (FTTB/Multi-User)

  *4. วิศวกรรมสาย Drop Cable และรัศมีการดัดโค้ง (Bending Radius Standards):*
  - *ปัญหา Macro-bending Loss:* สาย Single-Mode ทั่วไป (ITU-T G.652D) มีรัศมีดัดโค้งต่ำสุด *30 มม. (3 ซม.)* หากดัดงอแคบกว่านี้ แสงจะรั่วหลุดออกจากแกนแก้ว (Core) ทำให้สัญญาณขาดหาย ไม่สามารถเดินเลี้ยวตามเหลี่ยมมุมผนังห้องหรือขดในกล่องพักสายขนาดเล็กได้
  - *สาย Bend-Insensitive Fiber (ITU-T G.657):* ออกแบบโครงสร้างแกนแก้วแบบพิเศษ (Trench-assisted Profile) กักเก็บแสงได้ดีเยี่ยม:
    - *G.657.A1:* รัศมีดัดโค้งต่ำสุด *10 มม.*
    - *G.657.A2 / B2:* รัศมีดัดโค้งต่ำสุด *7.5 มม.* (มาตรฐานหลักสำหรับสาย FTTx Drop Cable เข้าบ้าน)
    - *G.657.B3:* รัศมีดัดโค้งต่ำสุด *5 มม.* (ดัดเลี้ยวได้แคบที่สุด รองรับมุมเสาและบัวพื้น)
  - *โครงสร้างสาย FTTx Self-Supporting Drop Cable (มาตรฐาน มอก.2166-2548):*
    1. *Steel Messenger Wire:* ลวดเหล็กตีเกลียวสำหรับแขวนโยงข้ามเสาไฟฟ้า รับแรงดึงป้องกันสายตกท้องช้าง
    2. *FRP Strength Members:* ก้าน Fiber Reinforced Plastic 2 เส้น ประกบขนานแกนแก้วเพื่อรับแรงกดและแรงดึง
    3. *LSZH Sheath:* เปลือกนอกผลิตจาก Low Smoke Zero Halogen ปลอดสารพิษ ไม่ลามไฟ และไม่ปล่อยก๊าซกรดกัดกร่อน
]

#v(8pt)

// ==========================================
// สรุปตารางสูตรและพารามิเตอร์สำคัญที่ต้องท่องเข้าห้องสอบ
// ==========================================
#section-box("ตารางสรุปสูตรและค่าพารามิเตอร์มาตรฐานที่ต้องจดจำเข้าห้องสอบ", color: rgb("#0369a1"))[
  #set text(size: 11pt)
  #table(
    columns: (1.3fr, 1.4fr, 1.3fr),
    inset: 4.5pt,
    fill: (col, row) => if row == 0 { rgb("#0284c7") } else if calc.even(row) { rgb("#f0f9ff") } else { rgb("#ffffff") },
    align: (left, left, left),
    table.header(
      [*พารามิเตอร์ / หัวข้อ*],
      [*สูตรคำนวณ*],
      [*ค่ามาตรฐานที่ข้อสอบใช้*]
    ),
    [SONET STS-1 Frame], [$810 " Bytes" times 8 times 8000 " frames/s"$], [51.84 Mbps (9 แถว $times$ 90 คอลัมน์)],
    [Payload Rate STS-1], [$774 " Bytes" times 8 times 8000 " frames/s"$], [49.536 Mbps (86 คอลัมน์ Payload)],
    [Chromatic Dispersion สุทธิ], [$D_("tot") = (D_1 L_1) + (D_2 L_2)$], [SMF $= +18 " ps/(nm"dot"km)"$, DCF $= -90 " ps/(nm"dot"km)"$],
    [Dispersion Limit รับได้สูงสุด], [$-$], [$1600 " ps/nm"$ (เกินกว่านี้ต้องใส่ DCF)],
    [Optical Power Budget (OPB)], [$P_("Tx") - P_("Rx, sens")$], [เช่น $+1.5 - (-28) = 29.5 " dB"$],
    [Link Margin จริง], [$P_("Rx, actual") - P_("Rx, sens")$], [เกณฑ์มาตรฐานต้อง $>= 5 " dB"$],
    [Loss ของ Splitter 1:2], [$-$], [$3.6 " dB"$],
    [Loss ของ Splitter 1:4], [$-$], [$7.2 " dB"$],
    [Loss ของ Splitter 1:8], [$-$], [$10.5 " dB"$],
    [Loss ของ Splitter 1:16], [$-$], [$13.5 " dB"$],
    [Loss ของ Splitter 1:32], [$-$], [$16.7 " dB"$],
    [Fiber Loss ที่ 1310 nm], [$-$], [$0.33 - 0.35 " dB/km"$],
    [Fiber Loss ที่ 1550 nm], [$-$], [$0.20 - 0.25 " dB/km"$ (ย่านต่ำสุด)],
    [Splice Loss (Fusion)], [$-$], [$0.05 - 0.1 " dB/จุด"$],
    [Connector Loss], [$-$], [$0.5 - 1.0 " dB/คู่"$],
    [EDFA Saturation Output], [$-$], [$+17 " dBm"$ (Max Output คงที่)],
    [OSNR ขั้นต่ำของระบบ], [$-$], [$21 " dB"$ (ต่ำกว่านี้ระบบล่มจาก ASE Noise)],
    [FTTH / FTTP], [100% Fiber ถึง ONT], [แบนด์วิดท์สูงสุด โครงสร้าง PON / Active Ethernet],
    [FTTB], [Fiber ถึง MDF/Basement อาคาร], [ต่อสายภายในด้วย LAN UTP หรือ VDSL (เหมาะกับ MTU)],
    [FTTC], [Fiber ถึง Curb (<= 150 m)], [ต่อด้วยสายทองแดงระยะสั้นเข้าบ้าน],
    [FTTN], [Fiber ถึง Node ชุมชน (หลักพันฟุต)], [ต่อด้วยคู่สายทองแดง xDSL (VDSL2)],
    [FTTE], [Fiber ถึง Central Office], [ใช้ Local Loop สายทองแดงเดิมทั้งหมด],
    [Bending Radius G.652D], [รัศมีดัดโค้งต่ำสุด], [$30 " มม."$ (Standard SMF ห้ามดัดแคบ แสงรั่ว)],
    [Bending Radius G.657.A1], [รัศมีดัดโค้งต่ำสุด], [$10 " มม."$ (Bend-Insensitive Class A1)],
    [Bending Radius G.657.A2/B2], [รัศมีดัดโค้งต่ำสุด], [$7.5 " มม."$ (มาตรฐานสาย Drop Cable เข้าบ้าน)],
    [Bending Radius G.657.B3], [รัศมีดัดโค้งต่ำสุด], [$5 " มม."$ (ดัดโค้งได้แคบสุด เข้าเหลี่ยมมุมห้อง)],
    [โครงสร้าง Drop Cable (มอก.2166)], [Messenger + FRP + LSZH], [ทนแรงดึง ไม่ลามไฟ และไร้ควันพิษ]
  )
]
