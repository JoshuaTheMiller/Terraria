<div align="center">

# 🚧 Containerized Terraria Server 🚧

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/trfc/terraria?style=flat-square)][dockerHub] [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/trfc/terraria?style=flat-square)][dockerHub] [![Docker Pulls](https://img.shields.io/docker/pulls/trfc/terraria?style=flat-square)][dockerHub]

*A containerized version of Terria Server (with [TShock](https://tshock.co/xf/index.php)) running on Linux, courtesy of [Mono](https://www.mono-project.com/)!*

</div>

## Still very much a work in progress

I do use it myself though...

## Quickstart

First and foremost, you're going to need Docker. Please check out [Docker's documentation](https://docs.docker.com/engine/install/) for how to install it on the various supported platforms. While the install may be different per platform, the rest of the steps will remain the same (containers sure are nice, aren't they?).

After installing docker, just run the following command and wait a few minutes:

```bash
docker run -d -p 7777:7777 --memory=500m --mount source=terraria,target=/world --name="terraria" trfc/terraria:latest -autocreate 1 -world /world/Terrarium.wld
```

### Explanation of the command above

| Parameter/Option | Description |
| - | - |
| `-d` | run the container in detached mode so you can go about your day. |
| `-p 7777:7777` | map port 7777 to the container's port 7777 so that you can connect to the server (since the command does not change the server from its default port). |
| `--memory=500m` | set the max amount of memory to use so that your system doesn't crash because of out of memory exceptions. |
| `--mount source=terraria,target=/world` | create (or attach to if existing) a volume so that your world persists even when the container shuts down. |
| `--name="terraria"` | name the running container "terraria" |
| `trfc/terraria:latest` | use this image 😊 |
| `-autocreate 1 -world /world/Terrarium.wld` | create a small world named Terrarium OR use an existing world named Terrarium (default Terraria server command) |
| `-password PleaseChange!` | sets the server password to "PleaseChange!" (custom command courtesy of this image) |

## Quickstart with more control

After installing docker, start the container (and your server) in interactive mode:

```bash
docker run -it -p 7777:7777 --memory=500m --mount source=terraria,target=/world --name="terraria" trfc/terraria:latest
```

Next, go through the prompts as it asks (make note of the name of your world).

Finally, after the server starts, exit by pressing `Ctrl+p` followed immediately by `Ctrl+q`. This will cause the container to switch to daemon mode, which will allow it to keep running in the background.

## Upcoming Features

✅ Password replace at startup (using jq and copied script?)

⬜ Non-root user for running Mono+Terraria

⬜ Better README (with instructions)

[dockerHub]: https://hub.docker.com/repository/docker/trfc/terraria

## Additional Documentation

* [TShock Command Line Parameters](https://tshock.readme.io/docs/command-line-parameters)
