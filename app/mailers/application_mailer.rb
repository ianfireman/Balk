class ApplicationMailer < ActionMailer::Base
  default from: "noreply@nobalk.herokuapp.com"
  layout 'mailer'
end
