require 'rails_helper'

RSpec.describe Topic, type: :model do
  # Association test
  # ensure Topic model has a 1:m relationship with the discussion model
  it { should have_many(:discussions).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:name ) }
end
