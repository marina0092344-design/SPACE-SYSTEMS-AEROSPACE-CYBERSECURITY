# بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ

# 🛰️ Space Systems & Aerospace Cybersecurity

### Understanding Components, Threats & Security in Satellite Systems

**Presented by: Madiha Muhammad Buksh**
Al-Nafi International College | Diploma in Cloud Cyber Security | RQF Level 3

[![Kali Linux](https://img.shields.io/badge/Kali_Linux-557C94?style=flat&logo=kalilinux&logoColor=white)](#) [![GNU Radio](https://img.shields.io/badge/GNU_Radio-FF6600?style=flat&logo=gnu&logoColor=white)](#) [![Status](https://img.shields.io/badge/Status-Completed-success?style=flat)](#)

---

## 🎯 Key Learning Objectives

- What aerospace cybersecurity is and why it matters
- Space, ground and user segments, and how data flows
- Vulnerabilities and common attacks
- A real case: Black Sea, 2017
- How encryption, authentication and other controls reduce risk
- Standards, open-source tools and cloud architecture
- A signal simulation demo, and how systems recover

---

## 🛰️ What Is Aerospace Cybersecurity — And Why It Matters

Aerospace cybersecurity means protecting satellites, ground stations and the communication links between them from cyber attacks. It is not just internet security. It covers:

- Radio signals travelling from satellites to Earth
- Commands sent from ground stations up to satellites
- Software that controls the space systems

**Why it matters:** Satellite services support navigation, communication and precise timing. Attacks can mislead ships and aircraft, or disrupt services that depend on a satellite link or timing.

---

## 🏗️ Satellite & Aerospace System Architecture

| Segment | Components | Main risk |
|---|---|---|
| **Space** | Satellites, transponders, GNSS satellites broadcasting timing signals | Unauthorized commands, compromised software |
| **Ground** | Mission control, uplink stations, IT and network infrastructure | Network hacking, command injection |
| **User** | Phones, aircraft, ships, GPS receivers | GPS spoofing, signal interception |

Legacy civil GPS has no built-in authentication.

---

## 🔄 How Satellite Data Flows — And How We Secure It

Ground operator prepares and protects a command → **uplink** → satellite checks it (authentic, allowed, fresh) → **telemetry downlink** → ground validates integrity, timestamp and format → authorized users / cloud over a protected link.

| Check | Job |
|---|---|
| Encryption | Hides the content |
| HMAC tag | Checks origin and integrity (not a digital signature) |
| Freshness check | Rejects replayed messages |
| CRC | Finds accidental errors only |
| TLS / mTLS | Protects ground-to-cloud links |

---

## ⚠️ Vulnerabilities in Space Systems

| Level | Weakness | Why dangerous |
|---|---|---|
| **Signal** | Very weak signals, no built-in authentication | Low-cost transmitters can overpower weak GPS signals |
| **Network** | Ground stations run on standard IP networks | ViaSat 2022: attackers entered via a misconfigured VPN device |
| **Receiver** | Locks to strongest signal, weak firmware or validation | May show wrong position or time without a clear warning |
| **Operational** | Weak keys and passwords, poor settings | Misconfiguration can expose systems |

---

## ⚔️ Common Cyber Attacks

| Attack | What it does |
|---|---|
| **Command injection** | Attacker sends a fake command to the satellite |
| **Jamming** | Strong noise blocks the real GPS signal |
| **Spoofing** | Fake signal fools the receiver into showing a wrong location |
| **Signal hijacking** | Takes unauthorized control of an active session |

---

## 🎭 How GPS Spoofing Works

- The real signal is weak: it travels far and arrives with low power
- A spoofer sends a stronger fake signal
- A weak receiver does not check it and can be fooled
- The device shows a wrong position, with no warning

---

## 🌊 Case Study: Black Sea Spoofing (2017)

| | |
|---|---|
| **What happened** | 24+ ships showed a wrong GPS location at Gelendzhik Airport |
| **Impact** | Unreliable navigation information |
| **Why it matters** | GPS spoofing is a real threat. Space systems affect real-world safety |
| **Key lesson** | Cross-check with independent navigation. Keep backup navigation ready |

> Reference: [Inside GNSS — Black Sea spoofing report](https://insidegnss.com/reports-of-mass-gps-spoofing-attack-in-the-black-sea-strengthen-calls-for-pnt-backup/)

---

## 🔐 Encryption & Authentication

- **Encryption** hides the message (e.g. AES)
- **Authentication** proves who sent it. Unauthenticated commands should be rejected
- Both reduce risk, but they cannot guarantee a system is impossible to compromise

---

## 📜 Frameworks & Standards

| Standard | Purpose |
|---|---|
| **CCSDS** | Space communication standards, used by NASA and ESA |
| **NIST SP 800-53** | Catalogue of security controls (access, audit logs) |
| **ISO/IEC 27001** | Sets rules for security management. Organizations can be certified |
| **ISO/IEC 27033** | Guidance for network security |
| **ECSS-E-ST-80C** | Security in the space system life cycle |

---

## 🛠️ Open-Source Tools

| Tool | Purpose |
|---|---|
| **GNU Radio** | Create test signals, process signals, show signals on a spectrum |
| **Kubernetes** | Manages cloud applications. Access rules restrict who can reach them |
| **SatNOGS** | Global ground station network. Monitors satellites and collects satellite data |

---

## ☁️ Cloud Architecture in Space Systems

- Ground station uploads satellite data
- Encryption protects data at rest
- Kubernetes keeps each app separate
- Access control: only allowed users get in

---

## 🔬 Satellite Signal Spoofing Simulation

> **Tool used:** GNU Radio Companion on Kali Linux. A simplified concept demo.

Tone 1 (1 kHz) = genuine signal model. Tone 2 (1.2 kHz) = fake signal model. Both are combined with an Add block and shown on a QT GUI Frequency Sink.

```
[Signal Source 1 kHz]──┐
                       ├──►[Add]──►[QT GUI Frequency Sink]
[Signal Source 1.2 kHz]┘
```

[![GNU Radio Flowgraph](</marina0092344-design/SPACE-SYSTEMS-AEROSPACE-CYBERSECURITY/raw/main/Screenshots/satellite signal spoofing1.png>)](</marina0092344-design/SPACE-SYSTEMS-AEROSPACE-CYBERSECURITY/blob/main/Screenshots/satellite signal  spoofing1.png>) [![Spectrum Analysis Output](https://github.com/marina0092344-design/SPACE-SYSTEMS-AEROSPACE-CYBERSECURITY/raw/main/Screenshots/specturm analysis.png)](</marina0092344-design/SPACE-SYSTEMS-AEROSPACE-CYBERSECURITY/blob/main/Screenshots/specturm analysis.png>)

**Note:** The tones are teaching models, not real GPS signals. A peak alone does not prove spoofing.

---

## 💥 Cyber Attack — Failure & Recovery

| Situation | What can go wrong | What we do |
|---|---|---|
| **Compromised software** | Software behaves unexpectedly | Isolate, restore a verified version, verify before returning to service |
| **Misused account** | Actions may look normal | Revoke access, change credentials, review logs |
| **Service disruption** | Ground services overloaded | Filter malicious traffic, switch to a tested backup path, check service works again |
| **Unreliable navigation** | Position or time may be wrong | Flag suspect data, cross-check with independent sources, use safe fallback procedures |

**Recovery steps:** Detect → Contain → Restore trusted service → Verify. Pre-launch checks are prevention, not recovery.

---

## 🛡️ Defending Space — Countermeasures

- **Secure ground network:** keep the control network separate from the office network, restrict access to authorized users
- **Protect satellite signals:** encryption, authentication (HMAC), permissions and freshness checks
- **Supply chain security:** check hardware and firmware, accept only trusted updates

---

## ✅ Conclusion

Space systems are part of daily life. Every part of the system can be attacked: space, ground, or user side. Encryption alone is not enough; we also need authentication, data checks and monitoring. The Black Sea case shows why navigation needs independent checks. Recovery plans matter as much as prevention.

---

## 📁 Repository Structure

```
├── README.md
├── presentation/   (slides PDF)
├── Screenshots/    (flowgraph and spectrum output)
├── Code_Files/     (GNU Radio simulation steps)
└── demo-video/     (demo video link)
```

---

*⚠️ For educational purposes only. All simulations were done in an isolated virtual environment. No real GPS signals were transmitted or interfered with.*
