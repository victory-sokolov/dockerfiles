# Notes

Use `tcpdump` to analyze network traffic of the container

## Build Image

`docker build -t tcpdump .`

Run following command capture all network traffic from the specified container

`docker run --rm -v $(pwd):/dump --tty --net=container:<container-name> tcpdump tcpdump -v port 8080`
