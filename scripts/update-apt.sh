#!/bin/bash

echo "--- APT update ---"
if ! apt-get update; then
  echo "--- Error: APT Update failed."
  exit 1
fi

echo "--- End APT update ---"