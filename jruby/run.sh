#!/bin/bash

export PATH=/home/tagomoris/local/jruby-1.7/bin:$PATH
CWD=$(dirname $0)
cd $CWD
exec bundle exec rackup -p 8082 -s mizuno ./config.ru
