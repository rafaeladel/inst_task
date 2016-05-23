class ErrorsController < ApplicationController

  def not_found
    render json: {error: "404 not found"}, status: 404
  end

end