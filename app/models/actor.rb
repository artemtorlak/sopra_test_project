class Actor < ApplicationRecord
  has_many :actors_serials
  has_many :serials, through: :actors_serials
end
