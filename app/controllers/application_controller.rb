class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_hero!

  def secret
    render :text => "Success"
  end
end
