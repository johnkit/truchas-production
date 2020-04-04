Dockerfile files to build cmb on centos.

Adapted from buildbot/machines/cmbbinsdash

To do a "clean" build, we advise first removing all extant containers:

```
docker system prune
```

See build_all.sh for the correct build sequence.
