# เอกสารการบรรยาย: L5 WiFI in Practice - Interference, RSSI, SNR and Spectrum

> ไฟล์ต้นฉบับ: `L5 WiFI in Practice.pdf` | จำนวนหน้าทั้งหมด: 37 หน้า

---

## Slide Page 1

14.1
เทคนิคการเลือกใช้ช่อง Wi-Fi

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 6 รายการ]


---

## Slide Page 2

14.2
Interference, RSSI, and SNR in Wi-Fi 
networks

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 3

14.3
Understanding RSSI and SNR in Wireless 
Networks for Effective Communication 
and Connectivity Improvement


---

## Slide Page 4

14.4
Understanding RSSI and SNR
In a wireless LAN, devices transmit at 
power levels between 100 mW (20 dBm) 
and 1 mW (0 dBm). This transmission 
power, known as EIRP, is regulated by 
regional authorities. As the RF signal travels 
to the receiver, the received signal strength 
typically ranges from 0 dBm to about -100 
dBm.


---

## Slide Page 5

14.5
Understanding RSSI and SNR
This measurement is known as the Received 
Signal Strength Indicator (RSSI). RSSI values 
indicate signal strength, with 0 dBm being the 
strongest and -100 dBm being the weakest.
Each receiver has a sensitivity threshold. If the 
signal strength is above this threshold, the 
receiver can properly process the signal and 
extract useful information. However, if the signal 
strength falls below this level, the device cannot 
interpret the signal correctly.


---

## Slide Page 6

14.6
Received Signal Strength

### รายละเอียดกราฟ: Received Signal Strength, RSSI, Receiver Sensitivity และ Noise Floor
- RSSI (Received Signal Strength Indicator): ระดับความแรงสัญญาณที่ภาครับวัดได้ มีหน่วยเป็น dBm (ค่าเป็นลบ ยิ่งใกล้ 0 ยิ่งแรง เช่น -40 dBm แรงมาก, -85 dBm อ่อนมาก)
- Noise Floor: ระดับสัญญาณรบกวนพื้นหลังในสิ่งแวดล้อม (โดยทั่วไปอยู่ที่ประมาณ -95 ถึง -100 dBm)
- Receiver Sensitivity Level: ขีดจำกัดความไวของภาครับ (เช่น -79 dBm) หากสัญญาณตกลงไปต่ำกว่าจุดนี้ ภาครับจะไม่สามารถถอดรหัสสัญญาณได้ (กลายเป็น Unintelligible เกิด Packet Drop / Connection Loss)
- SNR (Signal-to-Noise Ratio): อัตราส่วนสัญญาณต่อสัญญาณรบกวน คำนวณจาก: SNR (dB) = RSSI (dBm) - Noise Floor (dBm) (เช่น สัญญาณ -65 dBm, สัญญาณรบกวน -95 dBm -> SNR = 30 dB ยิ่งสูงยิ่งรับส่งข้อมูลได้เร็ว)


---

## Slide Page 7

14.7
Received Signal Strength

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 3 รายการ]


---

## Slide Page 8

14.8
A receiver may have a sensitivity threshold of 
-79 dBm. 
If the received signal power level falls below 
this threshold, the signal becomes 
unintelligible, and the receiver cannot detect 
and interpret it, as shown in the diagram 
above.
For example:


---

## Slide Page 9

14.9
◼A lower noise floor means that the receiver 
can detect weaker signals. We measure the 
strength of the received signal against the 
noise floor using the Signal-to-Noise Ratio 
(SNR). 
◼It is expressed in decibels (dB) and 
calculated as:
◼SNR = Received Signal Power (dBm) − 
Noise Power (dBm)
Signal-to-Noise Ratio (SNR)


---

## Slide Page 10

