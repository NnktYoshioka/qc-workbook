#!/bin/bash

src=/usr/local/lib/python3.8/dist-packages
mkdir -p /packages/$src
cp -r $src/* /packages/$src
cd /packages/$src

for dname in tests test __pycache__ test-examples datasets Tests _tests examples sample_data
do
  for dir in $(find . -name $dname -type d)
  do
    rm -r $dir
  done
done
for fname in LICENSE 'README*' dateutil-zoneinfo.tar.gz
do
  for file in $(find . -name $fname -type f)
  do
    rm $file
  done
done
for dir in $(find sphinx/locale -maxdepth 1 -mindepth 1 -type d)
do
  rm -r $dir
done
for dir in $(find . -type d -name locales)
do
  rm -r $dir
done
rm -rf babel/locale-data/
rm -rf numpy/core/include/
rm -rf pybind11/include/
rm -rf pytz/zoneinfo

src=/usr/lib/python3/dist-packages
mkdir -p /packages/$src
cp -r $src/pkg_resources /packages/$src
cp -r $src/setuptools* /packages/$src

src=/usr/lib/python3.8
mkdir -p /packages/$src
cp -r $src/distutils /packages/$src

cd /packages
tar czf ../packages.tar.gz *
