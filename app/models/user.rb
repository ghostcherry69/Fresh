class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_users
  self.postal_code + self.street_address + self.name
  end
  def full_users_name
  self.surname + self.name
  end
  def full_users_name_phonetic
  self.surname_phonetic + self.name_phonetic
  end

  def active_for_authentication?
  super && (self.is_active == true)
  end

  acts_as_paranoid

  validates :surname, presence: true
  validates :name, presence: true
  validates :surname_phonetic, presence: true
  validates :name_phonetic, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true

  has_many :delivery_destinations, dependent: :destroy
  has_many :product_in_carts, dependent: :destroy
end
