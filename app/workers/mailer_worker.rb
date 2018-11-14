class MailerWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by_id(user_id)
    UserMailer.welcome_email(user).deliver
  end
end
