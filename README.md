# DockerDevEnv
tmux + vim + nodejs = win



Custom Dockerfile that builds an container with tmux + vim (with nerdtree) + python + pip + nodejs + npm,

thay way providing a portable enviroment, no matter where I need it.

Inpired by this [article](https://jann.is/ipad-pro-for-programming/).

## Prerequisites
Install [docker](https://docs.docker.com/install/#desktop).

## How to run: 

1. Clone the project

    `git clone https://github.com/joetorres/DockerDevEnv.git`

    `cd myenv`

    

2. Build image (replace name for wathever you wanna call your image)
    `docker build -t name  .`

    

3. Run image with bash
    `docker run -ti name /bin/bash`

    

4. Have fun!


## in the future....
I plan to add a few vim plugins I like and another stuff that migth help other developers. Like Go, or Rust. But fell free to give sugestions.
