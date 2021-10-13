class Apartment < ApplicationRecord
  has_many :accsesses, dependent: :destroy
  accepts_nested_attributes_for :accsesses
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
end
