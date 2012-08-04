#!/usr/bin/env ruby

Bundler.require(:default)

set :user, 'lunix'
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

host = ENV['HOST']
host ||= 'ci.example.com'


namespace :puppet do

    desc 'prep server via rsync'
    task :prep, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        line = 'deb http://apt.puppetlabs.com/ lucid main'
        put line, '/tmp/puppetlabs.list.new'
        run "#{sudo} mv /tmp/puppetlabs.list.new /etc/apt/sources.list.d/puppetlabs.list"
        run "#{sudo} apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30"
        run "#{sudo} apt-get update"
        run "#{sudo} apt-get install -y puppet git-core"
        run "#{sudo} mkdir /opt/build -m0755"
        run "#{sudo} chown #{user}:#{user} /opt/build"
        `bundle exec librarian-puppet install`
        `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
    end

    desc 'update puppet repos on server - rsync'
    task :up, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        `git pull`
        `rsync -avz --delete -e ssh . #{user}@#{host}:/opt/build`
    end

    desc 'runs puppet apply on remote host - Params:  HOST OPTIONS'
    task :go, :hosts => host do
        options = ENV['options'] || ENV['OPTIONS']
        run "#{sudo} puppet apply --verbose /opt/build/init.pp --modulepath=/opt/build/modules #{options}"
    end
end
