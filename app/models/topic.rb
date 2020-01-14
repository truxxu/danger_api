class Topic < ApplicationRecord
  # model association
  has_many :discussions, dependent: :destroy
  # validations
  validates :name, presence: true
end
