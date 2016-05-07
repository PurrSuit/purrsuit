class Cabinet < ActiveRecord::Base
  # has_many :deputy

  validates :annex, presence: true
  validates :number, presence: true

end
