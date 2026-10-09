# เอกสารการบรรยาย: L4 IoT 169 - ATM and MPLS Switching

> ไฟล์ต้นฉบับ: `L4 IoT 169-ATM MPLS.pdf` | จำนวนหน้าทั้งหมด: 67 หน้า

---

## Slide Page 1

1
High-Speed Networking Technologies
 
Switching
ATM and MPLS
Assoc.Prof.Dr.Chawalit Benjangkaprasert

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 2

ATM (Asynchronous Transfer Mode)  
• ภาวะถ่ายโอนแบบไม่ประสานเวลาหรือเอทีเอ็มเป็นเทคโนโลยีการ
สื่อสารข้อมูลความเร็วสูงที่ใช้ในเครือข่ายโทรคมนาคม
โดยข้อมูลจะ
ถูกแบ่งเป็นเซลล์ขนาดเล็ก และส่งผ่านเครือข่ายแบบไม่ประสานเวลา
2
VIDEO
DATA
VOICE
ภาวะถ่ายโอนแบบไม่ประสานเวลา

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 3

ATM (Asynchronous Transfer Mode) 
•
ATM is the cell relay protocol designed by the ATM 
Forum and adopted by the ITU-T. 
•
ATM has been accepted universally as the transfer mode 
of choice for Broadband Integrated Services Digital 
Networks (BISDN) and others. 
•
ATM can handle any kind of information i.e. voice, data, 
image, text and video in an integrated manner.
3
VIDEO
DATA
VOICE

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 4

Standards 
Based
Why Interest in ATM?
Both LAN and WAN Technology
One 
International 
Standard
Voice/Data/Video
Mbit               Gbit 
Scaleable 
in Speeds
ATM
4

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 7 รายการ]


---

## Slide Page 5

Architecture of an ATM network
ATM is a cell-switched network. The user access devices, called endpoints, are connected 
through a user-to-network interface (UNI) to the switches inside the network.
Network-to-network Interface 
The switches are connected through network-to-network interfaces (NNIs).
5

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 6

Routing with a switch
Switching
6

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 7

•  Application Adaptation Layer (AAL):  Inserts/extracts information
   into 48 bytes payload
•  ATM Layer:  Adds/removes 5 bytes header to payload
•  Physical Layer:  Converts to appropriate electrical 
   or optical format
End 
Station
ATM
 Switch
End 
Station
ATM
Cells
A
A
L
A
T
M
P
H
Y
P
H
Y
A
T
M
P
H
Y
P
H
Y
A
T
M
A
A
L
Functions of Layers
7

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 8

Broadband Protocol Model
Management Plane
User Plane
Signaling
(VBR)
CBR
e.g.
DS1 DS3
Voice
Other VBR
e.g.
VBR Video
CO (VBR)
e.g.
Frame Relay
X.25
Other
Services
Upper Layer 2
AAL
ATM
SONET/SDH
PDH
8
Synchronous Optical Network/Synchronous Digital Hierarchy,      Plesiochronous Digital Hierarchy

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 9

An ATM cell
The basic data unit in an ATM network is called a cell.
Structure of an ATM Cell

### รายละเอียดโครงสร้าง: ATM Cell Structure
เซลล์ ATM มีขนาดคงที่ (Fixed-size cell) เท่ากับ 53 ไบต์ (424 บิต) เสมอ ประกอบด้วย:
- Header: ขนาด 5 ไบต์ (40 บิต)
- Payload Data: ขนาด 48 ไบต์ (384 บิต)
เหตุผลที่ใช้ขนาดคงที่ 53 ไบต์: เป็นข้อตกลงประนีประนอมระหว่างสหรัฐฯ (ต้องการ 64 ไบต์) และยุโรป (ต้องการ 32 ไบต์) เพื่อให้เกิดค่า Latency ต่ำและ Jitter ต่ำ เหมาะกับทั้งข้อมูลเสียงและข้อมูลคอมพิวเตอร์


---

## Slide Page 10

ATM headers
Structure of an ATM Cell
10

