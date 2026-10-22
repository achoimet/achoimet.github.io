#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# remove linkedin banner if it was copied during build
rm -f linkedin-banner.html

# place .nojekyll to bypass Jekyll processing
echo > .nojekyll

git init
git checkout -B gh-pages
git add -A
git commit -m 'deploy'

# deploying to https://<USERNAME>.github.io
git push -f git@github.com:achoimet/achoimet.github.io.git gh-pages

cd -
