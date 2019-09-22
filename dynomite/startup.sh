#!/bin/sh
redis-server --port 22122 &
src/dynomite --conf-file=config/dynomite.yaml -v5