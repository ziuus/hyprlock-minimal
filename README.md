# 🔒 hyprlock-minimal

> **Cinematic Lock Protocol — A minimalist, high-performance security interface for the Hyprland compositor.**

hyprlock-minimal is a bespoke security layer designed for modern Wayland environments. It prioritizes pure aesthetic clarity and kinetic feedback, providing a rice-compatible lock screen that blends seamlessly into minimalist desktop configurations while maintaining robust session security.

---

## ⚡ Core Features

- **Kinetic Feedback**: Smooth, GPU-accelerated input animations and transition states.
- **Glassmorphic UI**: Layered transparency and background blur effects optimized for high-refresh-rate displays.
- **Minimalist Footprint**: Pure configuration-based implementation with zero daemon overhead.
- **Rice Integration**: Native support for typography pairing (Inter) and atmospheric palettes.

---

## 📦 Prerequisites & Dependencies

Before deploying or previewing, verify the required packages:

| Dependency | Package Name | Installation Command |
| :--- | :--- | :--- |
| **hyprlock** | `hyprlock` | `pacman -S hyprlock` / `dnf install hyprlock` |
| **Typography** | `ttf-inter` | `pacman -S ttf-inter` / `apt install fonts-inter` |
| **Compositor** | `hyprland` | Hyprland Wayland Compositor |

---

## 🛠 Contributor Preview Guide

When modifying or contributing changes to `hyprlock.conf`, use these workflows to preview changes locally without overwriting your primary system configuration.

### 1. Instant Syntax Validation
Validate structure and color formatting without locking your display:
```bash
./preview.sh --check
```

### 2. Safe Live Preview (No Overwrite)
Test your working copy directly with a 5-second unlock grace period:
```bash
# Launch preview with 5-second unlock grace period
./preview.sh --grace 5

# Or invoke hyprlock directly
hyprlock --config ./hyprlock.conf --grace 5
```
> **Tip:** With `--grace 5`, moving your mouse or pressing any key within 5 seconds dismisses the lock screen immediately without requiring your password.

### 3. Safe Mode & Revert Tips
To ensure you never lock yourself out during customization:
1. **Always backup existing configuration before deploying:**
   ```bash
   cp ~/.config/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf.bak
   ```
2. **Test in a separate terminal session:**
   Keep an active terminal open so you can revert if needed.
3. **Emergency TTY Recovery:**
   If a broken configuration ever prevents unlocking, press `Ctrl + Alt + F3` (or `F4`), log in to the virtual terminal, and run:
   ```bash
   killall hyprlock
   cp ~/.config/hypr/hyprlock.conf.bak ~/.config/hypr/hyprlock.conf
   ```
   Then switch back to your graphical session with `Ctrl + Alt + F1` or `F2`.

---

## 🚀 Deployment

Once your configuration adjustments are verified:

```bash
mkdir -p ~/.config/hypr
cp hyprlock.conf ~/.config/hypr/hyprlock.conf
```

Launch manually with:
```bash
hyprlock
```

Or bind it in your `hyprland.conf`:
```ini
bind = $mainMod, L, exec, hyprlock
```

---

*Security, Redefined by Aesthetic Clarity.*
