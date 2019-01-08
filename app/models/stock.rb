class Stock < ApplicationRecord
  has_many :transactions
  has_many :watchlists
  has_many :ownedstocks
  has_many :users, through: :transactions
  has_many :users, through: :watchlists
  has_many :users, through: :ownedstocks
end
