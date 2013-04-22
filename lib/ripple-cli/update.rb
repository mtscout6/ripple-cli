module Ripple
  class Update

    def update
      system("#{RIPPLE_EXE} update")
    end

  end
end
