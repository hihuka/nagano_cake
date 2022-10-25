class Address < ApplicationRecord

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_select
    [postal_code, address, name].join(' ')
  end
end
