# Jenkins appliance


This repos is a standalone Puppet 2.7 _appliance_ for building / deploying a Jenkins instance.

## In here you will find:  

* a collection of puppet(2.7) manifests  
* a capistrano recipe for orchestration  

## Puppet modules used

* Puppetlabs' `stdlib` puppet module from the Puppetlab's Forge
* rafaelfelix's `jenkins` module from the Puppetlab's Forge

## Pre-requisites

The following pre-requisites should be met to be able to use this appliance.  

* a clean/fresh minimal Ubuntu Lucid VM (if starting from scratch)  
* a *deploy* user with sudo access on the VM
* ssh keys deployed and ssh-agent forwarding turned on.  
* capistrano installed locally  

## Building a new server

To build a new server from this appliance:


    :::bash
    # clone repos
    git clone git@bitbucket.org:aussielunix/jenkins-appliance.git
    # copy ssh pub key to server
    ssh-copy-id -i ~/.ssh/user_dsa.pub deploy@ci.example.com.au
    cd jenkins-appliance
    # using capistrano, prep server
    cap puppet:prep
    # using capistrano, run puppet
    cap puppet:go 
    # profit !
    ```

# TODO

* Write contributers howto
