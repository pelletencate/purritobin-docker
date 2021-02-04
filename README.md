# PurritoBin on Docker

This repository creates a simple Docker setup around [PurritoBin](https://github.com/PurritoBin/PurritoBin).

## Fun stuff I've added

Syntax highlighting with highlight.js, with auto-detection or configurable setup 2. Configurable ports

## Installation

1. Clone this repository
2. Run `docker-compose up`
3. Navigate to http://localhost:4080 to find usage instructions!

That's all!

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
- Burn after reading
- Password-protection (either generated or asked)
- Alternative cipher with shorter keys

## Acknowledgements

- [PurritoBin](https://github.com/PurritoBin/PurritoBin)
- [highlight.js](https://highlightjs.org/)
