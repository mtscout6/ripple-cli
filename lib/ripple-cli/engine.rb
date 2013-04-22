module Ripple
  class Engine
    def execute
      system("#{RIPPLE_EXE} #{command} #{build_args}")
    end

    def command
      throw 'Command to be implemented'
    end

    def build_args
      throw 'Args to be implemented'
    end
  end
end
