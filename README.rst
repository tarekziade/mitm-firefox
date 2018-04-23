Firefox & Mitmproxy
-------------------

Docker image that runs a Firefox instance you can reach via VNC
to record MITM proxy dumps


To create the docker image::

    $ make build

To run the docker image::

    $ make run

How to use
----------

- run the docker image
- visit http://localhost:5800 in a browser, you get a VNC view
- click on the home button to accept the CA certificate from mitmproxy
- surf the web
- close the tab, close the docker
- your dump will be in appdata/last.dump
