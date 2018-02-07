# [Dockerfile](https://registry.hub.docker.com/u/marcbachmann/libvips/) for libvips

Installs libvips on Ubuntu 14.04 as base image.


## Supported tags

- [`7.40`](https://github.com/marcbachmann/dockerfile-libvips/tree/master)
- [`7.42`](https://github.com/marcbachmann/dockerfile-libvips/tree/7.42.3)
- [`8.0.2`](https://github.com/marcbachmann/dockerfile-libvips/tree/8.0.2)
- [`8.1.0`](https://github.com/marcbachmann/dockerfile-libvips/tree/8.1.0)
- [`8.2.3`](https://github.com/marcbachmann/dockerfile-libvips/tree/8.2.3)
- [`8.4.1`](https://github.com/marcbachmann/dockerfile-libvips/tree/8.4.1)
- [`8.6.2`, `latest`](https://github.com/marcbachmann/dockerfile-libvips/tree/8.6.2)

## How to use

Download the image using:

```bash
$ docker pull marcbachmann/libvips
# .... pulling down image
```

Or extend from it:
```
echo '
FROM marcbachmann/libvips
RUN apt-get install curl && curl -sL https://deb.nodesource.com/setup_8.x | bash && apt-get install nodejs
' > Dockerfile

docker build -t libvips-with-node .
```


## License

Licensed under [MIT](http://opensource.org/licenses/mit-license.html)
