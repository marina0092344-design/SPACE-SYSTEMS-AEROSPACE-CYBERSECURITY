###GPS Spoofing Signal Simulation###
Space Systems & Aerospace Cybersecurity — GNU Radio on Kali Linux

0. Set Sample Rate Variable
Action: Add Variable block
Settings:
ID = samp_rate    Value = 32k
Purpose: Defines global sample rate used across all blocks

1. Create Real Satellite Signal
Action: Add Signal Source block
Settings:
Frequency = 1k    Waveform = Sine    Sample Rate = 32k    Amplitude = 1
Purpose: Represents the legitimate satellite signal

2. Create Spoofed GPS Signal
Action: Add second Signal Source block
Settings:
Frequency = 1.2k    Waveform = Sine    Sample Rate = 32k    Amplitude = 1
Purpose: Simulates the fake GPS signal sent by an attacker

3. Combine Both Signals
Action: Add Add block
Purpose: Merges real and spoofed signals together, simulating a spoofing attack

4. Visualize Spectrum
Action: Add QT GUI Frequency Sink
Settings:
FFT Size = 1024    Center Frequency (Hz) = 0    Bandwidth (Hz) = 32k
Purpose: Displays frequency spectrum comparing real and spoofed signals

_________________________________________
###Output Analysis###
Spoofed GPS signal detected at 6.64 kHz, -35.68 dB
Real satellite signal is significantly weaker and spread across the spectrum
Sharp, stronger peak confirms the spoofed signal overpowers the real one

Tool used: GNU Radio Companion on Kali Linux
Environment: Isolated virtual machine — no real GPS signals were transmitted or interfered with
