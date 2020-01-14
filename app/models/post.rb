class Post < ApplicationRecord
  # model association
  belongs_to :discussion
  #validations
  validates :author, :message, presence: true
end
