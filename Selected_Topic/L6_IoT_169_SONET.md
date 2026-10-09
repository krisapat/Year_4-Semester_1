# เอกสารการบรรยาย: L6 IoT 169 - SONET/SDH Architecture and Overheads

> ไฟล์ต้นฉบับ: `L6 IoT 169_SONET.pdf` | จำนวนหน้าทั้งหมด: 59 หน้า

---

## Slide Page 1

SONET/SDH
1
Assoc.Prof.Dr.Chawalit Benjangkaprasert
Optical Networking

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 2

SONET was developed by ANSI;
SDH was developed by ITU-T.
Note
Synchronous Optical Network (SONET) และ 
Synchronous Digital Hierarchy (SDH)
เป็นเทคโนโลยีที่ใช้ในการส่งข้อมูลปริมาณมากผ่านใยแก้วน าแสง
2

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 3

Concepts
SONET/SDH is a synchronous network using 
synchronous TDM multiplexing.
All clocks in the system are locked to a master 
clock.
This is used as a transport network to carry loads 
from other WANs.
3

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 4

ARCHITECTURE
The architecture of a SONET system :  signals, 
devices, and connections.
Signals
    SONET defines a hierarchy of electrical signaling levels 
called synchronous transport signals (STSs). Each STS 
level (STS-1 to STS-768) supports a certain data rate. The 
corresponding optical signals are called optical carriers 
(OCs). 
    SDH specifies a similar system called a synchronous 
transport module (STM). 
4

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 16 รายการ]


---

## Slide Page 5

Table 17.1  SONET/SDH rates
5
STS-768                   OC-768                    39813.12 Mbps           STM-256
 
STS-3072                 OC-3072 
159252.48 Mbps  
STM-1024

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 6

ARCHITECTURE
Devices
    Figure 17.1 shows a simple link using SONET devices. 
SONET transmission relies on three basic devices: STS 
multiplexers/demultiplexers, 
regenerators, 
add/drop 
multiplexers and terminals.
6

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 7

Figure 17.1  A simple network using SONET equipment
7

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 8

ARCHITECTURE
STS Multiplexer/Demultiplexer
    They provide the interface between an electrical tributary 
network and the optical network. An STS multiplexer 
multiplexes signals from multiple electrical sources and 
creates the corresponding OC signal. An STS demultiplexer 
demultiplexes an optical OC signal into corresponding 
electric signals.
Regenerator
    A regenerator is a repeater that takes a received optical 
signal (OC-n), demodulates it into the corresponding electric 
signal (STS-n), regenerates the electric signal, and finally 
modulates the electric signal into its correspondent OC-n 
signal.
8

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 9

ARCHITECTURE
Add/drop Multiplexer
    Add/drop multiplexers allow insertion and extraction of 
signals. An add/drop multiplexer(ADM) can add STSs 
coming from different sources into a given path or can 
remove a desired signal from a path and redirect it without 
demultiplexing the entire signal.
Terminals
    For example, in the Internet, a terminal can be a router 
that needs to send packets to another router at the other 
side of a SONET network.
9

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 10

ARCHITECTURE
Connections
    The devices defined in the previous section are 
connected using sections, lines, and paths.
Sections
    A section is the optical link connecting two neighbor 
devices: 
multiplexer 
to 
multiplexer, 
multiplexer 
to 
regenerator, or regenerator to regenerator.
Lines
    A line is the portion of the network between two 
multiplexers: STS multiplexer to add/drop multiplexer.
Paths
    A path is the end-to-end portion of the network between 
two STS multiplexers.
10

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 11

SONET defines four layers:
path, line, section, and photonic.
Note
They correspond to both the physical and the data link 
layers.
SONET LAYERS
11

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 15 รายการ]


---

## Slide Page 12

Path Layer
    The path layer is responsible for a signal from 
optical source to optical destination.
Line Layer
    The line layer is responsible for the movement 
of a signal across a physical line.
Section Layer
    The section layer is responsible for the 
movement of a signal across a physical section.
Photonic Layer
    The photonic layer corresponds to the physical 
layer of the OSI model.
SONET LAYERS
12

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 13

Figure 17.2  SONET layers compared with OSI or the Internet layers
13

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 14

