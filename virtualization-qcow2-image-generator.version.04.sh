#!/usr/bin/env bash

# =========================================================
#   virtualization-qcow2-image-generator.version.04.sh
# =========================================================

set -e

BASE_DIR="/var/lib/libvirt/images"
YEAR=$(date +%Y)

# =========================
# Colors (ANSI)
# =========================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
WHITE='\033[0;37m'
ORANGE='\033[0;33m'
NC='\033[0m' # reset

echo -e "${BLUE}Creating VM QCOW2 images in:${RESET} $BASE_DIR"
echo -e "${BLUE}Year tag:${RESET} $YEAR"
echo "WM/DE × Linux Flavor matrix"
echo "----------------------------------------"



create_vm () {
    VM_NAME=$1
    SIZE=$2

    YEAR=$(date +%Y)
    FILE="$BASE_DIR/${YEAR}-${VM_NAME}.qcow2"

    echo
    echo -e "${BLUE}Creating...${NC} ${WHITE}$BASE_DIR/${NC}${BLUE}${YEAR}-${VM_NAME}.qcow2${NC} ${YELLOW}($SIZE)${NC}"

    if [ -f "$FILE" ]; then
        echo -e "${ORANGE}'$FILE' from this year already exists.${NC}"
        echo -e "${PURPLE}'$FILE' not created.${NC}"
        echo
        return
    fi

    qemu-img create \
        -f qcow2 \
        -o lazy_refcounts=on,cluster_size=2M \
        "$FILE" \
        "$SIZE" >/dev/null

    echo -e "${WHITE}'$FILE'${NC} ${GREEN}created.${NC}"
    echo
}

# =========================================================
# KDE PLASMA
# =========================================================
create_vm "KDE_ARCH" "40G"
create_vm "KDE_ARCH_NIX" "70G"

create_vm "KDE_CACHYOS" "45G"
create_vm "KDE_CACHYOS_NIX" "75G"

create_vm "KDE_FEDORA" "40G"

create_vm "KDE_UBUNTU" "40G"

create_vm "KDE_KDENEON" "45G"

create_vm "KDE_ARCOLINUX" "45G"

create_vm "KDE_NIXOS" "80G"

create_vm "KDE_PIKAOS" "45G"

# =========================================================
# GNOME
# =========================================================
create_vm "GNOME_FEDORA" "40G"

create_vm "GNOME_UBUNTU" "40G"

create_vm "GNOME_PIKAOS" "45G"

create_vm "GNOME_ARCH" "40G"
create_vm "GNOME_ARCH_NIX" "70G"

create_vm "GNOME_CACHYOS" "45G"
create_vm "GNOME_CACHYOS_NIX" "75G"

create_vm "GNOME_NIXOS" "80G"

# =========================================================
# HYPRLAND
# =========================================================
create_vm "HYPRLAND_ARCH" "40G"
create_vm "HYPRLAND_ARCH_NIX" "70G"

create_vm "HYPRLAND_CACHYOS" "45G"
create_vm "HYPRLAND_CACHYOS_NIX" "75G"

create_vm "HYPRLAND_OMARCHY" "45G"

create_vm "HYPRLAND_PIKAOS" "45G"

# =========================================================
# NIRI
# =========================================================
create_vm "NIRI_ARCH" "40G"
create_vm "NIRI_ARCH_NIX" "70G"

create_vm "NIRI_CACHYOS" "45G"
create_vm "NIRI_CACHYOS_NIX" "75G"

create_vm "NIRI_PIKAOS" "45G"

# =========================================================
# COSMIC
# =========================================================
create_vm "COSMIC_POPOS" "60G"

create_vm "COSMIC_ARCH" "60G"

create_vm "COSMIC_CACHYOS" "60G"

create_vm "COSMIC_FEDORA" "60G"

create_vm "COSMIC_PIKAOS" "60G"

create_vm "COSMIC_NIXOS" "80G"

# =========================================================
# XFCE
# =========================================================
create_vm "XFCE_ARCH" "30G"

create_vm "XFCE_NIXOS" "60G"

# =========================================================
# CINNAMON
# =========================================================
create_vm "CINNAMON_MINT" "40G"

# =========================================================
# MANGO WM
# =========================================================
create_vm "MANGO_ARCH" "25G"
create_vm "MANGO_ARCH_NIX" "60G"

create_vm "MANGO_CACHYOS" "25G"
create_vm "MANGO_CACHYOS_NIX" "60G"

echo "----------------------------------------"
echo -e "${GREEN}All VM images processed successfully.${RESET}"
