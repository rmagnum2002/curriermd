class UserMailer < ActionMailer::Base
  default from: "courrier@mail.md"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.feedback.subject
  #
  def feedback(feedback)
    @host = "courrier.md"
    @link = "www.courrier.md"
    @feedback = feedback
    mail to: "rmagnum2002@gmail.com"
  end
end
