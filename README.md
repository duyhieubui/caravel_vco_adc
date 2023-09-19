# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/duyhieubui/caravel_vco_adc/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/duyhieubui/caravel_vco_adc/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/duyhieubui/caravel_vco_adc/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/duyhieubui/caravel_vco_adc/actions/workflows/caravel_build.yml)

# Overview

This project implements a VCO-Based ADC on skywater 130nm for IoT.

![VCO-based ADC Block Diagram](./docs/images/vco-adc-arch.png?raw=True "VCO-Based ADC Block Diagram")

The ADC Specification:

- Target bandwidth: <100KHz for speed recording or IoT sensor readout.
- First-order noise shaping Sigma-Delta Architecture
- Configurable oversampling rate up-to 1024
- VCO linear frequency range: 2-10MHz
- 11 delay cells & 11 phase readout
- 32-bit sin3 filtter

The VCO is designed using the full custom design flow. It uses a
special inverter which has been tuned such that the linear frequency
range from 2MHz to 10MHz.

The sin3 filter is used to provide the first-order noise shaping.

Except for the VCO, the rest of the design has been implemented using
the digital design flow.

![System architecture](./docs/images/system-arch.png?raw=True "System Architecture")

# Contributors

- Duc-Manh Tran: VCO design, simulation & layout
- Ngo-Doanh Nguyen: System integration, RTL design & software for RISC-V
- Duy-Hieu Bui and Xuan-Tu Tran: PI
- The-Anh Nguyen
- Manh-Hiep Dao

Refer to [README](docs/source/index.rst#section-quickstart) for a quickstart of how to use caravel_user_project

Refer to [README](docs/source/index.rst) for this sample project documentation. 

Refer to the following [readthedocs](https://caravel-sim-infrastructure.readthedocs.io/en/latest/index.html) for how to add cocotb tests to your project. 