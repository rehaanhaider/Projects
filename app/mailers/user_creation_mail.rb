class UserCreationMail < ApplicationMailer

    default from: "rehaan.haider09@gmail.com"

    def mailer(params)
        @url  = 'http://example.com/login'
        @user = params
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
