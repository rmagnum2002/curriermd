class Edition < ActiveRecord::Base
  has_many :articles

  before_save :update_name

  def update_name
    self.name = "#{number}-#{year}"
  end
end