Figure 17.3  Device–layer relationship in SONET
14

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 15

SONET FRAMES
Each synchronous transfer signal STS-n is composed 
of 8000 frames. Each frame is a two-dimensional 
matrix of bytes with 9 rows by 90 × n columns.
    
    For example, STS-1 frame is 9 rows by 90 
columns (810 bytes), and an STS-3 is 9 rows by 
270 columns (2430 bytes). Figure 17.4 shows the 
general format of an STS-1 and an STS-n.
15

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 31 รายการ]


---

## Slide Page 16

Figure 17.4  An STS-1 and an STS-n frame
16

### รายละเอียดโครงสร้างเฟรม: SONET STS-1 Frame Structure
- โครงสร้างเป็นเมทริกซ์ 2 มิติ ขนาด 9 แถว (Rows) x 90 คอลัมน์ (Columns) = 810 ไบต์ต่อเฟรม
- อัตราการส่งเฟรมคงที่: 8,000 เฟรมต่อวินาที ทำให้ระยะเวลาของ 1 เฟรมคือ 125 ไมโครวินาที (us) พอดี
- การคำนวณ Bit Rate ของ STS-1:
  810 ไบต์/เฟรม x 8 บิต/ไบต์ x 8,000 เฟรม/วินาที = 51.840 Mbps
- สำหรับ STS-n: มีขนาด 9 แถว x (90 x n) คอลัมน์ และ Bit Rate = n x 51.84 Mbps (เช่น STS-3 = 155.52 Mbps, STS-12 = 622.08 Mbps)


---

## Slide Page 17

Figure 17.5  STS-1 frames in transmission
17

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 18

SONET FRAMES
For each frame the bytes are transmitted from the left to the 
right, top to the bottom. For each byte, the bits are 
transmitted from the most significant to the least significant 
(left to right).
An 
STS-1 
signal 
can 
carry 
774 
voice 
channels 
simultaneously (810 minus required bytes for overhead).
18

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 19

A SONET STS-n
signal is transmitted at 
8000 frames per second.
Note
19

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 20

Each byte in a SONET frame can carry a 
digitized voice channel.
Note
20

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 21

Find the data rate of an STS-1 signal.
Solution
STS-1, like other STS signals, sends 8000 frames per 
second. Each STS-1 frame is made of 9 by (1×90) bytes. 
Each byte is made of 8 bits. The data rate is
Example 1
21


---

## Slide Page 22

Find the data rate of an STS-3 signal.
Solution
STS-3, like other STS signals, sends 8000 frames per 
second. Each STS-3 frame is made of 9 by (3×90) bytes. 
Each byte is made of 8 bits. The data rate is
Example 2
22


---

## Slide Page 23

In SONET, the data rate of an STS-n
signal is n times the data rate 
of an STS-1 signal.
Note
23

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 24

In SONET, 
the duration of any frame is 125 μs.
Note
24

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 25

STS-1 Frame Format
The basic format of an STS-1 frame is shown in Figure 17.6. 
As before, a SONET frame is a matrix of 9 rows of 90 bytes 
(octets) each, for a total of 810 bytes.
    The first three columns of the frame are used for section 
and line overhead. The upper three rows of the first three 
columns are used for section overhead (SOH). The lower six 
are line overhead (LOH). The rest of the frame is called the 
synchronous payload envelope (SPE). It contains user data 
and path overhead (POH) needed at the user data level. 
25


---

## Slide Page 26

Figure 17.6  STS-1 frame overheads
26

### รายละเอียดส่วนควบคุม: STS-1 Overheads (Transport & Path Overheads)
ใน 90 คอลัมน์ของ STS-1 แบ่งออกเป็น:
1. Transport Overhead (3 คอลัมน์แรก x 9 แถว = 27 ไบต์):
   - Section Overhead (3 แถวบน x 3 คอลัมน์ = 9 ไบต์): ควบคุมการสื่อสารระหว่างอุปกรณ์ SONET ที่อยู่ติดกัน (Regenerator/Add-Drop Multiplexer) มีไบต์ตรวจเช็กและซิงก์ เช่น A1, A2, B1 (BIP-8)
   - Line Overhead (6 แถวล่าง x 3 คอลัมน์ = 18 ไบต์): ควบคุมการส่งข้อมูลระหว่างอุปกรณ์ระดับ Multiplexer (STS Multiplexer / ADM) รวมถึงพอยน์เตอร์ H1, H2, H3 และ B2 (BIP-8)