### รายละเอียดโครงสร้าง: ATM Header (UNI vs NNI)
1. UNI Header (User-to-Network Interface: ระหว่างโฮสต์กับสวิตช์) - ขนาด 5 ไบต์:
- GFC (Generic Flow Control): 4 บิต (ควบคุมการเข้าถึงสื่อส่งข้อมูลระดับโลคอล)
- VPI (Virtual Path Identifier): 8 บิต (ระบุเส้นทางเสมือน รองรับได้ 256 VPs)
- VCI (Virtual Channel Identifier): 16 บิต (ระบุช่องสัญญาณเสมือน รองรับได้ 65,536 VCs ต่อ VP)
- PT (Payload Type): 3 บิต (แยกประเภทข้อมูล User Data vs Control Data และแจ้งเตือน Congestion)
- CLP (Cell Loss Priority): 1 บิต (0 = ความสำคัญสูง ห้ามดรอป, 1 = ทิ้งได้เมื่อเครือข่ายแออัด)
- HEC (Header Error Control): 8 บิต (ใช้รหัส CRC-8 ตรวจสอบและแก้ไขข้อผิดพลาดเฉพาะส่วน Header 5 ไบต์)

2. NNI Header (Network-to-Network Interface: ระหว่างสวิตช์กับสวิตช์) - ขนาด 5 ไบต์:
- ไม่มีฟิลด์ GFC โดยนำ 4 บิตนั้นไปรวมเข้ากับ VPI ทำให้ VPI มีขนาดเพิ่มเป็น 12 บิต (รองรับได้ถึง 4,096 VPs ในแกนหลัก)
- ส่วนฟิลด์ VCI (16 บิต), PT (3 บิต), CLP (1 บิต), และ HEC (8 บิต) เหมือนกับ UNI ทุกประการ


---

## Slide Page 11

Virtual Circuits
First we have the cable...
Next, ATM Addressing Defines Paths...
Then Channels.
• VP’s
• VC’s
11

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 12

VP
VP
• TP: Transmission link
• VPI:  Virtual  Path Identifier 
–
4,096 at NNI and 256 at UNI
• VCI:  Virtual Channel Identifier 
–
65,536
• Both used to route cells through network
–
Unique on link-by-link basis
–
Interpreted at each switch
Virtual Paths & Virtual Channels
VCs
VCs
VCs
VCs
VP
VP
Physical
Transmission
Link
12

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 13

Concept – VPs and VCs in the Network
Routing Concept in an ATM Network
13

### รายละเอียดแนวคิด: Virtual Paths (VPs) และ Virtual Channels (VCs)
- VC (Virtual Channel): วงจรสื่อสารเสมือนระดับพื้นฐานสำหรับรับส่งข้อมูลระหว่างผู้ใช้
- VP (Virtual Path): ท่อรวม (Bundle) ที่รวบรวมกลุ่มของ VCs หลายช่องทางที่เดินทางไปในทิศทางเดียวกัน
- สวิตช์ระดับ VP (VP Switch): สลับข้อมูลโดยดูและเปลี่ยนเฉพาะค่า VPI แต่คงค่า VCI เดิมไว้ ช่วยให้สวิตช์ทำงานได้เร็วมาก
- สวิตช์ระดับ VC (VPI/VCI Switch): ทำการสลับและแปลทั้งค่า VPI และ VCI


---

## Slide Page 14

ATM Protocol Stack
ATM layers in endpoint devices and switches
The original design of ATM was based on SONET (Synchronous Optical Network): as the 
physical layer carrier:
•
First, the high data rate of SONET
•
Second, in SONET, the boundaries of cells can be clearly defined.
Other Physical Technologies :  ATM does not limit the physical layer to SONET. 
Other technologies such as wireless may be used. 
14

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 15

• ATM protocol is connection-oriented
– Once connection is set up, cells are quickly switched in 
hardware by using VPI/VCI at very high speeds.
• Uses fixed cell length
– Allows switch hardware to be optimized around a fixed 
length cell.
• Uses SONET as physical layer interface
– Scales to high speed and is defined and deployed at Gigabit 
rates.
ATM Switches are easily Scaleable in Speed
15

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 16

• Constant Bit Rate (CBR)
– Used for applications requiring a fixed, guaranteed 
bandwidth, such as voice calls and video 
conferencing. (e.g., T-carrier, E-carrier)
• Realtime Variable Bit Rate (rt-VBR) 
– Like CBR, but the rate can transmit varies (e.g., 
compressed video, voice, multimedia streaming). 
•
Non-realtime Variable Bit Rate (nrt-VBR)
– Examples of nrt-VBR traffic include data traffic and 
non real-time buffered voice and video traffic.(e.g., 
one-way TV distribution)
Concept - ATM Service Categories
16

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 17

