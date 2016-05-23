module Api
  class ApiApplicationController < ApplicationController
    protect_from_forgery with: :null_session

    rescue_from StandardError do |e|
      render_rescue_json(e)
    end

    def render_rescue_json(exception)
      render json: { error: exception.message }, status: 500
    end
  end
end