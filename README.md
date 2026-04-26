# virtualization-qcow2-image-generator

A Bash script that generates a predefined matrix of `.qcow2` virtual machine disk images for QEMU/KVM and libvirt environments.

The script automatically creates organized VM image files inside:

```bash
/var/lib/libvirt/images
```

Images are named using the current year and VM profile:

```bash
2026-KDE_ARCH.qcow2
2026-GNOME_FEDORA.qcow2
2026-COSMIC_NIXOS.qcow2
```

---

# Features

- Automatically creates multiple QCOW2 VM images
- Uses optimized QCOW2 settings:
  - `lazy_refcounts=on`
  - `cluster_size=2M`
- Prevents duplicate image creation for the current year
- Colorized terminal output
- Organized WM/DE × Linux flavor matrix
- Easy to edit and extend

---

# Requirements

Before generating VM images, it is recommended to verify that your system supports virtualization properly.

## Recommended Virtualization Validation

Use:

:contentReference[oaicite:0]{index=0}

Repository:

```bash
https://github.com/Querzion/virtualization-checker
```

This helps verify:

- CPU virtualization support
- KVM availability
- Kernel module status
- IOMMU support
- Libvirt configuration
- QEMU/KVM readiness
- BIOS/UEFI virtualization settings

---

## If Not; Then Here Are The Required Packages

### Debian / Ubuntu

```bash
sudo apt install qemu-utils
```

### Arch Linux

```bash
sudo pacman -S qemu-img
```

### Fedora

```bash
sudo dnf install qemu-img
```

### openSUSE

```bash
sudo zypper install qemu-tools
```

---

# Usage

## Make script executable

```bash
chmod +x virtualization-qcow2-image-generator.version.03.sh
```

## Run script

```bash
sudo ./virtualization-qcow2-image-generator.version.03.sh
```

---

# Generated Image Location

All images are created in:

```bash
/var/lib/libvirt/images
```

---

# Naming Convention

Generated files follow this structure:

```bash
YEAR-WM_DISTRO.qcow2
```

Example:

```bash
2026-KDE_ARCH.qcow2
2026-HYPRLAND_PIKAOS.qcow2
2026-COSMIC_NIXOS.qcow2
```

---

# Included VM Profiles

## KDE Plasma

- KDE_ARCH
- KDE_ARCH_NIX
- KDE_CACHYOS
- KDE_CACHYOS_NIX
- KDE_FEDORA
- KDE_UBUNTU
- KDE_KDENEON
- KDE_ARCOLINUX
- KDE_NIXOS
- KDE_PIKAOS

## GNOME

- GNOME_FEDORA
- GNOME_UBUNTU
- GNOME_PIKAOS
- GNOME_ARCH
- GNOME_ARCH_NIX
- GNOME_CACHYOS
- GNOME_CACHYOS_NIX
- GNOME_NIXOS

## Hyprland

- HYPRLAND_ARCH
- HYPRLAND_ARCH_NIX
- HYPRLAND_CACHYOS
- HYPRLAND_CACHYOS_NIX
- HYPRLAND_OMARCHY
- HYPRLAND_PIKAOS

## Niri

- NIRI_ARCH
- NIRI_ARCH_NIX
- NIRI_CACHYOS
- NIRI_CACHYOS_NIX
- NIRI_PIKAOS

## COSMIC

- COSMIC_POPOS
- COSMIC_ARCH
- COSMIC_CACHYOS
- COSMIC_FEDORA
- COSMIC_PIKAOS
- COSMIC_NIXOS

## XFCE

- XFCE_ARCH
- XFCE_NIXOS

## Cinnamon

- CINNAMON_MINT

## DWM

- DWM_ARCH
- DWM_ARCH_NIX
- DWM_NIXOS

---

# Mock Output

```bash
Creating VM QCOW2 images in: /var/lib/libvirt/images
Year tag: 2026
WM/DE × Linux Flavor matrix
----------------------------------------

Creating... /var/lib/libvirt/images/2026-KDE_ARCH.qcow2 (40G)
'/var/lib/libvirt/images/2026-KDE_ARCH.qcow2' created.

Creating... /var/lib/libvirt/images/2026-GNOME_FEDORA.qcow2 (40G)
'/var/lib/libvirt/images/2026-GNOME_FEDORA.qcow2' created.

Creating... /var/lib/libvirt/images/2026-COSMIC_NIXOS.qcow2 (80G)
'/var/lib/libvirt/images/2026-COSMIC_NIXOS.qcow2' created.

Creating... /var/lib/libvirt/images/2026-DWM_ARCH.qcow2 (25G)
'/var/lib/libvirt/images/2026-DWM_ARCH.qcow2' created.

----------------------------------------
All VM images processed successfully.
```

---

# Duplicate Protection

If an image already exists for the current year, the script skips creation:

```bash
'/var/lib/libvirt/images/2026-KDE_ARCH.qcow2' from this year already exists.
'/var/lib/libvirt/images/2026-KDE_ARCH.qcow2' not created.
```

---

# Extending the Script

To add a new VM image profile:

```bash
create_vm "KDE_DEBIAN" "40G"
```

Syntax:

```bash
create_vm "NAME" "SIZE"
```

Example:

```bash
create_vm "GNOME_DEBIAN" "40G"
create_vm "HYPRLAND_FEDORA" "50G"
```

---

# Notes

- Requires root permissions to write into `/var/lib/libvirt/images`
- Designed for QEMU/KVM + libvirt environments
- Uses sparse QCOW2 images
- Intended for rapid VM lab provisioning and distro testing

---

## License

MIT — do whatever you want with it.
