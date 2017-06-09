class VmDetail < ApplicationRecord
  belongs_to :vendingmachine
  belongs_to :product
end
