require 'bundler/gem_tasks'

buildsupportfiles = Dir["#{File.dirname(__FILE__)}/buildsupport/*.rb"]

if( ! buildsupportfiles.any? )
  # no buildsupport, let's go get it for them.
  sh 'git submodule update --init' unless buildsupportfiles.any?
  buildsupportfiles = Dir["#{File.dirname(__FILE__)}/buildsupport/*.rb"]
end

# nope, we still don't have buildsupport. Something went wrong.
raise "Run `git submodule update --init` to populate your buildsupport folder." unless buildsupportfiles.any?

require './buildsupport/common'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

task :update => %w{update_buildsupport} do
  [
    'ripple.exe',
    'FubuCore.dll',
    'Nuget.Core.dll'
  ].each do |file|
    cp "buildsupport/#{file}", "bin/ripple_exe/#{file}"
  end
end

