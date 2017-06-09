class Vendingmachine < ApplicationRecord
  has_many :products, dependent: :destroy
end
