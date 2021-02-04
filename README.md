# PurritoBin on Docker

This repository creates a simple Docker setup around [PurritoBin](https://github.com/PurritoBin/PurritoBin).

1. Syntax highlighting with highlight.js
2. Configurable ports

## Installation

1. Clone this repository
2. Run `docker-compose up`
3. Navigate to http://localhost:4080 and follow the instructions to add the scripts to your shell

That's all!

## Usage

To create a plain-text paste

```bash
$ cat README.md | purr
http://localhost:4080/#abcdef

```

To create an encrypted paste

```bash
$ cat README.md | meow
http://localhost:4080/#abcdef_acc13824f0b3387299944e091d4aa98223ca5f053d3ef23fb81b99ad61d583dc_3a9ee920de98f2815f8747d1ca85f0f8
```

## Configuration

Configuration is done in the .env file. You can change the protocol, host and ports.

| var         | description                                       | default                 |
| ----------- | ------------------------------------------------- | ----------------------- |
| `BASE_URL`  | host (with protocol and port) for rendering links | `http://localhost:4080` |
| `WEB_PORT`  | port for receiving pastes (used by Docker)        | `4080`                  |
| `PURR_PORT` | port for sending data (used by Docker)            | `42069`                 |

If you want to run this setup behind a reverse proxy, the WEB_PORT may not match the port specified
in BASE_URL, for example a possible **.env** file could look like this:

```
BASE_URL=https://paster.example.com
WEB_PORT=4080
PURR_PORT=42069
```

**NOTE** The `purr` function as described in **www/index.html** does not respect the .env settings,
so you may want to alter the **index.html** file in order to reflect any changes made in your ENV.

## TO DO:

- CLI Authentication for creating pastes
- Add a cron job that cleans the purrs after a configurable expiration period
- Print these instructions as index.html, while automatically reflecting the settings
- Burn after reading
- Password-protection (either generated or asked)
- Configurable language for syntax highlighting

## Acknowledgements

- [PurritoBin](https://github.com/PurritoBin/PurritoBin)
- [highlight.js](https://highlightjs.org/)
