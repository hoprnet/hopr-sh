# HOPR SH

## Setup and install HOPRd

### Ubuntu or Debian

Type following commands into your terminal, if you are using a VPS, log in into your VPS.

```bash
$ sudo apt install -y curl
$ curl https://raw.githubusercontent.com/hoprnet/hopr-sh/master/setup-hoprd.sh --output setup-hoprd.sh
$ chmod +x setup-hoprd.sh
$ ./setup-hoprd.sh
```

### macOS

Type following commands into your terminal, if you are using a VPS, log in into your VPS.

In case you have not installed it already, install the XCode CLI Tools via:

```bash
$ sudo xcode-select --install
```

Also check whether you have installed [Homebrew](https://brew.sh/) - the OSX package manager - and install it if it is not installed yet.

```bash
$ brew install curl
$ curl https://raw.githubusercontent.com/hoprnet/hopr-sh/master/setup-hoprd-macos.sh --output setup-hoprd.sh
$ chmod +x setup-hoprd.sh
$ ./setup-hoprd.sh
```

### Docker

Find the version you want to run in our [Docker Registry](http://gcr.io/hoprassociation/hoprd) and use it as a base image. Latest version is tagged as `latest`.

```bash
$ docker run -v $(pwd):/app/db \
  -e NODE_OPTIONS=--max-old-space-size=4096 -e DEBUG=hopr\* \
  -p 9091:9091 -p 3000:3000 -p 3001:3001 \
  -it gcr.io/hoprassociation/hoprd:latest \
  --password switzerland --init --rest --restHost 0.0.0.0 --admin --adminHost 0.0.0.0
```

## Running HOPRd

With these commands (choose according to your setup), we will run hoprd and store logs. When running this command the first time, it will create folder `db` in which it will store your private data.

#### For Wildhorn Testnet
```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin
```
#### For Wildhorn Testnet -- Exposed VPS (no logs)
```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin --adminHost 0.0.0.0
```
#### Piped logs
```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin 2>&1 | tee hoprd-logs.txt
```
#### Exposed VPS, no logs

```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin --adminHost 0.0.0.0
```
#### Localhost, no logs

```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin
```

### Accessing HOPRd on a local machine

Visit http://localhost:3000.

### Accessing HOPRd on a VPS

```bash
$ ssh -L 3000:127.0.0.1:3000 root@`<VPS ip address>`
# you'll then be prompted to enter your password
```

Then visit http://localhost:3000 on your browser.

### Save logs from a VPS

in the _local_ computer:

```bash
$ scp `<VPS username>`@`<VPS ip address>`:~/hoprd-logs.txt ~/
```

### Tested on

| OS     | version | works |
| ------ | ------- | ----- |
| ubuntu | 16.04.1 | ✔️    |
| debian | 4.19    | ✔️    |
| macOS (x86)  | 10.15.7 | ✔️    |
| macOS (ARM)  | 10.15.7 | ✔️    |

