# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate, :authorize

  def authenticate
    # do some authetication
  end

  def authorize
    # this can be done with Pundit
    # sounds better do that here, as other interfaces can be unauthenticated
  end
end
