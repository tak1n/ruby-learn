# You could pass in the user_id and let a private method fetch the specific user

class ActivateUser
  def initialize(user_id, notifier: nil)
    @user = find_user(user_id)
    @notifier = notifier || NotificationService.new
  end

  def activate
    @user.active = true
    @user.save

    do_something_complex(@user)

    @notifier.send_mail(@user.email)
  end

  private

  def do_something_complex(user)
    # complex stuff here and there
  end

  def find_user(id)
    User.find(id)
  end
end

# Or pass in the user object

class ActivateUser2
  def initialize(user, notifier: nil)
    @user = user
    @notifier = notifier || NotificationService.new
  end

  def activate
    @user.active = true
    @user.save

    do_something_complex(@user)

    @notifier.send_mail(@user.email)
  end

  private

  def do_something_complex(user)
    # complex stuff here and there
  end
end

