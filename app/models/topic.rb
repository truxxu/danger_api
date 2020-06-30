class Topic < ApplicationRecord
  # model association
  has_many :discussions, dependent: :destroy
  # validations
  validates :title, presence: true
end
