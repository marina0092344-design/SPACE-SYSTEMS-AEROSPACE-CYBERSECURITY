# بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ

# 🛰️ Space Systems and Aerospace Cybersecurity

*Understanding satellite architecture, cyber threats, and the controls that support reliable space services.*

![Type](https://img.shields.io/badge/Project-Academic%20Presentation-2563EB)
![Focus](https://img.shields.io/badge/Focus-Satellite%20Cybersecurity-0F766E)
![Practical](https://img.shields.io/badge/Practical-GNU%20Radio%20Simulation-7C3AED)

## Overview

Satellite services support navigation, communication, and precise timing. Protecting these services requires attention to spacecraft, ground infrastructure, communication links, and user equipment.

This project explores those components, their security risks, and relevant protective measures. It also includes a simplified signal simulation using **GNU Radio Companion on Kali Linux**.

**Presented by:** Madiha Muhammad Buksh  
**Institution:** Al-Nafi International College  
**Programme:** Diploma in Cloud Cyber Security | RQF Level 3

## Topics Covered

| Area | Coverage |
|---|---|
| System architecture | Space, ground, and user segments |
| Communication | Uplink commands, downlink telemetry, and validation |
| Vulnerabilities | Signal, network, receiver, and operational weaknesses |
| Threats | Unauthorized commands, jamming, spoofing, and communication takeover |
| Case study | Reported GPS position anomalies in the Black Sea in 2017 |
| Security controls | Encryption, authentication, access control, and segmentation |
| Cloud architecture | Telemetry processing, storage protection, and controlled access |
| Resilience | Incident response, trusted recovery, and mission reliability |

## Practical Demonstration

### Two-Tone Signal Simulation

The demonstration uses GNU Radio Companion to combine two generated tones and observe their frequency spectrum.

| Component | Purpose |
|---|---|
| Tone 1 at 1 kHz | Illustrative genuine-signal model |
| Tone 2 at 1.2 kHz | Illustrative counterfeit-signal model |
| Add block | Combines the generated signals |
| Frequency display | Shows spectral peaks and relative signal strength |

### Why This Demonstration?

The flowgraph makes signal generation and combination easier to understand. In the demonstration both tones use amplitude 1, so the two peaks have similar height. Changing a tone's amplitude would change the height of its peak.

**Scope:** This is a conceptual signal-processing exercise. It does not generate a complete GPS navigation signal, demonstrate a GPS receiver accepting a false position, or validate spoofing detection. A stronger spectral peak alone does not prove spoofing.

### Screenshots

<p align="center">
  <img src="Screenshots/Spoofing%20samulation.png" alt="GNU Radio flowgraph with two tones and an Add block" width="70%">
</p>
<p align="center">
  <img src="Screenshots/Specturm%20analysis.png" alt="Spectrum output showing two tones near 1 kHz and 1.2 kHz" width="70%">
</p>

## Tools Discussed

| Tool | Role | Project use |
|---|---|---|
| **GNU Radio Companion** | Signal generation, processing, and spectrum observation | Used in the practical simulation |
| **Kali Linux** | Environment for running the demonstration | Used for the simulation |
| **SatNOGS** | Distributed satellite observation and ground-station network | Discussed as a relevant platform |
| **Kubernetes** | Management of containerized ground or cloud applications | Discussed in the cloud architecture |

SatNOGS and Kubernetes are included for their relevance to the topic; their inclusion does not imply that they were deployed in this project.

## Security Principles

- **Encryption** protects message confidentiality.
- **Authentication and integrity checks** help verify message origin and detect unauthorized changes.
- **Authorization** restricts which actions an account or system may perform.
- **Freshness checks** help reject replayed messages.
- **Network segmentation** reduces unnecessary communication between systems.
- **Data validation** checks information before it supports operational decisions.
- **Tested recovery procedures** help restore trusted service after an incident.

These controls reduce risk when properly implemented and maintained. No individual control guarantees complete protection.

## Frameworks and Standards Discussed

| Resource | Relevance |
|---|---|
| **CCSDS Space Data Link Security** | Security mechanisms for space data links |
| **NIST SP 800-53** | Security and privacy control catalogue |
| **ISO/IEC 27001** | Information security management system requirements |
| **ISO/IEC 27033** | Network security guidance |
| **ECSS-E-ST-80C** | Security across space-system lifecycles |

These resources are discussed as guidance and requirements relevant to the subject. This project does not claim certification or verified compliance.

## Case Study: Black Sea 2017

Multiple vessels reported incorrect GPS positions in the Black Sea, consistent with suspected spoofing.

The case illustrates the importance of checking navigation information against independent sources and maintaining safe fallback procedures.

**Reference:** [Inside GNSS: Reports of Mass GPS Spoofing Attack in the Black Sea](https://insidegnss.com/reports-of-mass-gps-spoofing-attack-in-the-black-sea-strengthen-calls-for-pnt-backup/)

## Key Takeaways

1. Satellite cybersecurity extends beyond the spacecraft.
2. Jamming and spoofing affect reception and trust in different ways.
3. Encryption, authentication, and validation serve different purposes.
4. A signal simulation must be distinguished from a demonstrated receiver attack.
5. Monitoring and recovery support reliable mission operations.

## Repository Contents

| Folder | What is inside |
|---|---|
| [presentation](presentation) | Presentation (PDF) |
| [demo-video](demo-video) | Demo video of the GNU Radio simulation |
| [Screenshots](Screenshots) | Flowgraph and spectrum screenshots |
| [Code_Files](Code_Files) | GNU Radio install steps and simulation steps |

## Project Scope

This repository documents an academic presentation and a simplified signal-processing demonstration. It does not represent a deployed satellite security system or testing against operational satellite infrastructure.

*For educational purposes only. All simulations were done in an isolated virtual environment. No real GPS signals were transmitted or interfered with.*
