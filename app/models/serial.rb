class Serial < ApplicationRecord
  has_many :actors_serials
  has_many :actors, through: :actors_serials
  has_many :reviews
end
