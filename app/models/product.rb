class Product < ApplicationRecord

  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre, presence: true
  validates :price_excluding_tax, presence: true

  has_many :product_in_carts, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre
  belongs_to :angler

  def posted_by?(user)
    product_in_carts.where(user_id: user.id).exists?
  end

end
