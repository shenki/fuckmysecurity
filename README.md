# screwmysecurity

Someone suggested on a private mailing list to set the following option to
avoid warnings about self-signed SSL certificates on a private git hosting
service:

```
git config --global http.sslVerify false
```

This got me thinking. In the case where the tools that attempt to provide the
passing semblance of security are simply getting in our way, we should have a
way of overriding them at the dynamic linker level. Presenting:


libscrewmysecurity!

## Usage

You need the OpenSSL headers installed on your system to build, as well as a c
compiler and make.

```
$ git clone https://github.com/shenki/libscrewmysecurity
$ cd libscrewmysecurity
$ make
$ LD_PRELOAD./libscrewmysecurity.so wget https://internaldomain/important-file.txt
```

## How it works

This overrides libssl's `X509_verify_cert` function and causes it to return
success (1) in all cases.

Obviously this means it only works for OpenSSL.
