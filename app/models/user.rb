class User < ApplicationRecord
  has_many :transactions
  has_many :watchlists
  has_many :ownedstocks
  has_many :stocks, through: :transactions
  has_many :stocks, through: :watchlists
  has_many :stocks, through: :ownedstocks

 validates :user_name, uniqueness: { case_sensitive: false }
 has_secure_password
end
