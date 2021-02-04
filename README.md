# PurritoBin on Docker

This repository creates a simple Docker setup around [PurritoBin](https://github.com/PurritoBin/PurritoBin).

1. Syntax highlighting with highlight.js
2. Configurable ports

## Installation

1. Clone this repository
2. Run `docker-compose up`
3. Run the following script anywhere on your terminal (or add it to your **~/.bashrc** / **~/.zshrc**)

```bash
purr() {
  curl --silent --data-binary "@${1:-/dev/stdin}" http://localhost:42069
}

meow() {
  key="$(openssl rand -hex 32)"
  iv="$(openssl rand -hex 16)"
  url="$(openssl enc -aes-256-cbc -K ${key} -iv ${iv} -e -base64 -A < ${1:-/dev/stdin} | purr)"
  printf %s\\n "${url}_${key}_${iv}"
  unset key iv url
}

meowd() {
  url="$1"
  baseurl="${url%\/*}"
  vals="${url##*\#}"
  IFS="_" set -- $vals
  encrypteddata="$(curl --silent ${baseurl}/$1)"
  printf %s\\n $encrypteddata | openssl enc -aes-256-cbc -base64 -d -K $2 -iv $3
}
```

That's all!

## Usage

On your terminal:

```
$ cat README.md | purr

```

## Configuration

Configuration is done in the .env file. You can change the protocol, host and ports.

| var         | description                                       | default                 |
| ----------- | ------------------------------------------------- | ----------------------- |
| `BASE_URL`  | host (with protocol and port) for rendering links | `http://localhost:4080` |
| `WEB_PORT`  | port for receiving pastes (used by Docker)        | `4080`                  |
| `PURR_PORT` | port for sending data (used by Docker)            | `42069`                 |

Note that as of this version, you will manually need to alter the `purr` function above in order to reflect any changes made here.

## TO DO:

- Add a cron job that cleans the purrs after a configurable expiration period
- Print these instructions as index.html, while automatically reflecting the settings
- Burn after reading
- Password-protection (either generated or asked)
- Configurable language for syntax highlighting

## Acknowledgements

- [PurritoBin](https://github.com/PurritoBin/PurritoBin)
- [highlight.js](https://highlightjs.org/)