14.10
◼Good SNR: An SNR above 20 dB is usually 
considered good. In this range, the signal is much 
clearer than the noise, leading to better 
communication quality.
◼Moderate SNR: An SNR between 10 dB and 20 
dB is considered moderate. The signal is still 
stronger than the noise, but there might be some 
noticeable interference.
◼Poor SNR: An SNR below 10 dB is considered 
poor. In this range, the noise is almost as strong as 
the signal, making it difficult to understand the 
transmitted information clearly


---

## Slide Page 11

14.11
◼For example, the diagram below shows an RF 
signal with an average RSSI of -57 dBm. The 
noise floor averages at about -79 dBm.
   Therefore, we can calculate the SNR as:
        SNR = -57 dBm - (-79 dBm) = 22 dB
◼This is a good SNR value and the received 
signal. The receiver can detect the signal and 
demodulate the useful data.


---

## Slide Page 12

14.12
Noise Floor Profile

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 13

14.13
◼Interference in wireless communications occurs 
when unwanted signals disrupt the transmission 
and reception of data. 
    Co-channel interference (CCI)
◼Co-channel interference (CCI) occurs when multiple 
wireless devices use the same Wi-Fi channel in the same 
place. For example, devices A and B transmit on the same 
channel 4 in the 2.4 GHz band. What happens is that their 
signals completely overlap throughout the entire 22-MHz 
width of the channel, as shown in the diagram below.
Understanding Wi-Fi Interference


---

## Slide Page 14

14.14
Channel Interference

### รายละเอียดไดอะแกรม: Co-Channel Interference (CCI)
เมื่ออุปกรณ์ 2 ตัว (เช่น Device A และ Device B) หรือ Access Point 2 ตัว ส่งสัญญาณบนช่องสัญญาณเดียวกัน (เช่น ช่อง 4 ที่ความถี่กลาง 2.427 GHz)
- สัญญาณของทั้งสองอุปกรณ์จะทับซ้อนกัน 100%
- ส่งผลให้อุปกรณ์ต้องแย่งกันส่งข้อมูล (Airtime Contention) หรือเกิดการชนกันของแพ็กเก็ต ทำให้สัญญาณรบกวนและข้อมูลเสียหาย


---

## Slide Page 15

14.15
Channel Interference

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 16

14.16
Channel Interference
2.4 GHz band lies between 2.400 GHz and 2.4835 GHz, but briefly 
called 2.4 GHz.
5 GHz band lies between 5.150 GHz and 5.825 GHz, but briefly called 5 
GHz.
5 GHz band has 23 separate channels that are not overlap. 5 
GHz band has unoverlapping channels. So, using any channel 
with 5 GHz do not affect other Access Points.
2.4 GHz band has 14 channels but each channels of 2.4 GHz 
is too wide, and each channel covers the frequency range of 
other four channels. So overlapping occurs. Using 
only channel 1, 6 and 11 avoid overlapping.


---

## Slide Page 17

14.17
Channel Interference

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 18

14.18
◼Low-complexity sub-band codec (SBC)
◼เป็นตัวแปลงสัญญาณบังคับมาตรฐานหลักในการฟังเพลงผ่าน Bluetooth ไร้
สาย และค่าเริ่มต้นสำหรับหูฟังบลูทูธทุกรุ่น อัตราการส่งข้อมูลจะอยู่ที่ (192-
320 kbps) และการบีบอัดข้อมูลก็จะใช้หลักการคล้าย ๆ กับไฟล์ MP3 หรือ
เทียบเท่าคุณภาพ CD นั่นก็คือตัดข้อมูลที่ไม่จำเป็นบางอย่างออกไป เช่น 
ความถี่เสียงที่คนไม่ค่อยได้ยินทิ้งไป และเป็นการจัดส่งข้อมูลโดยสูญเสียข้อมูล
จำนวนมาก
◼ใช้เทคนิคการบีบอัดแบบCompressed Lossy
◼SBC supports mono and stereo streams, and 
certain sampling frequencies up to 48 kHz.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 19

