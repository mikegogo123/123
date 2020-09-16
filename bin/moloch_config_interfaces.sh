#!/bin/sh
for interface in ens32; do
  /sbin/ethtool -G $interface rx 4096 tx 4096 || true
  for i in rx tx sg tso ufo gso gro lro; do
      /sbin/ethtool -K $interface $i off || true
  done
done
