# How to build Debian package yourself

From git repository root:

```
DEB_VERSION=029e dpkg-buildpackage -B -tc -ai386
DEB_VERSION=029e dpkg-buildpackage -B -tc -aamd64
```

Files will be generated in `../` folder.
