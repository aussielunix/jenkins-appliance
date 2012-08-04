#!/usr/bin/env ruby

set :user, 'deploy'
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

host = ENV['HOST']
host ||= 'ci.example.com'


namespace :puppet do

    desc 'prep dev server via rsync'
    task :prepd, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        lines = ['deb http://apt.puppetlabs.com/ lucid main',
            '']
        put lines.join('\n'), '/tmp/puppetlabs.list.new'
        run "#{sudo} mv /tmp/puppetlabs.list.new /etc/apt/sources.list.d/puppetlabs.list"
        run "#{sudo} apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30"
        run "#{sudo} apt-get update"
        run "#{sudo} apt-get install -y puppet git-core"
        run "#{sudo} mkdir /opt/build -m0755"
        run "#{sudo} chown deploy:deploy /opt/build"
        `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
    end

    desc 'prep server for puppet run - git clone etc'
    task :prep, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        lines = ['deb http://apt.puppetlabs.com/ lucid main',
            '']
        put lines.join("\n"), '/tmp/puppetlabs.list.new'
        run "#{sudo} mv /tmp/puppetlabs.list.new /etc/apt/sources.list.d/puppetlabs.list"
        run "#{sudo} apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30"
        run "#{sudo} apt-get update"
        run "#{sudo} apt-get install -y puppet git-core"
        run "#{sudo} mkdir /opt/build -m0755"
        run "#{sudo} chown deploy:deploy /opt/build"
        run "grep 'bitbucket.org' ~/.ssh/known_hosts || ssh-keyscan -t rsa,dsa bitbucket.org | tee -a ~/.ssh/known_hosts"
        run "git clone git@bitbucket.org:aussielunix/jenkins-appliance.git /opt/build"
    end

    desc 'update puppet repos on dev server - rsync'
    task :upd, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
    end

    desc 'update puppet repos from bitbucket'
    task :up, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        run "cd /opt/build && git pull"
    end

    desc 'runs puppet apply on remote host - Params:  HOST OPTIONS'
    task :go, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        run "#{sudo} puppet apply --verbose /opt/build/init.pp --modulepath=/opt/build/modules #{options}"
    end
end
