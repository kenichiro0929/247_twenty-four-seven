class GuestsController < ApplicationController

def new
end

def create
  user = User.find_or_create_by(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    
  end
  log_in user
  redirect_to root_url, notice: "ゲストユーザーとしてログインしました"
end



end


