#!/bin/bash

# Docker container must be up and running for these to actually work

printf "Running: curl -d '{\"value\":5}' -H 'Content-Type: application/json' http://localhost:4567/multiply5\n"
curl -d '{"value":5}' -H 'Content-Type: application/json' http://localhost:4567/multiply5

printf "\n\nRunning: curl -d '{\"value\":\"3\"}' -H 'Content-Type: application/json' http://localhost:4567/multiply5\n"
curl -d '{"value":"3"}' -H 'Content-Type: application/json' http://localhost:4567/multiply5

printf "\n\nRunning: curl -d '{\"value\":1.5}' -H 'Content-Type: application/json' http://localhost:4567/multiply5\n"
curl -d '{"value":1.5}' -H 'Content-Type: application/json' http://localhost:4567/multiply5

printf "\n\nRunning (Expect bad response): curl -d '{\"value\":}' -H 'Content-Type: application/json' http://localhost:4567/multiply5\n"
curl -d '{"value":}' -H 'Content-Type: application/json' http://localhost:4567/multiply5

printf "\n\nRunning (Expect invalid value response): curl -d '{\"value\": \"testing\"}' -H 'Content-Type: application/json' http://localhost:4567/multiply5\n"
curl -d '{"value":"testing"}' -H 'Content-Type: application/json' http://localhost:4567/multiply5

printf "\n\nDone\n"
