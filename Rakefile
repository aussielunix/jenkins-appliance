# Rakefile

Bundler.require(:test)

desc "Check puppet module syntax."
task :syntax do
  begin
    require 'puppet/face'
  rescue LoadError
    fail 'Cannot load puppet/face, are you sure you have Puppet 2.7?'
  end

  def validate_manifest(file)
    begin
      Puppet::Face[:parser, '0.0.1'].validate(file)
    rescue Puppet::Error => error
      puts error.message
    end
  end

  Rake::Task[:erb].invoke
  puts "Checking puppet manifest syntax..."
  FileList['**/*.pp'].each do |manifest|
    next if manifest =~ /vendor/ or manifest =~ /tests/ or manifest =~ /pkg/
    puts "Evaluating syntax for #{manifest}"
      validate_manifest manifest
  end
end

desc '''
Check puppet module code style. 
This task will test all the .pp files for lint.
Can optionally supply a module name to limit the test to.

EG:

  rake style
  rake style[modulename]
  rake style[apache]

'''
task :style, :module do |t, args|
  begin
    require 'puppet-lint'
  rescue LoadError
    fail 'Cannot load puppet-lint, did you install it?'
  end
  puppet_module = args[:module] || 'allofthem'
  search_path = "modules/#{puppet_module}/**/*.pp"
  search_path = "**/*.pp" if puppet_module == 'allofthem'

  puts "Checking puppet manifest code style..."
  linter = PuppetLint.new
  linter.configuration.log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'
  linter.configuration.send("disable_80chars")

  FileList[search_path].each do |puppet_file|
    next if puppet_file =~ /vendor/ or puppet_file =~ /tests/ or puppet_file =~ /pkg/
    puts "Evaluating code style for #{puppet_file}"
      linter.file = puppet_file
      linter.run
  end
  fail if linter.errors?
end


desc "test erb syntax"
task :erb do
  FileList['**/*.erb'].each do |template|
    next if template =~ /vendor/ or template =~ /test/ or template =~ /pkg/

      puts "Evaluating (erb) template syntax -  #{template}"
      Open3.popen3('ruby -Ku -c') do |stdin, stdout, stderr|
      stdin.puts(ERB.new(File.read(template), nil, '-').src)
      stdin.close
      if error = ((stderr.readline rescue false))
        puts template + error[1..-1].sub(/^[^:]*:\d+: /, '')
        exit 1
      end
      stdout.close rescue false
      stderr.close rescue false
      end
  end
end

desc "check for lint and syntax errors"
task :all do
  Rake::Task[:syntax].invoke
  Rake::Task[:style].invoke
  Rake::Task[:erb].invoke
end
