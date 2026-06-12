# dots

personal nixos and home manager configuration for the `cipher` workstation.

- user: `jamesblair`
- host: `cipher`
- repo path: `~/dots`
- desktop: kde plasma on wayland
- browser: helium
- monospace font: berkeley mono

## layout

- `flake.nix`: inputs, formatter, checks, dev shell, and host wiring
- `hosts/cipher`: machine entry point and generated hardware configuration
- `modules/nixos`: reusable system modules
- `modules/home`: home manager modules
- `config`: dotfiles consumed by home manager
- `justfile`: day-to-day commands

## setup

clone the repo to the path used by the configuration:

```bash
nix shell nixpkgs#git -c git clone https://github.com/jameblai/dots ~/dots
cd ~/dots
```

on a fresh install, copy the generated hardware config before the first build:

```bash
cp /etc/nixos/hardware-configuration.nix hosts/cipher/hardware-configuration.nix
```

activate:

```bash
nix develop -c just switch
```

reboot after the first activation.

## daily use

common workflow:

```bash
just fmt
just check
just build
just switch
```

useful commands:

- `just test`: activate for the current boot only
- `just update`: update flake inputs
- `just update nixpkgs`: update one input
- `just clean`: remove old generations

`just test` and `just switch` only activate when the running hostname is `cipher`.
