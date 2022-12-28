# frozen_string_literal: true

class Tool < ApplicationRecord
  belongs_to :place

  has_one_attached :image

  enum kind: { air_conditioning: 0, pc: 1, monitor: 2, mouse: 3, keyboard: 4, tv: 5, router: 6, coffee_maker: 7 },
    _default: 0

  validates :name, presence: true, length: { minimum: 3 }
  validates :brand, presence: true
  validates :kind, presence: true
  validates :code, presence: true, numericality: { only_integer: true }

  delegate :name, to: :place, prefix: true, allow_nil: true
end
