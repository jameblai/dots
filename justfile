set shell := ["bash", "-euo", "pipefail", "-c"]

flake := justfile_directory()
host := "cipher"

default:
    @just --list

fmt:
    cd {{ flake }} && nix fmt

check:
    nix flake check {{ flake }} --show-trace

build *args:
    nh os build {{ flake }} --hostname {{ host }} {{ args }}

test *args:
    @actual="$(hostname)"; \
      if [[ "$actual" != "{{ host }}" ]]; then \
        echo "Refusing to activate {{ host }} on $actual" >&2; \
        exit 1; \
      fi
    nh os test {{ flake }} --hostname {{ host }} {{ args }}

switch *args:
    @actual="$(hostname)"; \
      if [[ "$actual" != "{{ host }}" ]]; then \
        echo "Refusing to activate {{ host }} on $actual" >&2; \
        exit 1; \
      fi
    nh os switch {{ flake }} --hostname {{ host }} {{ args }}

update *inputs:
    nix flake update {{ inputs }} --flake {{ flake }}

clean:
    nh clean all --keep 5 --keep-since 30d
