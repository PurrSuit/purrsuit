class User < ActiveRecord::Base
  acts_as :person

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }

  before_save { self.email = email.downcase }
  validates :email, presence: true
  VALID_EMAIL_REGEX	=	/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :password, presence: true, length: { minimum: 8 }

end
