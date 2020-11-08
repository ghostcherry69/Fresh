class DeliveryDestination < ApplicationRecord

  def full_delivery_destinations
    self.postal_code + self.street_address + self.name
  end

  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :name, presence: true

  belongs_to :user

end
