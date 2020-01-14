require 'rails_helper'

RSpec.describe Discussion, type: :model do
  # Association test
  # ensure an discussion record belongs to a single topic record
  it { should belong_to(:topic) }
  it { should have_many(:posts).dependent(:destroy) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:message) }
end
