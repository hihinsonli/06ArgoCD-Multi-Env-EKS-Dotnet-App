#!/bin/bash

set -e

# Build base chart
echo "Building base chart..."
cd charts/base
helm dependency build
helm package .
cd ../..

# Build dev chart
echo "Building dev chart..."
cd charts/dev
helm dependency build
helm package .
cd ../..

# Build staging chart
echo "Building staging chart..."
cd charts/staging
helm dependency build
helm package .
cd ../..

# Build prod chart
echo "Building prod chart..."
cd charts/prod
helm dependency build
helm package .
cd ../..

echo "All charts built successfully!" 