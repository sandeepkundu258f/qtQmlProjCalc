# QtQmlProjCalc

A calculator application (because I was bored) built with **Qt 6.10** and **QML**. This project is designed to be cross-platform compatible, with specific optimizations and packaging support for **Fedora KDE** and **Linux Mint Cinnamon**.

## Quick Install

Use the pre-built package from the [**Releases**](../../releases) section of this repository!

- **Linux Mint / Ubuntu / Debian** → download the `.deb` file
- **Fedora** → download the `.rpm` file

Then follow the [Installation & Removal](#installation--removal) steps below to install it.

## Features

- **Modern Framework**: Built using the latest Qt 6.10 features.
- **Responsive UI**: Clean, QML-based interface that adapts to system themes.
- **Native Packaging**: Integrated build scripts for generating native `.deb` and `.rpm` packages.
- **System Integration**: Automatic desktop integration including menu icons and shortcuts.

---

## Prerequisites

Before building the project from source, ensure you have the necessary development tools for your specific Linux distribution.

### Fedora (KDE / GNOME)

```bash
sudo dnf install gcc-c++ cmake ninja-build rpm-build mesa-libGL-devel
```

### Linux Mint / Ubuntu / Debian

```bash
sudo apt update
sudo apt install build-essential cmake ninja-build qt6-base-dev libgl1-mesa-dev
```

> **Note:** This project expects the Qt SDK to be installed (typically via the Qt Online Installer) in your home directory at `~/Qt`.

---

## Building and Packaging

Automated scripts are provided to handle the CMake configuration and CPack generation.

### 1. Set Permissions

First, ensure the scripts are executable:

```bash
chmod +x generateDEB.sh generateRPM.sh
```

### 2. Generate a Debian Package (`.deb`)

To build for Linux Mint or Ubuntu:

```bash
./generateDEB.sh
```
Packages will be generated inside the `DEB_build/` directory.

### 3. Generate an RPM Package (`.rpm`)

To build for Fedora:

```bash
./generateRPM.sh
```

Packages will be generated inside the `RPM_build/` directory.

---

## Installation & Removal

### Linux Mint / Ubuntu / Debian

**To Install:**

```bash
sudo apt install ./DEB_build/qtqmlprojcalc_*.deb
```

**To Remove (Purge):**

```bash
sudo apt purge qtqmlprojcalc
```

### Fedora / RPM

**To Install:**

```bash
sudo dnf install ./RPM_build/qtqmlprojcalc-*.rpm
```

**To Remove:**

```bash
sudo dnf remove qtqmlprojcalc
```

---

## License

This project is licensed under the **[GNU GPL v3](LICENSE)**. This software uses the Qt Framework, which is licensed under the **GNU GPL v3**/**GNU LGPL v3**. For more information, please visit the [Qt website](https://www.qt.io/).
