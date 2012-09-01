# Jenkins Appliance

In here is some puppet manifests and modules for building out a working Jenkins system on a single host.  
You have a choice of two very simple deployment methods: 

* Vagrant
* Capistrano
  
Vagrant is for building out Jenkins in a local virtualbox guest.  

    vagrant up
    # browse to 172.31.255.2:8080

Capistrano is for building out Jenkins on a remote host.  
For full usage help run `cap -e go`

    cap go HOST='ec2-foo-09498.example.com'
    # browse to ec2-foo-09498.example.com:8080

## Requirements

Vagrant requires you have Virtualbox setup and the vagrant rubygem installed.  
Capistrano requires you have a clean Ubuntu Precise guest (from anywhere, local VM, cloud provider etc) and the capistrano rubygem installed.  
Both methods require you have a copy of the Puppet modules. This is a simple once off `librarian-puppet install`


<table>
  <tr>
    <th>Author</th><td>Mick Pollard (aussielunix at g mail dot com</td>
  </tr>
  <tr>
    <th>Copyright</th><td>Copyright (c) 2012 by Mick Pollard</td>
  </tr>
  <tr>
    <th>License</th><td>Distributed under the Apache License, see COPYING</td>
  </tr>
  <tr>
    <th>twitter </th><td>@aussielunix</td>
  </tr>
</table>

