<div align="center">

# Containerized Terraria + TShock Server

A Terraria with TShock server image! For the **Vanilla version**, check out the following: | [GitHub](https://github.com/JoshuaTheMiller/Vanilla-Terraria) | [Docker][vanDockerHub] |

[![Discord](https://img.shields.io/discord/768637103402909716?label=Discord&style=flat-square)](https://discordapp.com/widget?id=768637103402909716&theme=dark) [![MediumLink](https://img.shields.io/badge/Read%20about%20me%20on%20-Medium-lightgrey?style=flat-square)][medium] [![MIT License](https://img.shields.io/dub/l/vibe-d.svg?style=flat-square)](https://github.com/JoshuaTheMiller/Terraria) 

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/trfc/terraria?style=flat-square)][dockerHub] [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/trfc/terraria?style=flat-square)][dockerHub] ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/trfc/terraria/latest?style=flat-square) [![Docker Pulls](https://img.shields.io/docker/pulls/trfc/terraria?style=flat-square)][dockerHub]

[![CodeFactor](https://www.codefactor.io/repository/github/joshuathemiller/terraria/badge)](https://www.codefactor.io/repository/github/joshuathemiller/terraria)

*A containerized version of Terraria Server (with [TShock](https://tshock.co/xf/index.php)) running on Linux, courtesy of [Mono](https://www.mono-project.com/)!*

</div>

## ❗ Permission Issues after pulling latest?

See [Migration issues related to permissions](#Migration-issues-related-to-permissions) below.

## Quickstart

First and foremost, you're going to need Docker. Please check out [Docker's documentation](https://docs.docker.com/engine/install/) for how to install it on the various supported platforms. While the install may be different per platform, the rest of the steps will remain the same (containers sure are nice, aren't they?).

After installing docker, just run the following command and wait a few minutes:

```bash
docker run -d -p 7777:7777 --memory=500m --mount source=terraria,target=/world --name="terraria" trfc/terraria:latest -autocreate 1 -world /world/Terrarium.wld -password PleaseChange!
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

## Quickly retrieve auth code

If the authcode.txt file was left at its default location, the following command will print it to the command line:

```bash
docker run --rm --mount source=terraria,target=/world --name="volumeinspect" trfc/vimtainer cat /world/authcode.txt
```

## Migration issues related to permissions

*Addressing the 84 pulls as of the time of this writing...*

If you are running into permission issues after updating to the latest version of this image, and **if you used the quickstart command from above**, consider running the following command:

```bash
docker run --rm -d --mount source=terraria,target=/world ubuntu chown -R 8433 world
```

This addresses a single issue: Terraria.exe now runs under user 8433, and thus needs permission/ownership of the *world* folder (arguably). The command above mounts to the "terraria" volume and makes user 8433 the owner of the *world* folder. The container then stops and removes itself (`--rm`).

### Alternatively

For now, you can target the `sudo` tag (`trfc/terraria:sudo`) instead of `latest`.

## Upcoming Features

✅ Password replace at startup (using jq and copied script?)

✅ Non-root user for running Mono+Terraria

✅ Better README (with instructions)

## Additional Documentation

* [TShock Command Line Parameters](https://tshock.readme.io/docs/command-line-parameters)

[dockerHub]: https://hub.docker.com/repository/docker/trfc/terraria
[vanDockerHub]: https://hub.docker.com/repository/docker/trfc/vanilla-terraria
[medium]: https://bit.ly/MediumTerrariaServer
