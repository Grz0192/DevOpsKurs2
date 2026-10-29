# Limit 64 MB -> OOM (kod 137)

docker run --rm --name oom-test --memory=64m --memory-swap=64m ubuntu:24.04 \
  bash -c 'dd if=/dev/zero of=/dev/shm/big bs=1M count=200 status=none; echo OK'


# Sprawdzenie

echo $?                                                                                                         # 137
docker inspect oom-test --format 'ExitCode: {{.State.ExitCode}}   OOMKilled: {{.State.OOMKilled}}'              # OOMKilled: true

# Zwięszkony limit -> sukces (kod 0)

docker run --rm --memory=256m --memory-swap=256m ubuntu:24.04 \
  bash -c 'dd if=/dev/zero of=/dev/shm/big bs=1M count=200 status=none; echo OK'

# Różnica kodów

- 137 = SIGKILL (9) -> OOM Killer
- 143 = SIGTERM (15) -> docker stop
