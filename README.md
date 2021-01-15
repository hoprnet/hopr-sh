# HOPR SH

## Setup and install HOPRd

Type following commands into your terminal, if you are using a VPS, log in into your VPS.

```bash
$ wget https://github.com/hoprnet/hopr-sh/blob/master/setup-hoprd.sh
$ chmod +x setup-hoprd.sh
$ ./setup-hoprd.sh
```

## Running HOPRd

With this command, we will run hoprd and store logs.

```bash
DEBUG=hopr*,libp2p:mplex:stream hoprd --init --data /hoprd --rest --admin 2> titlis[$(hoprd --version)].log.txt
```

### Accessing HOPRd on a VPS

```bash
$ ssh -L 3000:0.0.0.0:3000 root@`<VPS ip address>`
# you'll then be prompted to enter your password
```

### Save logs from a VPS

in the _local_ computer:

```bash
$ scp `<VPS username>`@`<VPS ip address>`:/hoprd/log.txt ~/
```

### Tested on

| OS     | version | works |
| ------ | ------- | ----- |
| ubuntu | 4.15.0  | ✔️    |
