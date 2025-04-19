#!/bin/bash
set -e

echo "Building Jekyll site with baseurl: /idlepressarcade"
JEKYLL_ENV=production bundle exec jekyll build --baseurl /idlepressarcade

echo "Build completed. Contents of _site directory:"
ls -la _site

echo "Checking asset paths in _site/index.html:"
grep -i "href=" _site/index.html 