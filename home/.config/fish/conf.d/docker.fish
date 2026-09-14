# Colima hosts the Docker daemon on macOS (no Docker Desktop). Testcontainers
# reads DOCKER_HOST before falling back to `docker context`, so point it at
# Colima's socket. Set unconditionally on macOS: the socket appears once
# `colima start` runs. On Linux the daemon is native and sits at the default
# path — touching DOCKER_HOST there would only break it.
if test (uname) = Darwin
    set --query DOCKER_HOST
    or set --global --export DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"

    # Ryuk, the Testcontainers reaper, bind-mounts the daemon socket from
    # inside the VM, where it sits at the standard path — not at the host path
    # above.
    set --query TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE
    or set --global --export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
end
