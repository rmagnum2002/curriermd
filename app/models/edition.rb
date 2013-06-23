class Edition < ActiveRecord::Base
  attr_accessible :name, :number, :year

  has_many :articles

  before_save :update_name

  def update_name
    self.name = "#{self.number}-#{self.year}"
  end
end
