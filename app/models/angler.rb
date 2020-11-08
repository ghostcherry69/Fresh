class Angler < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_anglers_name
  self.surname + self.name
  end

  acts_as_paranoid

  validates :surname, presence: true
  validates :name, presence: true
  validates :surname_phonetic, presence: true
  validates :name_phonetic, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true

end
