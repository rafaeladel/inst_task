class BugsHelper
    def construct_bug(bug_params, state_params)
      @new_bug = Bug.new(bug_params)
      @new_state = State.new(state_params)
      @new_bug.state = @new_state
      @new_bug
    end
end
