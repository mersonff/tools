# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Place do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to belong_to(:place).optional(true) }
  it { is_expected.to have_many(:children) }
end
