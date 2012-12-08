class UserMailer < ActionMailer::Base
  default from: "particip@mail.md"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.feedback.subject
  #
  def feedback(feedback)
    @host = "curroer.md"
    @link = "www.currier.md"
    @feedback = feedback
    mail to: "currier@mail.md"
  end
end
