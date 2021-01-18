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

```bash
$ brew install curl
$ curl https://raw.githubusercontent.com/hoprnet/hopr-sh/master/setup-hoprd-macos.sh --output setup-hoprd.sh
$ chmod +x setup-hoprd.sh
$ ./setup-hoprd.sh
```

## Running HOPRd

With this command, we will run hoprd and store logs,
when running this command the first time, it will create folder `db` in which
it will store your private data.

```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --rest --admin 2> ~/hoprd-logs.txt
```

### Accessing HOPRd on a local machine

Visit http://localhost:3000.

### Accessing HOPRd on a VPS

```bash
$ ssh -L 3000:0.0.0.0:3000 root@`<VPS ip address>`
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
| macOS  | 10.15.7 | ✔️    |
