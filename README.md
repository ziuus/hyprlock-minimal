# 🔒 hyprlock-minimal

> **Cinematic Lock Protocol — A minimalist, high-performance security interface for the Hyprland compositor.**

hyprlock-minimal is a bespoke security layer designed for modern Wayland environments. It prioritizes pure aesthetic clarity and kinetic feedback, providing a "Rice-compatible" lock screen that blends seamlessly into minimalist desktop configurations while maintaining robust session security.

## ⚡ Core Features

- **Kinetic Feedback**: Smooth, GPU-accelerated input animations and transition states.
- **Glassmorphic UI**: Layered transparency and background blur effects optimized for high-refresh-rate displays.
- **Minimalist Footprint**: Pure configuration-based implementation—zero daemon overhead.
- **Rice Integration**: Native support for high-end font pairings and atmospheric color palettes (e.g., Catppuccin, Nord).

## 🛠 Configuration

This repository provides a production-ready `hyprlock.conf`. To integrate it into your system:

1. **Install Hyprlock**:
   Ensure `hyprlock` is installed via your package manager (e.g., `yay -S hyprlock`).

2. **Deploy Configuration**:
   ```bash
   mkdir -p ~/.config/hypr
   cp hyprlock.conf ~/.config/hypr/
   ```

3. **Execution**:
   Run `hyprlock` to initiate the cinematic lock protocol.

---
*Security, Redefined by Aesthetic Clarity.*
