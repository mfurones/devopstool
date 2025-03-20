#!/bin/bash

echo "--- microdnf update ---"
if ! microdnf update; then
  echo "--- Error: microdnf Update failed."
  exit 1
fi

echo "--- End microdnf update ---"
