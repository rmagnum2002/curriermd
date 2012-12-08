class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  validates_presence_of :name, message:'Please enter your name'
  validates_presence_of :email, message:'Please enter your email address'
  validates_presence_of :message, message:'Please enter a message'
  validates_format_of :email,
                      with:/^([^@\s]+)@((?:[-a-z0-9]+\.)+(com|org|net|biz|info|name|net|pro|aero|coop|museum|[a-z]{2,4}))$/i,
                      unless:'email.to_s.strip.empty?',
                      message:'Please provide a valid email address'
end
