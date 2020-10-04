require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :null_session
  respond_to :json
  
  def index
    render inline: '', layout: 'application' # Avoid having an empty view file.
  end
end