• Available Bit Rate (ABR)
– For applications that can adjust their data rate based 
on available network capacity, such as file transfers 
(bursty LAN traffic) and e-mail.
• Unspecified Bit Rate (UBR)
– Used for best-effort traffic like email and file 
downloads that do not require strict QoS.
Concept - ATM Service Categories
17

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 18

Revised ATM Service Categories
Class
Description
Example
CBR
Constant Bit Rate
T-carrier, E-carrier
RT-VBR
Real Time Variable Bit 
Rate
Real-time 
videoconferencing
NRT-VBR
Non-real-time Variable Bit 
Rate
Multimedia email
ABR
Available Bit Rate
Browsing the Web
UBR
Unspecified Bit Rate
Internet access 
file download
18

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 19

Connection Establishment and Release
• ATM uses two types of connections : PVC and SVC
• PVC : a permanent virtual-circuit is established between two 
endpoints by the network provider. The VPIs and VCIs are 
defined for the permanent connection and the values are 
entered for the tables of each switch.
• SVC : In a switched virtual-circuit connection, each time an 
endpoint wants to make a connection with another endpoint, a 
new virtual circuit must be established. ATM cannot do the job 
by itself, but needs the network layer addresses and the 
services of another protocol (such as IP).
19

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 20

•
Pre-established connections
•
Permanent
•
No signaling required
PVC - Manual Set Up
VPI/VCI
14/1055
14/1055
9/47
9/47
Console or
NMS GUI
20

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 21

•
Uses UNI 3.0/3.1 signaling
– VPI/VCI = 0/5
•
Automatic
•
Transparent to User
SVC - Automatic Set Up
Terminal A
Terminal B
Connect to B
Connect to B
Connect to B
OK
OK
OK
OK
21
UNI 3.0/3.1 signaling with VPI/VCI 0/5 is standard signaling protocol for 
setting up connections in an ATM networks.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 5 รายการ]


---

## Slide Page 22

•  The AAL defines a sublayer, called a segmentation 
and reassembly (SAR) sublayer, and  called the 
convergence sublayer (CS).
•  ATM defines four versions of the AAL: AAL1, 
AAL2, AAL3/4, and AAL5.
• The common versions today are AAL1 and AAL5. 
The first is used in streaming audio and video 
communication; the second, in data communications.
Application Adaptation Layer (AAL)
22

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 23

AAL1
Supports applications that transfer information at constant bit rates such as video and voice.
It allows ATM to connect existing digital telephone networks such as voice channels and T lines.
23

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 24

AAL2
It is used for low bit rate traffic and short-frame traffic such as audio, video. 
Example of AAL2 use is in mobile telephony.
24

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 25

AAL3/4
AAL3 was intended to support connection-oriented data services and
AAL4 to support connectionless services.
25

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 26

AAL5
AAL5 is less complex than type 3/4 by reduce transmission overhead, and  
popular used in ATM LAN application.
26

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 27

AAL5
27

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 28

AAL5
28

### รายละเอียดสไลด์: ATM Switches และการสลับ VPI/VCI (Cisco Systems)
หลักการสลับเซลล์:
- สวิตช์ ATM อาศัย Connection Identifiers (VPI/VCI) ในการส่งต่อเซลล์
- การสลับเซลล์ใช้การแปลค่า (Label Swapping/Translation) ของ VPI/VCI บนตารางสวิตชิ่ง
- ค่า VPI/VCI มีผลเฉพาะระดับพอร์ต/อินเทอร์เฟซนั้นๆ (Interface-local) สามารถใช้เลขซ้ำกันบนพอร์ตต่างกันได้โดยไม่ชนกัน
ตารางตัวอย่างการสลับ (Switching Table):
- พอร์ต 1 VPI/VCI 29 <--> พอร์ต 2 VPI/VCI 45 (วงจรเสมือนคู่ที่ 1)
- พอร์ต 1 VPI/VCI 64 <--> พอร์ต 3 VPI/VCI 29 (วงจรเสมือนคู่ที่ 2 สังเกตว่าเลข 29 ใช้ซ้ำที่พอร์ต 3 ได้)


---

## Slide Page 29

