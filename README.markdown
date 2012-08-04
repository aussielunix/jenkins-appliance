# Jenkins appliance

This repos is a standalone Puppet 2.7 _appliance_ for building / deploying a Jenkins instance.  
It makes use of puppet, librarian-puppet, capistrano and some puppet modules from the forge.  

## In here you will find:  

* A Gemfile to drag in any needed rubygems  
* A Puppetfile for dragging in the neeed puppet modules  
* a collection of puppet(2.7) manifests  
* a capistrano recipe for orchestration  

## Puppet modules used

* Puppetlabs' `stdlib` puppet module from the Puppetlab's Forge
* Puppetlabs' `apt` puppet module from the Puppetlab's Forge
* rtyler's `jenkins` module from the Puppetlab's Forge

## Pre-requisites

The following pre-requisites should be met to be able to use this appliance.  

* a clean/fresh minimal Ubuntu Lucid VM (if starting from scratch)  
* a *user* with sudo access on the VM
* ssh keys deployed and ssh-agent forwarding turned on.  
* `bundle install` run to drag in the rubygems deps

## Building a new server

To use this appliance:

* set the username you will use to connect to the server with in the Capfile:

    `set :user, 'lunix'`

* copy your ssh pub key to server

    `ssh-copy-id -i ~/.ssh/user_dsa.pub user@ci.example.com.au`

* using capistrano, prep server

    `cap puppet:prep`

* using capistrano, run puppet

    `cap puppet:go HOST='ci.example.com.au'`

* Test - http://ci.example.com:8080
