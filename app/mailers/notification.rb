class Notification < ApplicationMailer

    def send_notification_mail(params)
        @url  = 'http://example.com/login'
        @user = params
        mail(to: @user, subject: 'Check Updates')
    end
end
