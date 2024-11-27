class ShopsController < ApplicationController
  def index
    @user = current_user
    @user_id = @user.id    
  end
end
