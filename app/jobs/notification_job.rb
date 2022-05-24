class NotificationJob < ActiveJob::Base
  queue_as :default

  def perform(followers, user)
    followers.each do |follower|    
      Notification.send_notification_mail(follower).deliver_now
    end
  end
end
