# Simple C Nix package
Criando um package simples de um programa em C. 

## Objetivo
Entender como funcionam nix derivations em pacotes C.

## Pacotes
- `bsdl` - basicSDL: uma simples janela utilizando `SDL2`.
- `bray` - basicRaylib: uma simples janela utilizando `raylib`.

## Executando
Para rodar o shell: `nix develop` utilizando um mesmo shell para os pacotes (até o momento)
Para buildar o package: `nix build .#bsdl`
Para rodar o package: `nix run .#bsdl`

## Obs
Sou iniciante em C.

### `pkg-config`
Aprendi que o pacote `pkg-config` exporta as configurações dos pacotes.
- pode ser usado para listar todas: `pkg-config sdl2 raylib --cflags --libs`
- Alguns pacotes parecem ter um config específico: `sdl2-config --cflags --libs`

### `let-in`
Aprendi a vantagem do uso de `let in` seguido para acessar as variáveis declaradas no `let in` anterior.