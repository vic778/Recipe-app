class UsersController < ApplicationController
  def index; end

  def sign_out
    sign_out_and_redirect(current_user)
  end
end
