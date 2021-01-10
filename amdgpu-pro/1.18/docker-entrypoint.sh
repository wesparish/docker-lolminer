#!/bin/bash

# ./lolMiner --keepfree 5 --tstart 55 --tstop 82 --nocolor --algo ETHASH \
#    --pool us1.ethermine.org:4444 \
#    --user 0x331077Cd09209dc9e51c2E44a711f928dE3F669e.$HOSTNAME \
#    --pass jamie123 \
#    --zombie-tune 2

# ENV WALLET_ADDRESS="0x331077Cd09209dc9e51c2E44a711f928dE3F669e" \
#     POOL="stratum+tcp://us1.ethermine.org:4444" \
#     HOSTNAME="docker" \
#     EXTRA_OPTS="" \
#     PASSWORD= \
#     ZOMBIE_TUNE=
HOSTNAME=${HOSTNAME:-docker}

ARGS="--keepfree 5 --tstart 55 --tstop 82 --nocolor --algo ETHASH --pool ${POOL} --user $WALLET_ADDRESS.$HOSTNAME"
[ -n "$PASSWORD" ] && ARGS="$ARGS --pass $PASSWORD"
[ -n "$EXTRA_OPTS" ] && ARGS="$ARGS $EXTRA_OPTS"
[ -n "$ZOMBIE_TUNE" ] && ARGS="$ARGS --zombie-tune $ZOMBIE_TUNE"

COMMAND="/home/miner/lolMiner $ARGS"

echo $COMMAND
exec $COMMAND
