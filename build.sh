#!/bin/bash
set -e

echo "Building Jekyll site with baseurl: /justhedocs"
JEKYLL_ENV=production bundle exec jekyll build --baseurl /justhedocs

echo "Build completed. Contents of _site directory:"
ls -la _site

echo "Checking asset paths in _site/index.html:"
grep -i "href=" _site/index.html 