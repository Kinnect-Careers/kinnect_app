class ApplicationMailer < ActionMailer::Base
  # set noreply@kinnectcareers.com
  default from: 'admin@kinnectcareers.com'
  layout 'mailer'
end
