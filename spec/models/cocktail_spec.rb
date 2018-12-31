# frozen_string_literal: true

# spec/models/cocktail_spec.rb
require 'rails_helper'

# Test suite for the Cocktail model
RSpec.describe Cocktail, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
