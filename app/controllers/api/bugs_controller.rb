module Api
  class BugsController < ApiApplicationController
    respond_to :json

    def create
      @new_bug = Bug.new(bug_params)
      @new_state = State.new(state_params)
      @new_bug.state = @new_state
      if @new_bug.valid?
        BugDbWorker.perform_async(bug_params, state_params)
        render json: { number: @new_bug.bug_number }, status: 200
      else
        render json: { error: @new_bug.errors.messages }, status: 400
      end
    end

    def get_count
      num_of_bugs = Bug.cached_bugs_count(params[:app_token])
      render json: { total_number: num_of_bugs } , status: 200
    end

    def show
      @bug = Bug.find_by(app_token: params[:app_token], bug_number: params[:bug_number])
      render json: { bug: @bug, state: @bug.state}, status: 200
    end

    protected
    def bug_params
      params.require(:bug).permit(:app_token, :bug_status, :bug_priority) if params.has_key? :bug
    end

    def state_params
      params.require(:state).permit(:device, :os, :memory, :storage) if params.has_key? :state
    end
  end
end
