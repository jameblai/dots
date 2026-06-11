# NixOS dots

Personal NixOS and Home Manager configuration for the `cipher` workstation.

The flake defines one system:

- user: `jamesblair`
- host: `cipher`
- repo path: `~/dots`
- desktop: KDE Plasma on Wayland
- browser: Helium
- monospace font: TX-02, Berkeley Mono, with Symbols Nerd Font fallback

## Layout

- `flake.nix`: inputs, formatter, checks, dev shell, and host wiring
- `hosts/cipher`: machine entry point and generated hardware configuration
- `modules/nixos`: reusable system modules
- `modules/home`: Home Manager modules
- `config`: dotfiles consumed by Home Manager
- `justfile`: day-to-day commands

## Setup

Clone the repo to the path used by the configuration:

```bash
nix shell nixpkgs#git -c git clone https://github.com/jameblai/dots ~/dots
cd ~/dots
```

On a fresh install, copy the generated hardware config before the first build:

```bash
cp /etc/nixos/hardware-configuration.nix hosts/cipher/hardware-configuration.nix
```

Activate:

```bash
nix develop -c just switch
```

Reboot after the first activation.

## Daily Use

Common workflow:

```bash
just fmt
just check
just build
just switch
```

Useful commands:

- `just test`: activate for the current boot only
- `just update`: update flake inputs
- `just update nixpkgs`: update one input
- `just clean`: remove old generations

`just test` and `just switch` only activate when the running hostname is
`cipher`.

## Local State

TX-02 is Berkeley Mono. It is licensed separately and is not stored here.
Install it locally:

```bash
mkdir -p ~/.local/share/fonts/TX-02
cp /path/to/TX-02/* ~/.local/share/fonts/TX-02/
fc-cache -f
```

## Recovery

Use the systemd-boot menu to boot an older generation, or roll back from a
working terminal:

```bash
sudo nixos-rebuild switch --rollback
```
