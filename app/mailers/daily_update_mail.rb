class DailyUpdateMail < ApplicationMailer
    default from: "abc@xyz.com"
    def mailer(params)
        @url  = 'http://example.com/login'
        @user = params
        mail(to: @user, subject: 'Weekly Updates of Blogging', )
    end
end
