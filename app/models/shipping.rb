class Shipping < ApplicationRecord

  belongs_to :customer

  with_options presence: true do
    validates :zip_code
    validates :address
    validates :name
  end

  def full_address
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
