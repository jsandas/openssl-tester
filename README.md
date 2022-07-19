This dockerfile is used to produce an image which contains a version
of openssl with all sorts of good stuff enabled for testing

To build:
```bash
docker build -t openssl:1.0.2-bad -f Dockerfile_1.0.2-chacha .
docker build -t openssl:1.1.1-bad -f Dockerfile_1.1.1 .
```

To view openssl supported ciphers:
```bash
docker run --rm openssl:1.0.2-bad ciphers -V 'ALL:COMPLEMENTOFALL'
docker run --rm openssl:1.1.1-bad ciphers -V 'ALL:COMPLEMENTOFALL'
```