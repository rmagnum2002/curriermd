class Feedback < ActiveRecord::Base
  validates_presence_of :name, message:'Please enter your name'
  validates_presence_of :email, message:'Please enter your email address'
  validates_presence_of :message, message:'Please enter a message'
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
