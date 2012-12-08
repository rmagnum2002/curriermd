class UserMailer < ActionMailer::Base
  default from: "particip@mail.md"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.feedback.subject
  #
  def feedback(feedback)
    @host = "particip.md"
    @link = "www.particip.md"
    @feedback = feedback
    mail to: "particip@mail.md"
  end
end
