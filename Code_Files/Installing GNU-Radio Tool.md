
# Installing GNU Radio on Kali Linux

**Space Systems & Aerospace Cybersecurity**

## Purpose

This guide explains how to install GNU Radio and launch GNU Radio Companion on Kali Linux. GNU Radio is used in this project to build a simple signal simulation for the space systems and aerospace cybersecurity presentation.

## 1. Update System Package Lists

**Command:**

```bash
sudo apt update
```

**Purpose:**
- Refreshes the local package lists.
- Checks the available package information from the configured repositories.
- Helps the system find available software versions.

## 2. Upgrade Installed Packages

**Command:**

```bash
sudo apt upgrade
```

**Purpose:**
- Installs available upgrades for existing packages.
- Helps keep the system updated.
- May take some time, depending on the number of available updates.

Review the proposed changes and follow the terminal prompts.

## 3. Install GNU Radio

**Command:**

```bash
sudo apt install gnuradio
```

**Purpose:**
- Installs GNU Radio and its required packages.
- Provides tools for creating and processing simulated signals.
- Allows users to build signal-processing flowgraphs.

## 4. Launch GNU Radio Companion

**Command:**

```bash
gnuradio-companion
```

**Purpose:**
- Opens the GNU Radio Companion graphical interface.
- Allows users to add, configure, and connect blocks.
- Makes it possible to create and run signal-processing flowgraphs.

## 5. Check the Required Blocks

After GNU Radio Companion opens, check that the following blocks are available for the simulation:

- Variable
- Signal Source
- Add
- QT GUI Frequency Sink

These blocks are used to generate two test tones, combine them, and display their frequency spectrum.

## 6. Prepare the Simulation

For the demonstration in this project, use the following settings:

- Sample rate: `32k`
- First signal frequency: `1k`
- Second signal frequency: `1.2k`
- Amplitude of both signals: `1`
- FFT size: `1024`

Connect both Signal Source blocks to the Add block, then connect the Add block to the QT GUI Frequency Sink.

The resulting spectrum allows the two simulated tones to be observed.

## Safety and Scope

Kali Linux is used as the environment for this educational simulation. The demonstration uses locally generated test tones and does not transmit real GPS signals or interfere with satellite navigation services.

## Conclusion

GNU Radio Companion provides a graphical way to create and study signal-processing flowgraphs. In this project, it is used to demonstrate signal generation, signal combination, and frequency-spectrum analysis as part of space systems and aerospace cybersecurity.