Classes of ATM Service (ITU)
Required
Variable
Constant
CONNECTION ORIENTED
CLASS B
CLASS C
CLASS D
CLASS A 
Not Required
Connection Mode
CONNECTION-LESS
Timing Relation Between
Source & Destination
Bit Rate
29

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 20 รายการ]


---

## Slide Page 30

• ATM is a new switching and multiplexing 
technique designed for broadband, multi-
service communication networks.
ATM
VIDEO
DATA
VOICE
30
จุดเด่น คือ รองรับข้อมูลหลายรูปแบบ รับประกันคุณภาพบริการ และการส่ง
ข้อมูลในรูปแบบเซลล์ขนาดคงที่ Low Latency and Minimal Jitter

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 4 รายการ]


---

## Slide Page 31

ATM Network Interfaces
Service 
Provider
Customer
Premises
WAN
B-ICI
WAN
Public NNI
Public
UNI
Private
NNI
Private
UNI
Private
UNI
Router
Remote
Site
31
Broadband Inter-Carrier Interface (B-ICI)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 15 รายการ]


---

## Slide Page 32

ATM Network Interfaces
Service 
Provider
Customer
Premises
WAN
B-ICI
WAN
Public NNI
Public
UNI
Private
NNI
Private
UNI
Private
UNI
Router
Remote
Site
32
Broadband Inter-Carrier Interface (B-ICI)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 14 รายการ]


---

## Slide Page 33

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
33

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 35 รายการ]


---

## Slide Page 34

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
34

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 17 รายการ]


---

## Slide Page 35

STS-48c Frame Structure
144 Bytes
4160 Bytes
2.48832 Gbps
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
2.39616 Gbps
H
H
…
H
F
i
x
e
d
  
S
t
u
f
f
…
15
Bytes
4176 Bytes
35

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 27 รายการ]


---

## Slide Page 36

36

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 37

•
ATM Forum Documents - www.atmforum.com
•
GR-1248 - Generic Requirements for Operations on ATM 
NEs
•
I.363 & 365 - ATM Adaptation Layer (AAL) Sublayer
 
 
 
 
 
 
REFERENCES
37

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 14 รายการ]


---

## Slide Page 38

Multi-Protocol Label Switching (MPLS)
 
38
https://www.cisco.com/c/dam/global/fr_ca/training-events/pdfs/Intro_to_mpls.pdf
https://www.geeksforgeeks.org/computer-networks/multi-protocol-label-switching-mpls/
https://www.rfwireless-world.com/terminology/mpls-label-switching-vs-ip-packet-switching

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 39

Multi-Protocol Label Switching (MPLS) is an 
advanced packet-forwarding technique used in 
modern networks. Instead of making routers 
look into complex Layer 3 routing tables for 
every IP packet, MPLS uses labels for 
forwarding decisions. These labels create pre-
defined, efficient paths across the network, 
which enhances speed, scalability and traffic 
management.
39

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 40

40
Note: MPLS lies between Layer 2 (Data Link) and Layer 3 (Network Layer) of 
the OSI model, which is why it is often referred to as a Layer 2.5 protocol.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 41

41
https://www.iptp.net/blog/what-is-mpls-multiprotocol-label-switching/

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 42

Why MPLS
• Traditional IP routing involves a long lookup process in 
routing tables.
• MPLS simplifies forwarding by assigning a short fixed-
length label to each packet.
• This ensures: Faster packet delivery, better support for 
Quality of Service (QoS) & easier traffic engineering 
and Virtual Private Networks (VPNs).
MPLS Header
• The MPLS header is 32 bits long and is inserted 
between the Layer 2 and Layer 3 headers. It contains 
the following fields:
42

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 43

43
MPLS Header

