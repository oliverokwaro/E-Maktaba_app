class User < ApplicationRecord
validates :name, presence: true, legnth: { maximum:50 }
validates :email, presence:true, legnth: { maximum:255 }
validates :position, presence: true, length: { maximum:50 }
end
