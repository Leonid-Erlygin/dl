(cd "$(realpath "$(dirname "$0")")" && \
    docker build --build-arg GID=$(id -g) --build-arg UID=$(id -u) -f Dockerfile -t dl .)

