class BugDbWorker
  include Sidekiq::Worker

  def perform(bug_params, state_params)
    @new_bug = Bug.new(bug_params)
    @new_bug.state = State.new(state_params)
    if @new_bug.save
      #deleting old cache value
      Rails.cache.delete("bugs_#{@new_bug.app_token}")
    end
  end
end