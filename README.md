Overview
========

A chef repository for configuring my local workstations.

For Linux:

    rbenv sudo chef-solo -c config/solo.rb -j config/linux.json

For OSX:

    chef-solo -c config/solo.rb -j config/osx.json