module Ripple
  class Restore < Engine

    attr_accessor :feeds, :force, :solution, :cache, :all_solutions, :verbose

    def command
      'restore'
    end

    def build_args
      args = ''

      args = "#{args} --feeds \"#{@feeds.join('#')}\"" unless @feeds.nil? or @feeds.length < 1
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
