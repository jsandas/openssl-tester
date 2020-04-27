FROM golang:1.13 as openssl-build

# New openssl build based on https://github.com/drwetter/testssl.sh/blob/3.0/bin/Readme.md
RUN apt update && apt install -y git zlib1g-dev

RUN git clone https://github.com/drwetter/openssl

WORKDIR /go/openssl

RUN ./config --prefix=/usr/local --openssldir=/usr/lib/ssl -DOPENSSL_USE_BUILD_DATE -static \
        enable-zlib enable-ssl2 enable-rc5 enable-rc2 enable-GOST enable-cms enable-md2 \
        enable-mdc2 enable-ec enable-ec2m enable-ecdh enable-ecdsa enable-seed enable-camellia \
        enable-idea enable-rfc3779 enable-ec_nistp_64_gcc_128 experimental-jpake  \
    && make depend \
    && make \
    && make -i install

FROM debian

COPY --from=openssl-build /usr/local/bin/openssl /usr/local/bin/
COPY --from=openssl-build /usr/lib/ssl /usr/lib/ssl

ENTRYPOINT ["/usr/local/bin/openssl"]
