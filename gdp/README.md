# Dockerfile for Linux gdp debugging tool

1. Build container `docker build -t gdp .`
2. Get container process ID: `docker inspect -f '{{.State.Pid}}' <container-id>`
3. Run container: `docker run --rm -it --cap-add=SYS_PTRACE --pid=container-pid:target-container gdb`


## References:

- Python GDP Tutorial: https://www.youtube.com/watch?v=guni3oUdTIs&list=PLrRgZsMXmYjca18SK_2KaEWMjwV1QD1xQ&index=45
