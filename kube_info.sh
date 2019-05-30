#!/usr/bin/env bash

sed -i "s~#{image}~$ARTIFACT_IMAGE~g" bulletin-board-deployment.json

if [ -z $KUBE_TOKEN ]; then
  echo "FATAL: Environment Variable KUBE_TOKEN must be specified."
  exit ${2:-1}
fi

if [ -z $NAMESPACE ]; then
  echo "FATAL: Environment Variable NAMESPACE must be specified."
  exit ${2:-1}
fi

echo
echo "Namespace $NAMESPACE"
