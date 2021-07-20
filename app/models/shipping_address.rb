class ShippingAddress < ApplicationRecord
  belongs_to :purchase_list
end
