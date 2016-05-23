class ErrorsController < ApplicationController

  def not_found
    if env['REQUEST_PATH'] =~ /^\/api/
      render json: {error: "404 not found"}, status: 404
    else
      render text: "404 not found", status: 404
    end
  end

end