14.19
Wi-Fi คลื่นความถี่ 5 GHz มีแบนด์วิดท์ช่องสัญญาณ (Channels) 20 MHz
การแบ่งกลุ่มช่องสัญญาณ 5 GHz
• UNII-1 (Low Band - ใช้งานในร่ม): ช่อง 36, 40, 44, 48 (4 ช่อง)
• UNII-2 (DFS - ใช้ร่วมกับเรดาร์ เช่น เรดาร์สภาพอากาศ): ช่อง 52, 56, 
60, 64 และช่อง 100 ถึง 140 (ประมาณ 12-13 ช่อง)
• UNII-3 (High Band - ใช้งานทั่วไป/ภายนอก): ช่อง 149, 153, 157, 
161, 165 (5 ช่อง)


---

## Slide Page 20

14.20

### รายละเอียดตารางและแผนผังคลื่นความถี่: 2.4 GHz vs 5 GHz Spectrum Architecture
1. ย่านความถี่ 2.4 GHz (ความยาวคลื่น 12 cm, FSPL ที่ 1m ประมาณ -40 dB):
- สูตรความถี่กลาง: 2407 + (5 x Channel Number) MHz
- ช่องสัญญาณมาตรฐานกว้าง 20 MHz (802.11b ใช้ Mask 22 MHz)
- ช่องที่ไม่ซ้อนทับกัน (Non-overlapping channels) มีเพียง 3 ช่องหลัก คือ ช่อง 1 (2412 MHz), 6 (2437 MHz), 11 (2462 MHz)
- การทำงานร่วมกับระบบอื่นในย่าน 2.4 GHz:
  * Zigbee (802.15.4): มี 16 ช่อง (ช่อง 11-26, แต่ละช่องกว้าง 5 MHz)
  * BLE (Bluetooth Low Energy): มี 40 ช่อง (ช่องละ 2 MHz) โดยมี Advertising Channels คือช่อง 37 (2402 MHz), 38 (2426 MHz), 39 (2480 MHz)
  * Bluetooth Classic: มี 79 ช่อง (ช่องละ 1 MHz)

2. ย่านความถี่ 5 GHz (ความยาวคลื่น 5.1 - 5.8 cm, FSPL ที่ 1m ประมาณ -46 dB):
- สูตรความถี่กลาง: 5000 + (5 x Channel Number) MHz
- แบ่งออกเป็นกลุ่มช่องสัญญาณ:
  * U-NII-1 (5.180 - 5.240 GHz): ช่อง 36, 40, 44, 48 (ใช้งานในอาคาร ไม่ต้องใช้ DFS)
  * U-NII-2a (5.260 - 5.320 GHz): ช่อง 52, 56, 60, 64 (ต้องใช้ DFS - Dynamic Frequency Selection เพื่อหลบเรดาร์)
  * U-NII-2c Extended (5.500 - 5.720 GHz): ช่อง 100 - 144 (ต้องใช้ DFS และระวังย่าน TDWR เรดาร์สภาพอากาศที่ช่อง 120-128)
  * U-NII-3 (5.745 - 5.825 GHz): ช่อง 149, 153, 157, 161, 165
- การรวมช่องสัญญาณ (Channel Bonding):
  * 20 MHz: มี 25 ช่องมาตรฐาน
  * 40 MHz: รวม 2 ช่อง (เช่น 38, 46, 54, 62)
  * 80 MHz: รวม 4 ช่อง (เช่น 42, 58, 106, 122)
  * 160 MHz: รวม 8 ช่อง (เช่น ช่อง 50, 114)


---

## Slide Page 21

14.21
◼A good design takes advantage of wall 
attenuation. You configure an AP to use the 
same channel as another AP only if they are at 
least two walls away from each other. This 
provides enough separation so that the co-
channel interference (CCI) is insignificant 
and both access points can maintain a healthy 
signal-to-noise ratio (SNR) in relation to each 
other, as shown in the diagram below.


---

## Slide Page 22