2. Synchronous Payload Envelope (SPE) (87 คอลัมน์หลัง x 9 แถว = 783 ไบต์):
   - Path Overhead (POH) (1 คอลัมน์ x 9 แถว = 9 ไบต์): ควบคุมการส่งข้อมูลแบบ End-to-End ตั้งแต่ต้นทางจนถึงปลายทาง (ไบต์ J1, B3, C2, G1)
   - User Payload Data: เหลือ 86 คอลัมน์ x 9 แถว = 774 ไบต์ (คำนวณเป็น Payload Rate = 774 x 8 x 8000 = 49.536 Mbps)


---

## Slide Page 27

Figure 17.7  STS-1 frame: section overhead
27

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 28

Section overhead is recalculated for 
each SONET device
(regenerators and multiplexers).
Note
28

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 29

Figure 17.8  STS-1 frame: line overhead
29

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 30

Figure 17.9  STS-1 frame: path overhead
30

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 31

Path overhead is only calculated for 
end-to-end (at STS multiplexers).
Note
31

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 32

What is the user data rate of an STS-1 frame and STM-1 
frame (without considering the overheads)?
Solution
The user data part in an STS-1 frame is made of 9 rows 
and 86 columns. So we have
Example 3
32


---

## Slide Page 33

STS MULTIPLEXING
In SONET, frames of lower rate can be synchronously 
time-division multiplexed into a higher-rate frame. 
For example, three STS-1 signals (channels) can be 
combined into one STS-3 signal (channel), four 
STS-3s can be multiplexed into one STS-12, and so 
on.
Byte Interleaving
Concatenated Signal
Add/Drop Multiplexer
33

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 52 รายการ]


---

## Slide Page 34

Figure 17.12  STS multiplexing/demultiplexing
34

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 35

In SONET, all clocks in the network are 
locked to a master clock.
Note
35

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 36

Byte Interleaving
Synchronous TDM multiplexing in SONET is 
achieved by using byte interleaving.
    For example, when three STS-1 signals are 
multliplexed into one STS-3 signal, each set of 3 
bytes in the STS-3 signal is associated with 1 byte 
from each STS-1 signal.
Byte interleaving also preserves the corresponding section 
and line overhead as shown in Figure 17.14. As the figure 
shows, the section overheads from three STS-1 frames are 
interleaved together to create a section overhead for an STS-
1 frame.
36


---

## Slide Page 37

Figure 17.13  Byte interleaving
37

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 38

Figure 17.14  An STS-3 frame
38

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 39

Concatenated Signal
    Sometimes, we have a signal with one STS-n signal 
(channel) that cannot be demultiplexed into n STS-1 signals. 
To specify that the signal cannot be demultiplexed, the suffix 
c (for concatenated) is added to the name of the signal.
39


---

## Slide Page 40

Figure 17.15  A concatenated STS-3c signal
40

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 41

An STS-3c signal can carry 
44 ATM cells as its SPE.
Note
41

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 42

STS-3c Frame Structure
9 Bytes
261 Bytes
155.52 Mbps
3 Bytes
6 Bytes
Section 
Overhead
Line 
Overhead
P
a
t
h
 O
v
e
r
h
e
a
d
ATM Payload
149.76 Mbps
H
H
…
…
H
H
ATM Cell
53 Bytes
42

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 16 รายการ]


---

## Slide Page 43

STS- 1 Frame with ATM
3 Bytes
87 Bytes
51.84 Mbps
3 Bytes
6 Bytes
Section 
Overhead
Line 
Overhead
F
I
X
 
S
t
u
f
f
1X9 
Byte
F
I
X
 
S
t
u
f
f
1X9 
Byte
P
a
t
h
 O
v
e
r
h
e
a
d
1X9 
Byte
ATM 
Payload
48.384
Mbps
43

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 33 รายการ]


---

## Slide Page 44

