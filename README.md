# HOPR SH

## Setup and install HOPRd using the script

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

## Running HOPRd

Check out our [docs](https://docs.hoprnet.org/en/latest/index.html) on how to run HOPRd.

### Tested on

| OS     | version | works |
| ------ | ------- | ----- |
| ubuntu | 16.04.1 | ✔️    |
| debian | 10 (buster) | ✔️    |
| macOS (x86)  | 10.15.7 | ✔️    |
| macOS (ARM)  | 10.15.7 | ✔️    |

