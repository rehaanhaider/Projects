class ApplicationMailer < ActionMailer::Base
  default from: "abc@xyz.com"
  layout 'mailer'
end
