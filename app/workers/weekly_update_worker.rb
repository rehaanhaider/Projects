
class WeeklyUpdateWorker
  include Sidekiq::Worker

  def perform
    p "helloooooooo workerrrrrrrrrr"
    p "helloooooooo workerrrrrrrrrr"
    p "helloooooooo workerrrrrrrrrr"
    p "helloooooooo workerrrrrrrrrr"

    @users = User.all
    @users.each do |user|
      DailyUpdateMail.mailer(user.email).deliver_now
    end
  end
end
