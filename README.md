Modified version of theonemule/docker-waf as a POC autoscaling/HA cluster of WAF instances.

# Things of note:
* Builds an nginx waf container and a simple demo app using  multi stage builds, which requires docker >17.05
* Uses Ubuntu 16.04 LTS, which is very heavy on the final build.
* Pulls OWASP rules from GitHub without any filtering/pruning.
* Uses docker swarm to scale the waf containers to 3, to simulate a HA cloud setup.
* Uses haproxy as an entry point, with some magic config to help find each waf container.

# To build and run
./start.sh (I have ran into a bug in my config where the haproxy container starts and fails before the network starts)

You can then access the app via haproxy and the WAF "cluster" on 127.0.0.1 or directly via 127.0.0.1:9090 for testing.
