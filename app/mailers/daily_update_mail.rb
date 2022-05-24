class DailyUpdateMail < ApplicationMailer

    default from: "rehaan.haider09@gmail.com"

    def mailer(params)
        @url  = 'http://example.com/login'
        @user = params
        mail(to: @user, subject: 'Weekly Updates of Blogging', )
    end
end
