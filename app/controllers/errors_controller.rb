class ErrorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def not_found
    render json: {error: "404 not found"}, status: 404
  end

end