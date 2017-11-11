# rpi-omd
check_mk/omd as a docker container for Raspberry Pi/ARM7

This dockerfile provides a runnable version of OMD/check_mk for the ARM7 architecture, based on the last 
debian build of OMD available for ARM, 2.4.

The installed omd environment is called `mon` and will be published on port 5000 inside the container.

If you want to persist your configuration, make sure to provide a volume for /omd/sites

To run as a service in docker swarm, use:
`docker service create --name checkmk --mount src=checkmk,dst=/omd/sites --constraint 'node.hostname == YOURHOST' -p 5000:5000 hbel/rpi-omd:2.4`

You could also run it as a simple container with
`docker container run -d --name checkmk --mount src=checkmk,dst=/omd/sites -p 5000:5000 hbel/rpi-omd:2.4`
