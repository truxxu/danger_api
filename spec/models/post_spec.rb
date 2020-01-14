require 'rails_helper'

RSpec.describe Post, type: :model do
  # Association test
  it { should belong_to(:discussion) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:message) }
end
