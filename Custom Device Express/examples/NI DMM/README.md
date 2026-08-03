# NIDMM Example Custom Device

An example NI VeriStand custom device for controlling an NI DMM instrument.

---

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Building from Source](#building-from-source)
- [Adding the Custom Device to a System Definition](#adding-the-custom-device-to-a-system-definition)
- [Configuration Reference](#configuration-reference)
  - [Custom Device Properties](#custom-device-properties)
  - [Sections](#sections)
- [Typical Workflow](#typical-workflow)

---

## Overview

<!-- TODO: Add a short description of what this custom device does and the use cases it targets. -->

---

## Requirements

| Component | Version |
| --- | --- |
| NI VeriStand | 2026 Q3 or later |
| LabVIEW | 2026 Q3 or later |
| NI-DMM Driver | 26.5 or later |
| Supported Targets | Windows, Linux RT |
| Supported DMM Models | NI 407x/8x |

---

## Building from Source

1. Build all of the LabVIEW projects in this repository.
2. Copy the built custom device folder `NIDMM Custom Device/Builds/NIDMM/` to the VeriStand custom device search directory:
   - `C:\Users\Public\Documents\National Instruments\NI VeriStand <version>\Custom Devices\`
3. Restart NI VeriStand so the custom device is discovered.

---

## Adding the Custom Device to a System Definition

1. Open your system definition file in the **VeriStand System Explorer**.
2. Navigate to **Targets » Controller » Custom Devices**.
3. Right-click **Custom Devices** and select **NIDMM**.
4. Select the newly added **NIDMM** item and configure the [custom device properties](#custom-device-properties).
5. Save the system definition and deploy.

---

## Configuration Reference

### Custom Device Properties

Configured on the top-level **NIDMM** custom device page.

| Property | Data Type | Default | Description |
| --- | --- | --- | --- |
| `ResourceName` | String | `PXI1Slot2` | Instrument resource name of the DMM. <!-- TODO: describe how to find this, e.g. NI MAX --> |
| `Model` | String | *(empty)* | Optional. DMM model (`407x/8x`). This property is currently ignored by the custom device. |
| `ResolutionDigits` | Double | `0.000000` | Measurement resolution, in digits. Valid values vary per DMM model (for example, `3.5`, `5.5`, and so on). |
| `ACMinFrequency` | Double | `0.000000` | Specifies the minimum expected frequency component of the input signal, in hertz. Applies only when the function is an AC measurement. |
| `ACMaxFrequency` | Double | `0.000000` | Specifies the maximum expected frequency component of the input signal, in hertz. Applies only when the function is an AC measurement. |
| `ScanPeriod(ms)` | Double | `0.000000` | Loop rate, in milliseconds, of the custom device's asynchronous process, which runs as a timed loop. |

### Sections

The custom device defines two default sections:

- **Voltage**
- **Current**

Neither section exposes configuration properties; they only contain channels.

---

### Device-Level Channels

#### Inputs — group name `DeviceInputs`

| Channel | Default | Description |
| --- | --- | --- |
| `Mode` | `0` | Selects the measurement mode of the DMM: `0` = Voltage, `1` = Current. The DMM can operate in only one mode at a time. |

#### Outputs — group name `DeviceOutputs`

| Channel | Default | Description |
| --- | --- | --- |
| `ActiveMode` | `0` | Reports the mode currently selected on the device. `1` = DC Voltage, `2` =  AC Voltage, `3` =  DC Current, `4` =  AC Current.|
| `DeviceStatus` | `0` | Last error code reported by the asynchronous loop. `0` = no errors. |
| `Heartbeat` | `0` | Running counter that indicates the device loop is functioning normally. Use for debugging. |

### Voltage Section Channels

#### Inputs — group name `VoltageInputs`

| Channel | Default | Description |
| --- | --- | --- |
| `VoltageFunction` | `0` | Selects the voltage measurement function: `0` = DC, `1` = AC. |
| `VoltageRange` | `-1.0` | Mirrors the NI-DMM `Range` attribute. A value of `-1.0` turns auto-range on. Use positive values to represent the absolute value of the maximum expected measurement. |

#### Outputs — group name `VoltageOutputs`

| Channel | Default | Description |
| --- | --- | --- |
| `VoltageReading` | `0` | Measurement value read from the DMM. |
| `VoltageActualRange` | `0` | Range actually selected by the device. |
| `VoltageStatus` | `0` | Status of the measurement: `0` = Success, `1` = Failure. |

### Current Section Channels

#### Inputs — group name `CurrentInputs`

| Channel | Default | Description |
| --- | --- | --- |
| `CurrentFunction` | `0` | Selects the current measurement function: `0` = DC, `1` = AC. |
| `CurrentRange` | `0` | Mirrors the NI-DMM `Range` attribute. A value of `-1.0` turns auto-range on. Use positive values to represent the absolute value of the maximum expected measurement. |

#### Outputs — group name `CurrentOutputs`

| Channel | Default | Description |
| --- | --- | --- |
| `CurrentReading` | `0` | Measurement value read from the DMM. |
| `CurrentActualRange` | `0` | Range actually selected by the device. |
| `CurrentStatus` | `0` | Status of the measurement: `0` = Success, `1` = Failure. |

---

## Typical Workflow

1. Set `ResourceName`, `Model`, `ResolutionDigits`, `ACMinFrequency`, `ACMaxFrequency`, and `ScanPeriod(ms)` on the custom device page. (`Model` is optional and currently ignored.)
2. Deploy the system definition.
3. At run time, write to the input channels to control the device:
   - `Mode` — set the active measurement mode: `Voltage` / `Current`
   - `VoltageFunction` / `VoltageRange`
   - `CurrentFunction` / `CurrentRange`
4. Monitor the output channels:
   - `VoltageReading` / `VoltageActualRange` / `VoltageStatus`
   - `CurrentReading` / `CurrentActualRange` / `CurrentStatus`
   - `ActiveMode`, `DeviceStatus`, and `Heartbeat` for overall device health.

<!-- TODO: Add a worked example (e.g. screenshots of System Explorer, a sample workspace screen). -->
