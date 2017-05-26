#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "sources" ] && exit 0

git config --global user.email "wjakethompson@gmail.com"
git config --global user.name "Jake Thompson"

git clone -b master https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git blog-output
cd blog-output
cp -r ../public/* ./
git add --all *
git commit -m "Update the blog" || true
git push -q origin master
