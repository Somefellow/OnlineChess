# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login, except: %i[index]

  private

  def require_login
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to login_path
  end
end