Add/Drop Multiplexer
An add/drop multiplexer operates at the line layer. 
The add/drop multiplexer (ADM) only removes the 
corresponding bytes and replaces them with the 
new bytes (including the bytes in the section and 
line overhead). 
44


---

## Slide Page 45

Figure 17.16  Dropping and adding STS-1 frames in an add/drop multiplexer
45

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 46

VIRTUAL TRIBUTARIES
SONET is designed to carry broadband payloads. 
Current digital hierarchy data rates, however, are 
lower than STS-1. To make SONET backward-
compatible with the current hierarchy, its frame design 
includes a system of virtual tributaries (VTs). A virtual 
tributary is a partial payload that can be inserted into 
an STS-1. 
Types of VTs
46

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 65 รายการ]


---

## Slide Page 47

Figure 17.25  Virtual tributaries
47

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 48

Figure 17.26  Virtual tributary types
48

### รายละเอียดชนิดของ Virtual Tributary (VT Types)
Virtual Tributary ออกแบบมาเพื่อบรรทุกสัญญาณระบบดั้งเดิม (TDM Tributaries) เข้าสู่เฟรม SONET:
1. VT1.5: อัตราเร็ว 1.728 Mbps (ออกแบบมารองรับสัญญาณ DS-1 หรือ T-1 ขนาด 1.544 Mbps ของอเมริกา)
2. VT2: อัตราเร็ว 2.304 Mbps (ออกแบบมารองรับสัญญาณ E-1 หรือ CEPT-1 ขนาด 2.048 Mbps ของยุโรป)
3. VT3: อัตราเร็ว 3.456 Mbps (ออกแบบมารองรับสัญญาณ DS-1C ขนาด 3.152 Mbps)
4. VT6: อัตราเร็ว 6.912 Mbps (ออกแบบมารองรับสัญญาณ DS-2 ขนาด 6.312 Mbps)


---

## Slide Page 49

SONET multiplexing Hierarchy
◼All services below DS3 rate are transported in the VT structure. 
49

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 50

SONET NETWORKS
Using SONET equipment, we can create a SONET 
network that can be used as a high-speed backbone 
carrying loads from other networks such as optical data 
transmission, 5G networks and so on. 
We can roughly divide SONET networks into three 
categories: linear, ring, and mesh networks.
Linear Networks
Ring Networks
Mesh Networks
50

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 56 รายการ]


---

## Slide Page 51

Figure 17.17  Taxonomy of SONET networks
51

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 52

Figure 17.18  A point-to-point SONET network
52

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 53

Figure 17.19  A multipoint SONET network
53

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 54

Figure 17.20  Automatic protection switching in linear networks
54

### รายละเอียดสถาปัตยกรรมโครงข่าย SONET และระบบกู้คืน (Protection Switching)
1. Point-to-Point / Linear Network:
   - ใช้ระบบ APS (Automatic Protection Switching) แบบ 1+1 (ส่งข้อมูลขนานไปทั้งสายหลักและสายสำรอง สลับทันทีเมื่อสายขาด) หรือ 1:1 / 1:n (สายสำรองใช้แชร์เมื่อสายหลักขาด)
2. UPSR (Unidirectional Path-Switched Ring):
   - โครงข่ายวงแหวนใยแก้วนำแสง 2 เส้น ข้อมูลวิ่งคนละทิศทาง (ตามเข็มและทวนเข็ม)
   - สลับสายระดับ Path เมื่อสัญญาณขาด สลับเสร็จภายใน 50 ms
3. BLSR (Bidirectional Line-Switched Ring):
   - มีทั้งแบบ 2-Fiber BLSR และ 4-Fiber BLSR การสลับข้อมูลทำที่ระดับ Line ช่วยให้แชร์แบนด์วิดท์รอบวงแหวนได้มีประสิทธิภาพสูงสุด


---

## Slide Page 55

Figure 17.21  A unidirectional path switching ring
55

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 56

Figure 17.22  A bidirectional line switching ring
56

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 57

Figure 17.23  A combination of rings in a SONET network
57

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 58

Figure 17.24  A mesh SONET network
58

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 59

THE END
59
https://www.cisco.com/c/en/us/tech/optical/synchronous-optical-
network-sonet/index.html


---
