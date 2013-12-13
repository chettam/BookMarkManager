module Helpers
  TIME = 900
  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

  def password_recovery_token(email)
    user = User.first(email: email)
    token =  Array.new(64) {(65 + rand(58)).chr}.join.gsub('\\','').gsub('\/','').gsub('`','').gsub('^','')
    user.password_token = token
    user.password_token_timestamp = Time.now
    user.save
    token
  end

  def acceptable_time_difference?(time)
    Time.now- Time.parse(time) < 900
  end

  def retrieve_user(token)
    User.first(password_token: token)
  end
end