14.22
◼เป็น Codec รูปแบบมาตรฐานสากลที่บริษัทบางแห่งนำไปใช้ เช่น Dolby 
Laboratories Inc., Sony Corp., Nokia Corp. และยังสามารถหาได้จาก
ผลิตภัณฑ์ของ Apple
◼AAC จะมีอัตราการส่งข้อมูลอยู่ที่ 250 kbps มีขนาด ความเสถียร คุณภาพเสียง
ที่มากกว่ารุ่นก่อนในอัตราบิตเดียวกัน
◼ใช้เทคนิคการบีบอัดแบบCompressed Lossless

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 23

14.23
◼However, wireless devices can interfere 
even if they are not transmitting on the 
same WiFi channel. This is called 
neighboring channel interference.


---

## Slide Page 24

14.24
Neighboring channel interference (NCI)
◼Neighboring Channel Interference (NCI) happens when two 
wireless signals on nearby frequencies interfere with each 
other. This usually occurs when Wi-Fi devices operate on 
channels that are too close together. 
Recall that a WiFi channel has a bandwidth of 22 MHz
This means that if a device transmits on channel 4, for 
example, it uses frequencies between 2.416 and 2.438 GHz and 
not only the central channel frequency of 2.427 GHz. Therefore, 
channels can interfere with each other, as shown in the diagram 
below.


---

## Slide Page 25

14.25

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 26

14.26
◼To avoid NCI, it's best to use non-
overlapping channels. The best channels to 
use in the 2.4 GHz Wi-Fi band are 1, 6, and 
11 because they do not overlap. More 
channels are available in the 5 GHz band, 
providing more flexibility in designing the 
wireless LAN so that NCI does not occur. 
However, a good design may require more 
access points (AP) configured to transmit at 
lower power levels.


---

## Slide Page 27

14.27
◼There could be many sources of non-Wi-Fi 
interference in every frequency band (2.4 GHz, 
5 GHz, and 6 GHz). The most common ones 
include:
➢Microwaves
➢Bluetooth devices
➢Cordless phones
➢Baby monitors
➢Wireless cameras
➢Radar systems (especially in 5 GHz) etc.


---

## Slide Page 28

14.28

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 29

14.29
Free Space Path loss (FSPL)
When a radio frequency (RF) signal is 
transmitted from an antenna, its strength 
decreases as it moves through open space. Even 
with no obstacles in the way, the signal still 
weakens. 
This effect is called free space path loss (FSPL).


---

## Slide Page 30

14.30
The loss is relative to two RF signal components: 
Frequency and Distance. 
The free space path loss (in decibels) is calculated using 
the formula:
 FSPL(dB) = 20log10(d) + 20log10(f) + 92.45
where: 
   d = distance in kilometers (km)
   f = frequency in gigahertz (GHz) and
   92.45 is a constant adjusted for GHz and km units.


---

## Slide Page 31

14.31

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 32

14.32

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 33

14.33

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 34

14.34
❑Wi-Fi devices automatically adjust their 
modulation and coding based on signal 
strength. If the signal is strong, they use 
complex methods to send more data at higher 
speeds. If the signal weakens, they switch to 
simpler methods to maintain a stable 
connection, even if it means slower speeds. 
This process is called dynamic rate shifting 
(DRS) and happens automatically without user 
intervention.


---

## Slide Page 35

14.35
❑A Bluetooth device has a built-in short-range radio 
transmitter. The current data rate is 1 Mbps with a 
2.4-GHz bandwidth. 
❑This means that there is a possibility of interference 
between the IEEE 802.11b wireless LANs and 
Bluetooth LANs.

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 1 รายการ]


---

## Slide Page 36

14.36

> [หมายเหตุ: สไลด์หน้านี้มีรูปภาพ/ไดอะแกรมประกอบ 2 รายการ]


---

## Slide Page 37

14.37
https://www.networkacademy.io/ccna/wireless/interference-rssi-and-snr
https://ipcisco.com/lesson/wlan-frequency-bands/
https://community.ui.com/questions/Understanding-Channels-and-
Banding/b89cde23-a018-4b67-8aff-65f150bd7d29
References


---
