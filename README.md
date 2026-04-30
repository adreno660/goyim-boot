# SH1MKEX 🚀
**The Multi-Distro Kexec Bootloader for Chromebooks**

SH1MKEX (Shimboot-Kexec) is an evolution of the [Shimboot](https://github.com/ading2210/shimboot) project. It transforms a standard RMA shim into a universal bootloader that can "jump" into any Linux distribution using `kexec`.

### 🌟 Why SH1MKEX?
Standard Shimboot only lets you use pre-set distros without customization.

**SH1MKEX changes the game:**
- **True Multi-Boot:** Scan and boot multiple OS partitions from a single USB.
- **Kernel Jumping:** Uses `kexec` to shut down the shim kernel and boot into a modern, distro-specific kernel (Arch, Ubuntu, Fedora, etc.).
- **No Patches Needed:** By jumping to a native kernel, you don't need patched `systemd` binaries or specialized rootfs hacks.
- **Persistence:** Runs entirely from external media; no modification to your internal ChromeOS or enrollment status.

---

### 🛠️ How it Works
1. **The Loader:** A minimal Debian base (built with SH1MKEX scripts) boots via the RMA shim.
2. **The Selector:** A custom `bootstrap.sh` menu scans the USB for partitions containing a `vmlinuz` file.
3. **The Jump:** Once selected, the loader uses `kexec-tools` to load the new kernel/initrd into memory and instantly reboots into your target OS.

---

### 🚀 Building & Setup

#### 1. Build the SH1MKEX Base
Clone this repo and build your loader image. Run the files 'build_rootfs.sh' and 'build_squashfs.sh' before running 'build.sh'

#### 2. Prepare the USB
Flash the generated `.bin` to your USB drive. Afterward, use `gparted` to add extra partitions at the end of the drive for your target distros (e.g., Arch Linux, Alpine).

#### 3. Label your Partitions
SH1MKEX looks for partitions with specific flags. Ensure your target OS partitions are labeled or flagged in a way the `bootstrap.sh` script can identify them as bootable rootfs targets.

---

### 📂 Repository Structure
- `bootstrap.sh`: The "brain" of the bootloader. Handles the UI and the `kexec` logic.
- `build_rootfs.sh`: Enhanced build script that injects dependencies.
- `rootfs/`: The skeleton for the Debian-based loader environment.

---

### ⚠️ Requirements & Warnings
- **Developer Mode:** Must be enabled on the target Chromebook. (We recommend enabling it, then going to the recovery menu before it can be revoked.)
- **Kernel Drivers:** Ensure the kernel on your *target* distro (e.g., Arch) includes drivers for Chromebook hardware (touchpad, audio, etc.). We recommend using Eupnea or Depthcharge kernels.
- **Board Compatibility:** Only works on boards supported by the original Shimboot project (where RMA shims are available).

---

### 🤝 Credits
- [ading2210](https://github.com/ading2210) for the original Shimboot.
- The [Mercury Workshop](https://mercurywork.shop) and [Sh1mmer](https://sh1mmer.me) teams.
