class Item < ApplicationRecord
  belongs_to :genre
	has_many :cart_items, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}

end
