class ActivateAccount
  def initialize(user, notifier: nil)
    @user = user
    @notifier = notifier || NotificationService.new
  end

  def activate
    @user.active = true
    @user.save

    @notifier.send_mail(@user.email)
  end
end

