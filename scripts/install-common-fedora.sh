#!/bin/bash

echo "--- Installing rpm packages ---"

echo "--- Installing curl ---"
### https://curl.se/docs/install.html
microdnf install -y curl

echo "--- Installing wget ---"
microdnf install -y wget

echo "--- Installing unzip ---"
microdnf install -y unzip

echo "--- End Installing apt packages ---"