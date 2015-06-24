class ActivateAccount
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

