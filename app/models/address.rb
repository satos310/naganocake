class Address < ApplicationRecord
  belongs_to :customer

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + fist_name
  end

end
