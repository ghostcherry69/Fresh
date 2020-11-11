class Order < ApplicationRecord

  def full_order_delivery_destinations
    self.postal_code + self.street_address + self.name
  end

  enum method_payment: {
  "クレジットカード": 0,
  "銀行振込": 1,
  }

  enum order_status: {
  "入金待ち": 0,
  "入金確認": 1,
  "発送準備中": 2,
  "発送済み": 3,
  }

  belongs_to :user
  has_many :ordered_products, dependent: :destroy

end
