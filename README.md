<div align="center">
  <img src="logo.png">
  <br>
  <b>A very SeXy WM</b> <br>
  <br><br>
  <img src="https://img.shields.io/github/v/release/uint23/sxwm?style=flat-square">
  <img src="https://img.shields.io/github/license/uint23/sxwm?style=flat-square">
</div>

---

## Contributions & Issues

Please read [the contribution guide](docs/CONTRIBUTIONS.md)
Please read [the developer docs](docs/sxwm-dev.md)

---

## Features & Configuration

Check [the man page markdown for relevant info](docs/sxwm.md)

---
## Dependencies

- `libX11`
- `Xinerama`
- `XCursor`
- `CC`
- GNU Make

<details>
<summary>Debian / Ubuntu / Linux Mint</summary>
<pre><code>sudo apt update
sudo apt install libx11-dev libxcursor-dev libxinerama-dev build-essential</code></pre>
</details>

<details>
<summary>Arch Linux / Manjaro</summary>
<pre><code>sudo pacman -Syy
sudo pacman -S libx11 libxinerama gcc make</code></pre>
</details>
<details>
<summary>Gentoo</summary>
<pre><code>sudo emerge --ask x11-libs/libX11 x11-libs/libXinerama sys-devel/gcc sys-devel/make
sudo emaint -a sync
</code></pre>
</details>

<details>
<summary>Void Linux</summary>
<pre><code>sudo xbps-install -S
sudo xbps-install libX11-devel libXinerama-devel libXcursor-devel gcc make</code></pre>
</details>
<details>
<summary>Fedora / RHEL / AlmaLinux / Rocky</summary>
<pre><code>sudo dnf update
sudo dnf install libX11-devel libXcursor-devel libXinerama-devel gcc make</code></pre>
</details>

<details>
<summary>OpenSUSE (Leap / Tumbleweed)</summary>
<pre><code>sudo zypper refresh
sudo zypper install libX11-devel libXinerama-devel gcc make</code></pre>
</details>
<details>
<summary>Alpine Linux</summary>
<pre><code>doas apk update
doas apk add libx11-dev libxinerama-dev libxcursor-dev gcc make musl-dev linux-headers</code></pre>
</details>

<details>
<summary>NixOS</summary>
<pre><code>buildInputs = [
  pkgs.xorg.libX11
  pkgs.xorg.libXinerama
  pkgs.libgcc
  pkgs.gnumake
];
sudo nixos-rebuild switch
</code></pre>
</details>

<details>
<summary>Slackware</summary>
<pre><code>slackpkg update
slackpkg install gcc make libX11 libXinerama</code></pre>
</details>
<details>
<summary>OpenBSD</summary>
<pre><code>doas pkg_add gmake</code></pre>
You will also need the X sets (<code>xbase</code>, <code>xfonts</code>, <code>xserv</code> and <code>xshare</code>) installed.

sxwm uses GNU Make. On OpenBSD, use <code>gmake</code> instead of the system BSD <code>make</code>:

<pre><code>gmake
doas gmake install</code></pre>

The Makefile automatically uses <code>/usr/X11R6/include</code> and <code>/usr/X11R6/lib</code> on OpenBSD.
</details>
<details>
<summary>FreeBSD</summary>
<pre><code># If you use doas or su instead of sudo, modify the following commands accordingly.
sudo pkg update
sudo pkg install gmake libX11 libXinerama libXcursor</code></pre>

sxwm uses GNU Make. On FreeBSD, use <code>gmake</code> instead of the system BSD <code>make</code>:

<pre><code>gmake
sudo gmake install</code></pre>

The Makefile automatically uses <code>/usr/local/include</code> and <code>/usr/local/lib</code> on FreeBSD.
</details>

<details>
<summary>Termux</summary>
<pre><code>pkg install x11-repo
pkg update
pkg install clang make xcb-util-keysyms xorgproto libxcursor libx11 libxinerama libandroid-wordexp
# add `LDFLAGS="${LDFLAGS} -landroid-wordexp"` in the make command
</code></pre>
</details>

---
## Build & Install

> [!NOTE]
> I don't maintain any packages. Use with caution!

### Arch Linux (AUR)

```sh
yay -S sxwm
```

#### OR for latest features

```sh
yay -S sxwm-git
```

### Void Linux

```sh
sudo xbps-install -S sxwm
```

### Build from Source

Clone the repository:

```sh
git clone --depth=1 https://github.com/uint23/sxwm.git
cd sxwm/
```

On Linux and other systems where GNU Make is installed as `make`:

```sh
make
sudo make install
```

On FreeBSD:

```sh
gmake
sudo gmake install
```

On OpenBSD:

```sh
gmake
doas gmake install
```
### Run

Add to your `~/.xinitrc`:
```sh
exec sxwm
```
Or use the `sxwm.desktop` file

---
## Makefile Targets

The Makefile requires GNU Make. On Linux it is normally invoked as `make`; on FreeBSD and OpenBSD use `gmake`.

| Target | Linux | FreeBSD / OpenBSD | Description |
|---|---|---|---|
| build | `make` / `make all` | `gmake` / `gmake all` | Build the `sxwm` binary |
| clean | `make clean` | `gmake clean` | Remove build artifacts |
| install | `make install` | `gmake install` | Install `sxwm` to `$(PREFIX)/bin` (default `/usr/local`) |
| uninstall | `make uninstall` | `gmake uninstall` | Remove installed binary |
| clean install | `make clean install` | `gmake clean install` | Clean then install |

> Override install directory with `PREFIX`:
>
> Linux:
> ```sh
> make install PREFIX=$HOME/.local
> ```
>
> FreeBSD / OpenBSD:
> ```sh
> gmake install PREFIX=$HOME/.local
> ```

---
## Thanks & Inspiration

- [dwm](https://dwm.suckless.org) - Tiling & source code
- [i3](https://i3wm.org) - Easy configuration
- [sowm](https://github.com/dylanaraps/sowm) - README inspiration
- [tinywm](http://incise.org/tinywm.html) - Minimal X11 WM

---

<p align="center">
  <em>uint [2026]</em>
</p>
