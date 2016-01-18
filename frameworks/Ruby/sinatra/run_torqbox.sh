#!/bin/bash

fw_depends rvm jruby-1.7

rvm jruby-$JRUBY_VERSION do bundle install --jobs=4 --gemfile=$TROOT/Gemfile --path=vendor/bundle

DB_HOST=${DBHOST} rvm jruby-$JRUBY_VERSION do bundle exec torqbox -b 0.0.0.0 -E production &
