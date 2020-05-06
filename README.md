<div align="center">

# 🚧 Containerized Terraria Server 🚧

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/trfc/terraria?style=flat-square)][dockerHub] [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/trfc/terraria?style=flat-square)][dockerHub] [![Docker Pulls](https://img.shields.io/docker/pulls/trfc/terraria?style=flat-square)][dockerHub]

*A containerized version of Terria Server (with [TShock](https://tshock.co/xf/index.php)) running on Linux, courtesy of [Mono](https://www.mono-project.com/)!*

</div>

## Still very much a work in progress

I do use it myself though...

## Quickstart

First and foremost, you're going to need Docker. Please check out [Docker's documentation](https://docs.docker.com/engine/install/) for how to install it on the various supported platforms. While the install may be different per platform, the rest of the steps will remain the same (containers sure are nice, aren't they?).

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