### รายละเอียดโครงสร้าง: MPLS Shim Header (ขนาด 32 บิต / 4 ไบต์)
MPLS ทำงานที่เลเยอร์ 2.5 โดยแทรก Header ขั้นกลางระหว่าง Layer 2 (DLL เช่น Ethernet Header) และ Layer 3 (IP Header)
ประกอบด้วย 4 ฟิลด์หลัก (0 ถึง 31 บิต):
1. Label (บิต 0 - 19): ขนาด 20 บิต (กำหนดหมายเลขป้ายสำหรับใช้ส่งต่อแพ็กเก็ต ค่าได้ถึง 2^20 หรือ 1,048,576 ค่า)
2. Exp / TC (Traffic Class) (บิต 20 - 22): ขนาด 3 บิต (ใช้สำหรับจัดลำดับความสำคัญ QoS / Class of Service)
3. S / BoS (Bottom of Stack) (บิต 23): ขนาด 1 บิต (1 = ป้ายนี้เป็นป้ายสุดท้ายใต้สุดของสแต็ก ถัดไปคือ IP Header, 0 = ยังมีป้าย MPLS อื่นซ้อนอยู่ด้านล่าง)
4. TTL (Time to Live) (บิต 24 - 31): ขนาด 8 บิต (นับจำนวน Hop ป้องกันแพ็กเก็ตวิ่งวนลูป คัดลอกมาจาก IP TTL)


---

## Slide Page 44

An MPLS label, used for label switching, is inserted between the 
Layer 2 header and the Layer 3 header. It is 4 octets (32 bits) in size 
and consists of the following fields:
MPLS Label = { Label (20 bits) , EXP or TC (3 bits), S (1 bit), 
TTL (8 bits) }
•
Label (20 bits): The actual label used for switching. Values from 0 
to 15 are reserved.
•
EXP (3 bits): Experimental bits, often used to indicate Quality of 
Service (QoS) or priority for the label. Also known as Traffic Class 
(TC).
•
S (1 bit): Indicates whether the label is the last one in the stack. A 
value of 1 indicates it’s the bottom label.
•
TTL (8 bits): Time to Live.
44

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 45

Multi-Protocol Label Switching (MPLS) is an 
advanced packet-forwarding technique used in 
modern networks. Instead of making routers 
look into complex Layer 3 routing tables for 
every IP packet, MPLS uses labels for 
forwarding decisions. These labels create pre-
defined, efficient paths across the network, 
which enhances speed, scalability and traffic 
management.
45

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 46

46
Label Stacking

### รายละเอียดแนวคิด: MPLS Label Stacking
MPLS รองรับการซ้อนป้ายกำกับหลายชั้น (Label Stacking) โดยใช้วิธี Last-In First-Out (LIFO):
- ป้ายบนสุด (Outer Label): ใช้สำหรับนำทางข้าม Core Network หรือทำ MPLS TE (Traffic Engineering) Tunnel
- ป้ายชั้นใน (Inner Label): ใช้สำหรับระบุ VPN Service หรือ Customer ID (เช่นใน BGP/MPLS IP VPN)
- ตัวระบุบิต S (Bottom of Stack): ป้ายบนสุดจะมี S=0 ส่วนป้ายล่างสุดติดกับ IP จะมีบิต S=1


---

## Slide Page 47

• Multiple labels can be applied to a single 
packet. 
• The label closest to the Layer 2 header is 
known as the “top label or outer label”, 
while the label closer to the Layer 3 
header is the “bottom label or inner label”.
47

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 48

48
MPLS Network Architecture

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 49

49
MPLS Network Architecture

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 50

MPLS network consists of different router types used for 
switching and routing MPLS packets between end systems 
(hosts):
• CE Routers (Customer Edge): Located at the edge of 
the network, connecting to customer networks.
• PE Routers (Provider Edge): Located at the edge of 
the service provider’s network.
• P Routers (Provider): Core routers within the service 
provider’s network.
50

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 51

51
MPLS Operations: Push, Swap, and Pop

### รายละเอียดการทำงาน: MPLS Operations (Push, Swap, Pop)
1. Push (เพิ่มป้าย): สวิตช์/เราเตอร์เพิ่มป้าย MPLS ใหม่เข้าไปบนหัวแพ็กเก็ต (กระทำโดย Ingress LER เมื่อรับ IP แพ็กเก็ตเข้ามา หรือโดย Core Router เมื่อต้องการซ้อน Tunnel)
2. Swap (สลับป้าย): Core Router (LSR) อ่านค่าป้ายบนสุด ค้นหาตาราง LFIB แล้วถอดป้ายเดิมออกแทนที่ด้วยป้ายใหม่แล้วส่งออกไป
3. Pop (ถอดป้าย): ถอดป้าย MPLS บนสุดออก เผยให้เห็นป้ายชั้นในหรือ IP Packet ดั้งเดิม (กระทำโดย Egress LER หรือกระทำโดยเราเตอร์ก่อนตัวสุดท้ายด้วยเทคนิค Penultimate Hop Popping: PHP)


