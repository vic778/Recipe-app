class UsersController < ApplicationController
  def index
    render 'devise/sessions/new' unless current_user
  end
end
