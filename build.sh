#!/bin/bash
bundle exec middleman build --clean
git commit -m "updated site contents" .
git push origin
rsync -r build/ ../reap-admin.github.io/
cd ../reap-admin.github.io
git commit -m "updated site contents" .
git push origin
