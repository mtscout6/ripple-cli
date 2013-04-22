module Ripple
  RIPPLE_EXE = File.expand_path "#{File.dirname(__FILE__)}/../bin/ripple_exe/ripple.exe", __FILE__
end

Dir["#{File.dirname(__FILE__)}/ripple-cli/**/*.rb"].each{|f| load f }
