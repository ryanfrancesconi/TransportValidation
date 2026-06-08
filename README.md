# TransportValidation

A macOS Audio Unit v3 extension that reads and displays host transport state in real time. Useful for verifying that a host application is correctly providing `musicalContextBlock` and `transportStateBlock` data to its AU chain.

## What It Does

The AU (`aufx/tval/SpFk`) passes audio through unmodified. On every render cycle it reads:

- **Musical context** — tempo, time signature, beat position, measure downbeat, sample offset to next beat
- **Transport state** — transport flags (playing, recording, looping), sample position, cycle start/end

These values are captured into a `TransportSnapshot` and displayed in a live inspector panel that refreshes at 10 fps.

## Structure

| Target | Description |
|--------|-------------|
| `TransportValidation` | Container app — hosts the AU using `AVAudioEngine` and `SimplePlayEngine` |
| `TransportValidationExtension` | AU App Extension (`.appex`) — thin factory that wires `TransportValidationAU` to `TransportValidationViewController` |

The AU implementation lives in [spfk-au-host](https://github.com/ryanfrancesconi/spfk-au-host) (`SPFKAUHost/Validation/`), which this project links as a local Swift package.

## Requirements

- macOS 14+
- Xcode 16+
- [spfk-au-host](https://github.com/ryanfrancesconi/spfk-au-host) checked out alongside this repo (referenced as a local package dependency)
