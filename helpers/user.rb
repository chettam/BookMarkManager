module Helpers

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  def password_recovery_token(email)
    user = User.first(email:  email)
    user.update(password_token: Array.new(64) {(65 + rand(58)).chr}.join, password_token_timestamp: Time.now)

    puts User.save
  end
end