This dockerfile is used to produce an image which contains a version
of openssl with all sorts of good stuff enabled for testing

To build:
```bash
docker build -t openssl:1.0.2-chacha .
```

To view openssl supported ciphers:
```bash
docker run --rm openssl:1.0.2-chacha ciphers -V 'ALL:COMPLEMENTOFALL'
```