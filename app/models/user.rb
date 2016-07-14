class User < ApplicationRecord
before_save { self.email = email.downcase }
validates :name, presence: true, legnth: { maximum:50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence:true, legnth: { maximum:255 }
validates :position, presence: true, length: { maximum:50 },
           format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }
end
