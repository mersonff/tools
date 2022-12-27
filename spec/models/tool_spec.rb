# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tool do
  subject(:tool) { described_class }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to belong_to(:place) }

  it { is_expected.to validate_length_of(:name).is_at_least(3) }

  it {
    expect(tool).to define_enum_for(:kind).with_values(air_conditioning: 0, pc: 1, monitor: 2, mouse: 3, keyboard: 4,
      tv: 5, router: 6, coffee_maker: 7)
  }
end
