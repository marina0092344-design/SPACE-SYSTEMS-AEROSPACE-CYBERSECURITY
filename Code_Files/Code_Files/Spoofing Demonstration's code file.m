# GPS Spoofing Signal Simulation

**Space Systems & Aerospace Cybersecurity — GNU Radio Companion on Kali Linux**

## Purpose

This demonstration uses GNU Radio Companion to create and combine two simulated signals. It helps explain the basic concept of GPS spoofing and how signals can be viewed in a frequency spectrum.

This is a simplified educational simulation. The two tones are models only; they are not real GPS signals.

## 0. Set the Sample Rate Variable

**Action:** Add a Variable block.

**Settings:**
- ID: `samp_rate`
- Value: `32k`

**Purpose:**

Defines the sample rate used by the signal-processing blocks.

## 1. Create the Genuine Signal Model (Tone 1)

**Action:** Add a Signal Source block.

**Settings:**
- Frequency: `1k`
- Waveform: Sine
- Sample Rate: `samp_rate`
- Amplitude: `1`

**Purpose:**

Represents a simplified model of a genuine satellite signal. This is a test tone, not an actual GPS signal.

## 2. Create the Fake Signal Model (Tone 2)

**Action:** Add a second Signal Source block.

**Settings:**
- Frequency: `1.2k`
- Waveform: Sine
- Sample Rate: `samp_rate`
- Amplitude: `1`

**Purpose:**

Represents a simulated fake signal for explaining the concept of GPS spoofing. It does not contain real GPS navigation data.

## 3. Combine Both Signals

**Action:** Add an Add block.

**Connections:**
- Connect the first Signal Source to one input.
- Connect the second Signal Source to the other input.

**Purpose:**

Combines both simulated tones into one output signal so their frequency components can be observed together.

## 4. Visualize the Frequency Spectrum

**Action:** Add a QT GUI Frequency Sink block.

**Settings:**
- FFT Size: `1024`
- Center Frequency (Hz): `0`
- Bandwidth (Hz): `32k`

**Connection:**

Connect the output of the Add block to the QT GUI Frequency Sink.

**Purpose:**

Displays the frequency spectrum of the combined signal and allows us to observe the two simulated tones.

## 5. Run the Flowgraph

**Action:** Click **Execute the flow graph** (the play button).

**Result:** A spectrum window opens.

---

## Output Analysis

- The first signal source generates a tone at **1 kHz**.
- The second signal source generates a tone at **1.2 kHz**.
- The Add block combines both tones.
- The frequency spectrum shows peaks near the two configured frequencies. They are close together, so they can look like one double peak.
- Both signals have an amplitude of `1`, so their peaks have similar heights.
- The numbers shown by the mouse cursor in the spectrum window (for example 6.64 kHz, -35.68 dB) only show where the mouse pointer was. They are not results of the simulation.
- A peak in the spectrum alone does not prove that a GPS spoofing attack has occurred.
- This configuration does not demonstrate that the fake signal overpowers the genuine signal, because both signals have the same amplitude.

## Tool and Environment

- **Tool:** GNU Radio Companion
- **Operating System:** Kali Linux
- **Environment:** Isolated virtual machine

## Safety and Scope

This is an educational signal simulation. It does not generate or transmit an actual GPS signal and does not interfere with real satellite navigation services.

## Learning Outcome

This demonstration shows how to generate two test tones, combine them, and observe their frequency components using GNU Radio. It introduces signal analysis and helps explain why receiving a signal is not the same as verifying that the signal is genuine.
