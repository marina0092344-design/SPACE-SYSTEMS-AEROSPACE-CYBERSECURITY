# بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ

# 🛰️ Space Systems & Aerospace Cybersecurity

### Understanding Components, Threats & Security in Satellite Systems

**Presented by: Madiha Muhammad Buksh**
Al-Nafi International College | Diploma in Cloud Cyber Security | RQF Level 3

[![Kali Linux](https://img.shields.io/badge/Kali_Linux-557C94?style=flat&logo=kalilinux&logoColor=white)](#)
[![GNU Radio](https://img.shields.io/badge/GNU_Radio-FF6600?style=flat&logo=gnu&logoColor=white)](#)
[![AES-256](https://img.shields.io/badge/Encryption-AES--256-1E90FF?style=flat)](#)
[![Status](https://img.shields.io/badge/Status-Completed-success?style=flat)](#)

---

> *"Space systems are part of our everyday life. Every time we open Google Maps, use a bank ATM, or board an aircraft — a satellite is involved. When these systems are attacked, the damage is real and the consequences are serious."*

---

## 📋 Table of Contents

| # | Section |
|---|---------|
| 1 | [Key Learning Objectives](#-key-learning-objectives) |
| 2 | [What Is Aerospace Cybersecurity — And Why It Matters](#-what-is-aerospace-cybersecurity--and-why-it-matters) |
| 3 | [Satellite & Aerospace System Architecture](#️-satellite--aerospace-system-architecture) |
| 4 | [How Satellite Data Flows — And How We Secure It](#-how-satellite-data-flows--and-how-we-secure-it) |
| 5 | [Vulnerabilities in Space Systems](#️-vulnerabilities-in-space-systems) |
| 6 | [Space Under Threat — 2025](#-space-under-threat--2025) |
| 7 | [Common Cyber Attacks on Space Systems](#️-common-cyber-attacks-on-space-systems) |
| 8 | [Signal-Level Attack — How GPS Spoofing Works](#-signal-level-attack--how-gps-spoofing-works) |
| 9 | [Real-World Case Study: Black Sea Spoofing (2017)](#-real-world-case-study-black-sea-spoofing-2017) |
| 10 | [Encryption & Authentication](#-encryption--authentication) |
| 11 | [Aerospace Cybersecurity Frameworks & Standards](#-aerospace-cybersecurity-frameworks--standards) |
| 12 | [Open-Source Tools](#️-open-source-tools) |
| 13 | [Cloud Architecture in Space Systems](#️-cloud-architecture-in-space-systems) |
| 14 | [Satellite Signal Spoofing Detection — Live Simulation](#-satellite-signal-spoofing-detection--live-simulation) |
| 15 | [Cyber Attacks — Failure & Recovery in Space](#-cyber-attacks--failure--recovery-in-space) |
| 16 | [Defending Space — Our Countermeasures](#️-defending-space--our-countermeasures) |
| 17 | [Conclusion](#-conclusion) |
| 18 | [Repository Structure](#-repository-structure) |

---

## 🎯 Key Learning Objectives

- Understand aerospace cybersecurity and why it matters
- Identify space system segments and their attack surfaces
- Trace how satellite data flows from space to ground to user
- Examine vulnerabilities at signal, network and operational level
- Recognize current cyber threats targeting space in 2025
- Analyze common attacks — Jamming, Spoofing, Command Injection
- Study real cases — Black Sea 2017
- Learn how AES-256, HMAC and TLS protect satellite links
- Explore GNU Radio, SatNOGS and Kubernetes tools
- Understand how cloud platforms store and process satellite data
- Understand NIST, CCSDS, ISO 27001 and ESA frameworks
- Demonstrate live satellite signal spoofing detection
- Analyze cyber attack failure and recovery scenarios

---

## 🛰️ What Is Aerospace Cybersecurity — And Why It Matters

Aerospace cybersecurity means protecting satellites, ground stations, and the communication links between them from cyber attacks. It is **not just internet security** — it covers:

- Radio signals travelling from satellites to Earth
- Commands sent from ground stations up to satellites
- Telemetry data coming back down from the satellite
- All software that controls space systems

### Why It Matters

Because one cyber attack on a satellite can affect millions of people on Earth:

| Impact | Effect |
|---|---|
| Phone GPS | Stops working |
| Aircraft | Lose navigation |
| Ships | Go off course at sea |
| Banking | Transactions lose timing |
| Emergency services | Lose location data |

---

## 🏗️ Satellite & Aerospace System Architecture

Every space mission has three parts. Each part can be attacked in a different way.

| Segment | Components | Target |
|---|---|---|
| **Space Segment** | Satellites in orbit · Transponders (receive, amplify, retransmit) · GNSS satellites broadcasting precise timing | ⚠️ Jamming attacks on weak signals |
| **Ground Segment** | Mission control centres & uplink stations talking directly to satellites · IT and network infrastructure | ⚠️ Network hacking and command injection — main cyberattack target |
| **User Segment** | Phones, aircraft, ships, GPS receivers · Civil GPS has no built-in authentication | ⚠️ GPS spoofing and signal interception |

---

## 🔄 How Satellite Data Flows — And How We Secure It

*Every step in the journey is encrypted, signed, and validated.*

```
SPACE SEGMENT              GROUND SEGMENT               USER SEGMENT
──────────────             ──────────────               ────────────
01 Mission Operator  ───►  02 Encrypt + Sign     ───►   03 Uplink Transmit
Sends encrypted            AES-256 locks command         S-band radio
command upward              HMAC signs it                 beamed to orbit
     │                                                          │
     ▼                                                          ▼
04 Satellite Verifies ◄──  05 Telemetry Downlink  ◄──   06 Ground Validates
Checks signature            Data returned to               CCSDS checksum
before acting                ground                          on every packet
```

| Stage | NIST CSF Function |
|---|---|
| Mission Operator | Identify |
| Encrypt + Sign | Protect |
| Uplink Transmit | Detect |
| Satellite Verifies | Respond |
| Ground Validates | Recover |

**Security applied at every step:** AES-256 Encryption · HMAC-SHA256 Signature · mTLS Authentication · CCSDS CRC Validation

---

## ⚠️ Vulnerabilities in Space Systems

| Level | Vulnerability | Why Dangerous |
|---|---|---|
| **Signal Level** | Extremely weak satellite signals · No built-in signal authentication | An attacker with a cheap $50 transmitter can overpower a real satellite signal |
| **Network Level** | Ground stations run on standard IP networks · A hacked ground network can disrupt satellite operations | ViaSat 2022 — attackers entered via a misconfigured VPN device |
| **Receiver Level** | Devices lock onto the strongest signal · Vulnerable firmware, poor validation | The receiver shows a wrong location but gives **no warning** |
| **Operational Level** | Weak keys and passwords · Poor security configuration | One misconfiguration = full satellite system exposed to attacker |

---

## 📊 Space Under Threat — 2025

| Metric | Value | Source |
|---|---|---|
| Nation-State Attacks | **+340%** since 2020 | — |
| Modems Destroyed | **40,000** | ViaSat 2022 |
| GPS Spoofing | **24+ Ships** | Black Sea 2017 |

**Attack frequency by threat type (highest to lowest):** Nation-State → GPS Spoofing → Ransomware → Supply Chain → Command Injection

**Attack surface breakdown:** Ground Network · Signal Link · Supply Chain · User Segment

| Threat Actor | Behavior |
|---|---|
| **Nation-State Attacks** | Governments hijack enemy satellites · War zones are active targets |
| **Cybercriminal Groups** | Ransomware locks ground stations · ViaSat 2022 destroyed 40,000 modems |
| **GPS Deception** | Fake signals near the Black Sea · Ships and aircraft misled |

---

## ⚔️ Common Cyber Attacks on Space Systems

| # | Attack | What It Does |
|---|---|---|
| 1 | **Command Injection** | Attacker sends a fake command to the satellite · Can permanently damage orbit or sensors |
| 2 | **Jamming** | Strong noise blocks the real GPS signal · Aviation and ship navigation fails |
| 3 | **Spoofing** | A fake signal stronger than the real one · Receiver shows a completely wrong location |
| 4 | **Signal Hijacking** | Signal intercepted before reaching the satellite · Attackers take full remote control |

---

## 🎭 Signal-Level Attack — How GPS Spoofing Works

- **Real signal weak** — travels far, low amplitude
- **Fake signal strong** — spoofers send a bigger signal
- **Strongest signal always wins** — the receiver has no way to check
- **Wrong location shown** — the device shows the wrong position, with no warning

```
Before spoofing: Receiver locked onto REAL signal (weak)
Spoofer activates ──►
After spoofing:  Receiver locked onto FAKE signal (strong)
```

---

## 🌊 Real-World Case Study: Black Sea Spoofing (2017)

| | Details |
|---|---|
| **What Happened** | 24+ ships showed the wrong GPS location · A fake signal beat the real satellite signal |
| **Impact** | Ships lost navigation completely · No warning was given to anyone |
| **Why It Matters** | GPS spoofing is a real threat · Space systems affect real-world safety |
| **Key Lesson** | Use multiple satellite systems · Keep backup navigation ready |

> Reference: [insidegnss.com](https://insidegnss.com/reports-of-mass-gps-spoofing-attack-in-the-black-sea-strengthen-calls-for-pntbackup/)

---

## 🔐 Encryption & Authentication

### Encryption
- Scrambles satellite commands
- AES-256 protects all data

### Authentication
- Verifies every command's source
- Fake commands are rejected instantly

### Why Both Matter
- Encryption hides the message
- Authentication proves who sent it
- With both in place, a satellite can't be hijacked by anyone

---

## 📜 Aerospace Cybersecurity Frameworks & Standards

| Framework | Purpose |
|---|---|
| **CCSDS** | Built for satellite security · Used by NASA and ESA |
| **NIST SP 800-53** | Secures ground station network · Controls access and audit logs |
| **ISO/IEC 27001** | Manages the full security programme · Certifies agency security systems |
| **ISO/IEC 27033** | Secures ground network links · Protects satellite command channels |
| **ESA ECSB** | Covers all ESA space missions · Verifies hardware before launch |

---

## 🛠️ Open-Source Tools

| Tool | Purpose |
|---|---|
| **GNU Radio** | Process satellite signals · Simulate jamming attacks · Show real-time jamming attack |
| **Kubernetes** | Global ground station network · Monitors satellites worldwide · Detects signal anomalies |
| **SatNOGS** | Secure ground control software · Isolate hacked applications · Control satellite command access |

---

## ☁️ Cloud Architecture in Space Systems

- **Data to cloud** — ground station uploads satellite data
- **Cloud keeps safe** — encryption protects data at rest
- **Apps stay separate** — Kubernetes isolates each application
- **Access control** — only allowed users get in

```
Ground Station (sends data) ──┐
Encrypted Data (AES-256)   ───┼──► Cloud Platform ──► Analyst (views data)
Kubernetes pods (isolated) ───┘         │
                                         ▼
                                  Access Control
                             (checks who can enter)
```

---

## 🔬 Satellite Signal Spoofing Detection — Live Simulation

> **Tool used:** GNU Radio Companion on Kali Linux

**Setup:** Real satellite signal (1 kHz) combined with a spoofed GPS signal (1.2 kHz).

```
[Signal Source — Real GNSS, 1 kHz]  ──┐
                                       ├──►[Add]──►[QT GUI Frequency Sink]
[Signal Source — Spoofed GPS, 1.2 kHz]─┘
```

| Observation | Meaning |
|---|---|
| Stronger peak on spectrum output | Confirms spoofing — the fake signal overpowers the real satellite signal |
| Real satellite signal | Visible but weaker on the spectrum |
| Spoofed GPS signal | Dominant, stronger peak |

<p align="center">
  <img src="Screenshots/satellite signal spoofing1.png" alt="GNU Radio Flowgraph" width="45%">
  <img src="Screenshots/specturm analysis.png" alt="Spectrum Analysis Output" width="45%">
</p>

### 🎥 Demo Video

▶️ **[Watch the full spoofing detection demo on GNU Radio](demo-video/Demo_Video_Link.md)**

---

## 💥 Cyber Attacks — Failure & Recovery in Space

| Attack Type | Failure — What Goes Wrong | Recovery — What We Do |
|---|---|---|
| **Supply Chain Attack** | Malware activates in orbit · Satellite cannot be fixed remotely · Satellite permanently damaged | Firmware verified before launch · Vendor security strictly checked · Supply chain fully audited |
| **Insider Threat** | Attacker enters the system · Trusted access misused · System fully compromised | RBAC limits access rights · Every action logged and monitored · Zero trust policy enforced |
| **Denial of Service** | Operators lose satellite contact · Ground station overloaded · Aviation navigation disabled | Backup control centre activated · Traffic filtered immediately · Multi-frequency receiver used |
| **Signal Interference** | Wrong readings sent to ground · Satellite data corrupted · Vessel drifts off course | CCSDS checksum detects error · Corrupted packets flagged instantly · Signal anomalies monitored |

> **Defence-in-Depth:** Signal Layer → Network Layer → Receiver Layer → Operational Layer
> **NIST CSF:** Protect · Detect · Respond

---

## 🛡️ Defending Space — Our Countermeasures

### Secure Ground Network
- Keep control network separate from office network
- One breach cannot spread to the satellite
- ISO 27033 prevents attack spreading

### Protect Satellite Signals
- AES-256 locks every command before sending
- Fake commands get rejected automatically
- HMAC signature verifies every command

### Supply Chain Security
- All hardware checked before launch
- No untrusted software enters the system
- Firmware verified as safe and clean

---

## ✅ Conclusion

> *Space systems are part of daily life. GPS, banking, and flights all depend on satellites working safely.*
>
> *Every part of the system can be attacked — space, ground, or the user side. That's why encryption alone is not enough; we also need authentication, so fake commands get rejected.*
>
> *These are not just theory — the Black Sea incident already showed us this risk is real.*
>
> *Frameworks like NIST, CCSDS, ISO, and ESA give us a standard to follow. Recovery plans matter just as much as prevention, because attacks can still happen even with good security.*

---

## 📁 Repository Structure

```
Space_and_Aerospace_Cybersecurity/
│
├── README.md
│
├── presentation/
│   └── Space_and_Aerospace_Cybersecurity.pdf
│
├── Screenshots/
│   ├── satellite signal spoofing1.png
│   └── specturm analysis.png
│
├── Code_Files/
│   └── GNU_Radio_Spoofing_Simulation.md
│
└── demo-video/
    └── Demo_Video_Link.md
```

---

**Madiha Muhammad Buksh**
Cybersecurity Student | Aspiring SOC Analyst | Pakistan
Diploma in Cloud Cyber Security | RQF Level 3 | Al-Nafi International College

*⚠️ For educational purposes only. All simulations conducted in an isolated virtual environment. No real GPS signals were transmitted or interfered with.*