---

## Slide Page 52

52
MPLS Operations: Push, Swap, and Pop

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 53

MPLS label switching relies on three basic operations:
• Push: The ingress (entry point) CE (Customer Edge) 
router assigns a label to the incoming packet.
• Swap: Routers within the Label Switched Path (LSP) 
swap the incoming label for an outgoing label.
• Pop: The egress (exit point) router removes the label 
from the packet before forwarding it to its final 
destination. This happens when the destination has been 
reached and the label is no longer needed.
53

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 54

54
Label Switching Example
label switching example between Station A and Station B:
LER
LER

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 55

Router Incoming Label Incoming Interface Destination network Outgoing interface Outgoing Label 
R1        -                   e0                     172.16.1  
S1  
      6
R2        6                  S0 
 
172.16.1          
S2   
      11
R3        11                S0 
 
172.16.1              S3 
      7
R4        7                  S1 
 
172.16.1               e0 
       -
55

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 56

56

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 57

57

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 58

58

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 59

59

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 60

LERs (Label Edge Routers) and LSRs (Label 
Switching Routers) maintain tables:
• FEC (Forwarding Equivalence Class) 
table: {Label In, Destination IP Address, Label 
Out, Interface}
• LIB (Label Information Base) table: {Label 
In, Label Out, Interface }
• An LSR combines the functionalities of both a 
switch and a router.
60

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 61

•
Provider Edge (PE) Router: Router at the edge of the MPLS 
provider’s network; adds/removes labels from packets.
•
Customer Edge (CE) Router: Router at the customer’s network 
edge that communicates with PE routers.
•
Label Switch Router (LSR): Router inside the MPLS core that 
understands and processes labels.
•
Ingress LSR: First router that receives the packet from CE and 
pushes (adds) the MPLS header.
•
Intermediate LSR: Routers that swap labels as packets move 
across the MPLS path.
•
Egress LSR: The last router in the MPLS domain that pops 
(removes) the MPLS header before sending the packet to the CE.
•
Push, Pop, Swap: Push -> Add a label, Pop -> Remove a label. & 
Swap -> Replace an existing label with a new one.
61
Key Terminologies in MPLS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 62

• Ingress Stage (Push): CE sends an IP packet to the PE 
(Ingress LSR). Ingress PE assigns a label based on the 
destination and attaches an MPLS header.
• Core Stage (Swap): Intermediate LSRs forward the 
packet based only on the label. They swap the label 
with a new one as defined in their Label Forwarding 
Information Base (LFIB).
• Egress Stage (Pop): The Egress PE removes the MPLS 
header and forwards the original IP packet to the CE 
router.
62
Working of MPLS (Forwarding Process)

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 63

• Protocol Agnostic: MPLS can forward any data across 
a network, not just IP traffic. It operates based on 
labels, not destination IP addresses.
• Multi-Protocol Support: It can transport various 
protocols, including ATM, SONET, and Ethernet.
• Integrated Voice and Data: Voice and data can be 
transported on the same network infrastructure.
• Efficient Bandwidth Utilization: MPLS can improve 
bandwidth utilization through traffic engineering.
• Network Resiliency: MPLS supports fast re-route 
mechanisms for improved network resilience.
63
Benefits (Advantages) of MPLS Label Switching

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 64

• Expensive to implement compared to IP routing.
• Complexity in configuration and management.
• Security is weaker than encrypted VPN solutions.
• Less suitable for small-scale networks.
• Multiprotocol Label Switching (MPLS) Routing.
64
Disadvantages of MPLS

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 65

65
IP Packet Switching

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 66

Feature
MPLS Label Switching
✓Routes packet based on a 20-bit label.
IP Packet Switching
➢Routes packet based on a 32-bit IP address.
Path Establishment
MPLS Label Switching
✓Establishes a dedicated path known as an LSP (Label Switching 
Path) before data flow.
IP Packet Switching
➢Doesn’t establish a dedicated path. Data is transmitted as datagrams, 
routed based on IP addresses.
66
Difference Between Label Switching (MPLS) and IP Switching

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 67

Forwarding Table
MPLS Label Switching
✓Each router builds an LFIB (Label Forwarding Information Base) table 
using a protocol like LDP (Label Distribution Protocol).
IP Packet Switching
➢Stores an IP routing table.
                                                      end
67

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---
