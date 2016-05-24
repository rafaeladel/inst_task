class BugDbWorker
  include Sidekiq::Worker
  include Utils

  def perform(bug_params, state_params)
    @new_bug = Bug.new(bug_params)
    @new_state = State.new(state_params)
    @new_bug.state = @new_state
    # @new_bug = self.construct_bug(bug_params, state_params)
    if @new_bug.save
      #deleting old cache value
      Rails.cache.delete("bugs_#{@new_bug.app_token}")
    end
  end
end