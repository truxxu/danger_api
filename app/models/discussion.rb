class Discussion < ApplicationRecord
  # model association
  belongs_to :topic
  has_many :posts, dependent: :destroy
  #validations
  validates :author, :title, :message, presence: true
end
