
class WeeklyUpdateWorker
  include Sidekiq::Worker

  def perform
    @users = User.all
    @users.each do |user|
      DailyUpdateMail.mailer(user.email).deliver_now
    end
  end
end
