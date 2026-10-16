
# بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ

# 🛰️ Space Systems & Aerospace Cybersecurity

### Understanding Components, Threats, and Security in Satellite Systems

**Presented by:** Madiha Muhammad Buksh  
**Institution:** Al-Nafi International College  
**Course:** Diploma in Cloud Cyber Security  
**Qualification Level:** RQF Level 3

[![Kali Linux](https://img.shields.io/badge/Kali_Linux-557C94?style=flat&logo=kalilinux&logoColor=white)](https://www.kali.org/)
[![GNU Radio](https://img.shields.io/badge/GNU_Radio-Signal_Simulation-FF6600?style=flat)](https://www.gnuradio.org/)
[![Cybersecurity](https://img.shields.io/badge/Topic-Aerospace_Cybersecurity-1E90FF?style=flat)]
[![Status](https://img.shields.io/badge/Status-Educational_Project-success?style=flat)]

---

> *Space systems support many services we use every day, including navigation, communication, weather forecasting, and emergency response. Protecting these systems is important because cyber attacks and signal interference can affect services on Earth.*

---

## 📋 Table of Contents

1. [Project Overview](#-project-overview)
2. [Key Learning Objectives](#-key-learning-objectives)
3. [What Is Aerospace Cybersecurity?](#-what-is-aerospace-cybersecurity)
4. [Satellite and Aerospace System Architecture](#-satellite-and-aerospace-system-architecture)
5. [How Satellite Data Flows](#-how-satellite-data-flows)
6. [Vulnerabilities in Space Systems](#️-vulnerabilities-in-space-systems)
7. [Cyber Threats to Space Systems](#-cyber-threats-to-space-systems)
8. [Common Cyber Attacks](#️-common-cyber-attacks)
9. [GPS Spoofing Explained](#-gps-spoofing-explained)
10. [Real-World Case Study: Black Sea, 2017](#-real-world-case-study-black-sea-2017)
11. [Encryption and Authentication](#-encryption-and-authentication)
12. [Cybersecurity Frameworks and Standards](#-cybersecurity-frameworks-and-standards)
13. [Open-Source Tools](#️-open-source-tools)
14. [Cloud Architecture in Space Systems](#️-cloud-architecture-in-space-systems)
15. [GNU Radio Signal Simulation](#-gnu-radio-signal-simulation)
16. [Failure, Recovery, and Defence in Depth](#-failure-recovery-and-defence-in-depth)
17. [Security Recommendations](#-security-recommendations)
18. [Conclusion](#-conclusion)
19. [Repository Structure](#-repository-structure)
20. [References](#-references)

---

## 📌 Project Overview

This project explains how cybersecurity applies to satellites, ground stations, communication links, navigation systems, and supporting cloud infrastructure.

It covers system architecture, common vulnerabilities, cyber threats, data protection, cybersecurity standards, and open-source tools.

The practical part uses **GNU Radio Companion on Kali Linux** to create and analyse two simulated signals. The demonstration helps explain frequency-spectrum analysis and introduces the concept of GPS spoofing.

**Important:** The GNU Radio demonstration is a simplified educational simulation. It does not use genuine GPS signals, perform real GPS spoofing detection, or transmit signals over the air.

---

## 🎯 Key Learning Objectives

By studying this project, the reader will learn to:

- Explain aerospace cybersecurity in simple terms.
- Identify the space, ground, and user segments.
- Understand how satellite commands and telemetry move between systems.
- Recognise signal-level, network-level, and operational vulnerabilities.
- Describe jamming, spoofing, phishing, malware, and unauthorised command attempts.
- Understand the difference between encryption and authentication.
- Explain the purpose of AES-256, HMAC, TLS, and access controls.
- Identify relevant cybersecurity frameworks and space-data standards.
- Understand the roles of GNU Radio, SatNOGS, and Kubernetes.
- Explain how cloud platforms can store and process satellite data.
- Build a basic signal-processing flowgraph in GNU Radio Companion.
- Discuss possible failures, recovery measures, and defence in depth.

---

## 🛰️ What Is Aerospace Cybersecurity?

Aerospace cybersecurity means protecting aerospace and space systems from cyber attacks, unauthorised access, data theft, and communication interference.

It covers more than ordinary internet security. It also considers the radio links, ground infrastructure, software, and commands used to operate satellites and related systems.

Examples include:

- Protecting commands sent from a ground station to a satellite.
- Protecting telemetry and mission data received from a satellite.
- Restricting access to mission-control computers.
- Checking whether commands come from an authorised source.
- Monitoring systems for unusual activity.
- Protecting navigation receivers against misleading signals.

### Why Does It Matter?

| Service | Possible effect of a disruption |
|---|---|
| Navigation | Incorrect or unavailable position information |
| Aviation | Navigation and timing difficulties |
| Maritime transport | Incorrect position information for ships |
| Communications | Interrupted satellite communication services |
| Weather forecasting | Delayed or unavailable satellite data |
| Emergency response | Reduced access to communication or location services |

The exact impact depends on the affected system, the type of incident, and the availability of backup services.

---

## 🏗️ Satellite and Aerospace System Architecture

A space system is commonly explained using three main segments.

| Segment | Main components | Security concerns |
|---|---|---|
| **Space Segment** | Satellites, onboard computers, transponders, and communication equipment | Unauthorised commands, onboard software vulnerabilities, and communication interference |
| **Ground Segment** | Ground stations, antennas, mission-control centres, servers, and networks | Stolen credentials, vulnerable network devices, malware, and unauthorised access |
| **User Segment** | Navigation receivers, phones, aircraft systems, ships, and other user equipment | Spoofed signals, vulnerable receiver software, and incorrect navigation data |

### Why Must All Three Segments Be Protected?

The segments depend on one another. A secure satellite can still be affected if its ground network is compromised. A secure ground station also cannot guarantee that every navigation receiver will recognise a misleading signal.

Cybersecurity must therefore consider the complete system, including its communication links and users.

---

## 🔄 How Satellite Data Flows

A simplified satellite mission may follow this process:

```text
MISSION OPERATOR
       |
       v
GROUND CONTROL SYSTEM
       |
       v
AUTHORISE AND PROTECT COMMAND
       |
       v
GROUND STATION
       |
       | Uplink
       v
SATELLITE
       |
       | Downlink: telemetry or mission data
       v
GROUND STATION
       |
       v
VALIDATE AND PROCESS DATA
       |
       v
MISSION APPLICATION / AUTHORISED USER
```

### Security at Each Stage

| Stage | Example security measure | Why it helps |
|---|---|---|
| Mission operator | Multi-factor authentication and role-based access control | Reduces the risk of unauthorised access |
| Ground control | Secure configuration and audit logs | Helps restrict and investigate activity |
| Command protection | Encryption and cryptographic authentication, where supported | Protects confidentiality and helps verify command authenticity |
| Communication link | Appropriate link-security controls and monitoring | Helps protect data and identify unusual activity |
| Ground data processing | Integrity checks and validation | Helps detect damaged or unexpected data |
| User access | Least privilege and secure authentication | Limits access to authorised people and services |

**Important:** These are recommended security measures, not proof that every satellite system automatically implements them. Actual controls depend on the mission design, equipment, and supported protocols.

A checksum such as CRC can help detect accidental data corruption. It does not, by itself, prove who sent the data or prevent a deliberate attacker from changing it.

---

## ⚠️ Vulnerabilities in Space Systems

| Level | Example vulnerability | Why it matters |
|---|---|---|
| **Signal Level** | Weak received signals and limited signal-authentication support | Receivers may be vulnerable to interference or misleading signals |
| **Network Level** | Misconfigured VPNs, exposed services, or weak network segmentation | Attackers may gain access to systems that support satellite operations |
| **Receiver Level** | Outdated firmware or inadequate signal validation | A receiver may process incorrect or misleading information |
| **Operational Level** | Weak passwords, excessive privileges, or poor procedures | Human errors and compromised accounts can increase risk |
| **Supply Chain Level** | Vulnerable software, components, or supplier systems | A weakness introduced before launch can affect a mission |
| **Physical and Maintenance Level** | Limited physical access, repair, or update opportunities once a satellite is in orbit | Some faults are difficult or impossible to fix directly |

### Why Are Space Systems Difficult to Secure?

- Satellites may operate for many years.
- Some systems use older hardware or software.
- Updates and repairs can be difficult after launch.
- Communication links cover long distances.
- Testing every possible failure before launch is challenging.
- Different suppliers may provide hardware and software.
- Security improvements must be balanced with mission reliability and compatibility.

---

## 📊 Cyber Threats to Space Systems

Space systems may face threats from different sources.

| Threat actor or source | Possible activity |
|---|---|
| Nation-state groups | Espionage, disruption, or attempts to compromise strategically important systems |
| Cybercriminals | Ransomware, credential theft, or attacks on supporting networks |
| Insiders | Misuse of legitimate access or accidental security mistakes |
| Supply-chain attackers | Attempts to compromise supplier systems, software, or components |
| Signal interferers | Jamming or spoofing of vulnerable radio-navigation signals |

Threat levels vary by mission, region, and system. This project does not use a verified dataset to rank attack frequency or calculate a percentage increase in attacks.

### Common Attack Types

| Attack | What it means | Possible consequence |
|---|---|---|
| **Jamming** | Interference makes it difficult for a receiver to use a legitimate signal | Loss or degradation of navigation or communication |
| **Spoofing** | Misleading signals are used to make a receiver calculate incorrect information | Incorrect position or timing information |
| **Phishing** | A user is tricked into revealing credentials or opening malicious content | Unauthorised access to ground systems |
| **Malware** | Malicious software compromises a computer or application | Data theft, disruption, or loss of system control |
| **Unauthorised command attempt** | Someone attempts to send commands without proper authority | Potential disruption if security controls fail |
| **Supply-chain compromise** | A supplier, component, or software dependency is compromised | A weakness may enter the system before deployment |
| **Denial of service** | A system or service is overwhelmed or made unavailable | Loss of access to ground services or mission data |

A successful attack depends on the target's vulnerabilities and the security controls in place. Not every attack automatically gives an attacker full control of a satellite.

---

## 🎭 GPS Spoofing Explained

GPS spoofing is an attempt to mislead a GPS receiver by providing signals that cause it to calculate an incorrect position or time.

GPS is one system within the broader category known as Global Navigation Satellite Systems (GNSS). Other GNSS systems include Galileo, GLONASS, and BeiDou.

### Simplified Concept

```text
Legitimate GNSS signals ─────────┐
                                |
                                v
                         NAVIGATION RECEIVER
                                |
                                v
                      Position / time calculation

Misleading signals may affect the receiver's
calculation if its detection and validation
controls are not sufficient.
```

### Key Points

- Genuine satellite signals are often weak when they reach Earth.
- A spoofing attempt uses misleading signals to influence a receiver.
- Signal strength alone cannot establish whether a signal is genuine.
- A receiver may need additional checks to identify suspicious navigation information.
- Detection may use signal characteristics, consistency checks, multiple sensors, and authentication where supported.

**Important:** The strongest signal does not always automatically win. Receiver design, signal tracking, timing, modulation, and processing also affect the result.

### Jamming vs Spoofing

| Jamming | Spoofing |
|---|---|
| Attempts to disrupt reception using interference | Attempts to mislead a receiver using deceptive signals |
| May cause loss of navigation or communication | May cause incorrect position or time information |
| Main concern is availability | Main concern is the trustworthiness of received information |

---

## 🌊 Real-World Case Study: Black Sea, 2017

In June 2017, reports described more than 20 vessels in the Black Sea experiencing apparent GPS spoofing or interference. Some vessels reportedly displayed a GPS position near an airport inland, even though they were at sea.

The incident was reported publicly by maritime and navigation sources. It is an example of how misleading navigation information can affect real-world operations.

| Area | Lesson |
|---|---|
| What happened | Multiple vessels reportedly received incorrect GPS position information |
| Potential impact | Navigators could be misled about a vessel's position |
| Security lesson | A navigation receiver's displayed position should not always be trusted without checks |
| Recommended response | Use appropriate backup navigation, cross-check available sensors, and investigate unusual position changes |

**Reference:** [Inside GNSS — Reports of Mass GPS Spoofing Attack in the Black Sea](https://insidegnss.com/reports-of-mass-gps-spoofing-attack-in-the-black-sea-strengthen-calls-for-pntbackup/)

This case illustrates the risk of misleading navigation information. It does not mean that every receiver will fail in the same way or that every reported incident has identical causes.

---

## 🔐 Encryption and Authentication

Encryption and authentication help protect data, but they solve different security problems.

### Encryption

Encryption converts readable information into protected data using a cryptographic algorithm and key.

**Example:** AES-256 is a symmetric encryption algorithm that uses a 256-bit key.

It can help protect the confidentiality of sensitive data when implemented with appropriate modes, key management, and system controls.

### Authentication

Authentication helps verify the identity of a user, device, or message source. Message authentication can also help detect unauthorised changes.

**Example:** HMAC-SHA-256 can authenticate a message using a shared secret key. It is not a digital signature and does not provide public-key verification.

### Why Are Both Important?

| Control | Main purpose |
|---|---|
| Encryption | Helps prevent unauthorised reading of data |
| Authentication | Helps verify the source or identity |
| Integrity protection | Helps detect unauthorised changes |
| Access control | Limits who can use a system or perform an action |
| Key management | Protects and manages cryptographic keys |

Encryption alone does not prove that a command came from an authorised source. A secure system must use suitable authentication and integrity protections as well.

No single control guarantees that a satellite cannot be compromised.

---

## 📜 Cybersecurity Frameworks and Standards

Frameworks and standards provide guidance for planning, designing, implementing, and assessing security controls.

| Framework or standard | Role |
|---|---|
| **NIST Cybersecurity Framework (CSF)** | Organises cybersecurity risk management activities |
| **NIST SP 800-53** | Provides a catalogue of security and privacy controls for information systems and organisations |
| **ISO/IEC 27001** | Specifies requirements for an information security management system |
| **ISO/IEC 27033** | Provides guidance related to network security |
| **CCSDS security standards** | Address security architecture, cryptographic algorithms, and protection for space-data communications |
| **ESA security guidance** | Provides security-related guidance and requirements within applicable European Space Agency activities |

### Why Are Standards Useful?

- They provide structured security guidance.
- They help organisations identify and manage risks.
- They support consistent processes and documentation.
- They can improve security reviews, auditing, and incident response.
- Space-specific standards help address the requirements of satellite communication and mission operations.

**Important:** Using a framework does not automatically make a system secure or prove compliance. Organisations must select and implement controls that fit their systems and requirements.

---

## 🛠️ Open-Source Tools

This project discusses three tools with different purposes.

| Tool | Main purpose | Relevance to this project |
|---|---|---|
| **GNU Radio** | Builds signal-processing flowgraphs and processes simulated or supported radio data | Used for the two-tone signal simulation and frequency-spectrum visualisation |
| **SatNOGS** | A community-supported network and ecosystem for satellite observation using ground stations | Helps illustrate how satellite observations and reception can be organised |
| **Kubernetes** | Deploys and manages containerised applications | Can support applications that process satellite data in ground or cloud infrastructure |

### GNU Radio

GNU Radio Companion provides a graphical interface for connecting signal-processing blocks. In this project, it is used to generate two sine-wave test tones, combine them, and observe their frequency components.

### SatNOGS

SatNOGS supports satellite observation through a network of ground stations. It is not automatically a GPS spoofing detector, and simply using SatNOGS does not secure satellite command links.

### Kubernetes

Kubernetes manages containerised applications and their deployment. Security depends on its configuration, identity controls, network policies, permissions, and the security of the applications it runs.

**Project scope:** GNU Radio is the tool used in the practical simulation. SatNOGS and Kubernetes are discussed as examples; this project does not claim to have deployed or configured them.

---

## ☁️ Cloud Architecture in Space Systems

Cloud infrastructure can help authorised teams store, process, analyse, and share satellite data.

A simplified architecture is:

```text
SATELLITE
    |
    | Telemetry / mission data
    v
GROUND STATION
    |
    v
SECURE DATA TRANSFER
    |
    v
CLOUD PLATFORM
    |
    +----> Data Storage
    |
    +----> Processing Applications
    |
    +----> Monitoring and Logs
    |
    v
AUTHORISED ANALYST
```

### Recommended Security Controls

- Encrypt sensitive data in transit and at rest where appropriate.
- Use multi-factor authentication for privileged accounts.
- Apply least privilege and role-based access control.
- Separate applications and networks where appropriate.
- Keep software and operating systems updated.
- Monitor logs for unusual activity.
- Back up important data and test recovery procedures.
- Secure Kubernetes deployments if Kubernetes is used.

Cloud storage and Kubernetes do not automatically make satellite data secure. The complete architecture must be designed, configured, monitored, and maintained securely.

---

## 🔬 GNU Radio Signal Simulation

**Tool:** GNU Radio Companion  
**Operating system:** Kali Linux  
**Demonstration type:** Educational signal-processing simulation

### Purpose

The practical demonstration creates two simple sine-wave tones and combines them to observe their frequency components.

The tones are labelled as conceptual models for a genuine signal and a misleading signal. They are **not real GPS or GNSS signals**.

### Flowgraph

```text
[Signal Source 1]
Frequency: 1 kHz
Amplitude: 1
        |
        +-------------------+
                            |
                            v
                          [Add] ------> [QT GUI Frequency Sink]
                            ^
        +-------------------+
        |
[Signal Source 2]
Frequency: 1.2 kHz
Amplitude: 1
```

### Configuration

| Block | Setting | Value |
|---|---|---|
| Variable | `samp_rate` | `32k` |
| Signal Source 1 | Waveform | Sine |
| Signal Source 1 | Frequency | `1k` |
| Signal Source 1 | Amplitude | `1` |
| Signal Source 2 | Waveform | Sine |
| Signal Source 2 | Frequency | `1.2k` |
| Signal Source 2 | Amplitude | `1` |
| Add | Function | Combines both tones |
| QT GUI Frequency Sink | FFT size | `1024` |
| QT GUI Frequency Sink | Bandwidth | `32k` |

The signal sources use the sample-rate variable `samp_rate`.

### Expected Output Analysis

| Observation | Explanation |
|---|---|
| A tone at 1 kHz | Produced by the first Signal Source block |
| A tone at 1.2 kHz | Produced by the second Signal Source block |
| Two frequency components | Expected when both tones are combined and displayed with suitable settings |
| Similar peak heights | Expected because both tones use the same amplitude, subject to display and signal-processing settings |
| Lower levels away from the tones | The spectrum may show lower energy away from the signal frequencies |

### What Does This Demonstration Prove?

It demonstrates how to:

1. Generate two simulated sine-wave signals.
2. Combine them using an Add block.
3. Display their frequency components using a QT GUI Frequency Sink.
4. Relate frequency-spectrum analysis to the general concept of signal monitoring.

### What Does It Not Prove?

- It does not detect a real GPS spoofing attack.
- It does not generate real GPS navigation data.
- It does not demonstrate that the second tone overpowers the first.
- It does not prove that a receiver has accepted a fake location.
- A spectrum peak alone cannot confirm spoofing.

Both configured tones have the same amplitude. Therefore, this flowgraph does not demonstrate a stronger spoofed signal overpowering a weaker genuine signal.

The frequencies shown are test-tone frequencies, not actual GPS carrier frequencies.

### Safety and Scope

The demonstration uses locally generated test tones in GNU Radio Companion. No real GPS signals are transmitted, and no satellite navigation service is intentionally interfered with.

---

## 💥 Failure, Recovery, and Defence in Depth

Cybersecurity planning should consider both prevention and recovery.

| Scenario | Possible failure | Example recovery or mitigation |
|---|---|---|
| Compromised supplier software | A vulnerable component enters the system | Verify software and firmware, assess suppliers, and maintain component records |
| Insider misuse | A person misuses authorised access | Apply least privilege, monitor actions, and review access regularly |
| Denial of service | A ground service becomes unavailable | Use tested backups, incident-response procedures, and resilient infrastructure |
| Signal interference | A receiver loses or mistrusts navigation data | Monitor signal quality and use appropriate backup navigation methods |
| Ground network compromise | An attacker reaches systems supporting mission operations | Isolate critical networks, revoke compromised credentials, investigate, and restore from trusted configurations |
| Data corruption | Incorrect data is processed or stored | Validate data, check integrity, and restore verified backups where appropriate |

### Defence in Depth

Defence in depth means using several layers of protection instead of relying on a single security control.

```text
Layer 1: Physical and Facility Security
                    |
Layer 2: Network Segmentation and Firewalls
                    |
Layer 3: Identity and Access Control
                    |
Layer 4: Encryption and Authentication
                    |
Layer 5: Monitoring and Detection
                    |
Layer 6: Incident Response and Recovery
```

If one layer fails, other layers may help limit the damage.

---

## 🛡️ Security Recommendations

### 1. Secure Ground Networks

- Separate mission-control networks from ordinary office networks.
- Remove unnecessary exposed services.
- Patch and securely configure network devices.
- Use multi-factor authentication and least privilege.
- Monitor access and record important security events.

### 2. Protect Commands and Data

- Use suitable encryption and authentication mechanisms.
- Verify commands before accepting or executing them.
- Protect cryptographic keys throughout their life cycle.
- Validate data before processing it.
- Use protocols and controls appropriate to the mission.

### 3. Protect Navigation Receivers

- Monitor for unusual signal and position behaviour.
- Cross-check navigation data with other available sources.
- Use suitable backup navigation procedures.
- Keep receiver software and firmware maintained where updates are supported.
- Do not rely on signal strength alone to establish signal authenticity.

### 4. Improve Supply-Chain Security

- Assess supplier security practices.
- Verify software and firmware integrity.
- Maintain records of components and software dependencies.
- Review updates before deployment.
- Plan for vulnerability reporting and remediation.

### 5. Prepare for Recovery

- Maintain tested backups and recovery procedures.
- Define incident-response responsibilities.
- Practise recovery using realistic scenarios.
- Document lessons learned after incidents.
- Review security controls throughout the system life cycle.

---

## ✅ Conclusion

Space systems support important services such as navigation, communication, weather forecasting, and emergency response. Protecting them requires attention to satellites, ground stations, communication links, user equipment, and supporting cloud infrastructure.

This project explains common threats, including jamming, spoofing, malware, and unauthorised access. It also shows why encryption, authentication, access control, monitoring, and recovery planning are all important.

The Black Sea incident illustrates how incorrect navigation information can create real operational risks. Cybersecurity frameworks and space-data standards provide useful guidance, but they must be applied appropriately to each system.

The GNU Radio demonstration provides a simple practical introduction to signal generation, combining test tones, and frequency-spectrum analysis. It is a simulation for learning purposes, not a real GPS spoofing detection system.

**The main lesson is that space cybersecurity requires layered protection, careful validation, continuous monitoring, and tested recovery plans.**

---

## 📁 Repository Structure

The following is a suggested view of the project files. Keep the names and paths aligned with the files actually present in your GitHub repository.

```text
SPACE-SYSTEMS-AEROSPACE-CYBERSECURITY/
│
├── README.md
│
├── Code_Files/
│   ├── Installing GNU-Radio Tool.md
│   └── Code_Files/
│       └── Spoofing Demonstration's code file.m
│
├── Screenshots/
│   ├── satellite signal  spoofing1.png
│   └── specturm analysis.png
│
├── presentation/
│   └── Space_and_Aerospace_Cybersecurity.pdf
│
└── demo-video/
    └── Demo_Video_Link.md
```

**Note:** The tree above is a documentation example based on the project file names. Check your repository before adding or renaming folders. If a file or folder does not exist, remove it from the tree or create it before describing it as part of the repository.

---

## 📚 References

1. **Inside GNSS** — [Reports of Mass GPS Spoofing Attack in the Black Sea Strengthen Calls for PNT Backup](https://insidegnss.com/reports-of-mass-gps-spoofing-attack-in-the-black-sea-strengthen-calls-for-pntbackup/)

2. **Viasat** — [KA-SAT Network Cyber Attack Overview](https://www.viasat.com/perspectives/corporate/2022/ka-sat-network-cyber-attack-overview/)

3. **CCSDS** — [Consultative Committee for Space Data Systems](https://ccsds.org/)

4. **CCSDS Publications** — [Recommended Standards and Technical Publications](https://ccsds.org/publications/)

5. **ISO** — [ISO 20215:2015 — CCSDS Cryptographic Algorithms](https://www.iso.org/standard/67308.html)

6. **ISO** — [ISO 20214:2015 — Security Architecture for Space Data Systems](https://committee.iso.org/cms/live/live/en/sites/isoorg/contents/data/standard/06/73/67307.html?browse=ics)

7. **GNU Radio** — [Official Website](https://www.gnuradio.org/)

8. **Kali Linux** — [Official Website](https://www.kali.org/)

9. **NIST** — [Cybersecurity Framework](https://www.nist.gov/cyberframework)

10. **NIST** — [SP 800-53: Security and Privacy Controls](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final)

---

## ⚠️ Educational Use Disclaimer

This repository is intended for educational purposes as part of a space systems and aerospace cybersecurity project.

The GNU Radio demonstration uses simulated test tones and is not a real GPS or GNSS spoofing experiment. It does not transmit actual satellite-navigation signals or intentionally interfere with real navigation services.

The security diagrams and recommendations are simplified learning examples. Real mission systems require security engineering, testing, and controls appropriate to their operational requirements.
