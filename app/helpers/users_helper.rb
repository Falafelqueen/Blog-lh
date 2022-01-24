module UsersHelper
  def log_in(user)
    Session.new(user_id: user.id)
  end
end
