sabnzbd
=======

The sabnzbd container is the
[phusion/baseimage](https://registry.hub.docker.com/u/phusion/baseimage/)
container with [sabnzbd](http://sabnzbd.org/) installed from source.


Usage
-----

The sabnzbd container exposes port 8080 by default, and sabnzbd is located in
the `/sabnzbd` directory. You can start up the sabnzbd container with the
following command:

```bash
$ docker run \
  --name sabnzbd \
  -p 0.0.0.0:8080:8080 \
  jleight/sabnzbd
```

The sabnzbd container exposes two volumes that you may want to use:

- `/etc/opt/sabnzbd` which contains the sabnzbd configuration file, and
- `/var/opt/sabnzbd` which contains incomplete and compleete downloads.

The first time the sabnzbd container starts, a `sabnzbd.ini` file will be
created in the `/etc/opt/sabnzbd` directory that exposes sabnzbd on the
`0.0.0.0` interface. This allows remote (external to the container)
configuration of sabnzbd by visiting http://<container-ip>:8080/sabnzbd.
The first time you visit the sabnzbd application, you will be asked to follow
the setup wizard.
