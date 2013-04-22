module Ripple
  class Update < Engine

    attr_accessor :nuget, :preview, :force, :solution, :cache, :all_solutions, :verbose

    def command
      'update'
    end

    def build_args
      args = ''

      args = "#{args} --nuget \"#{@nuget}\"" unless @nuget.nil? or @nuget.empty?
      args = "#{args} --preview" if @preview
      args = "#{args} --force" if @force
      args = "#{args} --cache \"#{@cache}\"" unless @cache.nil? or @cache.empty?

      if @all_solutions
        args = "#{args} --all"
      else
        args = "#{args} --solution \"#{@solution}\"" unless @solution.nil? or @solution.empty?
      end

      args = "#{args} --verbose" if @verbose

      args.strip
    end

  end
end
