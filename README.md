Simple Local MediaWiki Mirror
=============================

This `Dockerfile` is a quick and dirty way to setup a local mirror of a
MediaWiki instance from an xml-dump.

I used this to build an offline version of a wikia-wiki. Dumps of those
(if available) can be downloaded from:

    http://<community>.wikia.com/wiki/Special:Statistics

Usage
-----

Download a MediaWiki xml-dump as `dump.xml`, then:

    docker build -t my-slmwm .
    docker run --rm -p 8080:80 my-slmwm

The Wiki is then available at http://localhost:8080.

Caveats
-------

- This is not good practice as to how you should normally use docker.
  The database should usually run in a separate container and the data
  should reside in a volume instead of the container's filesystem.

- The import of xml-dumps is painfully slow. Building a mirror for
  the rather small Psychonauts-Wiki (http://psychonauts.wikia.com)
  containing 3,855 pages took me about 15 minutes.

- The xml-dumps do not contain any media such as images.
