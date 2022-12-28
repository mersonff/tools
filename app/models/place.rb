# frozen_string_literal: true

class Place < ApplicationRecord
  paginates_per 10

  belongs_to :place, optional: true
  has_many :children, class_name: 'Place', dependent: :nullify

  validates :name, presence: true, length: { minimum: 3 }

  delegate :name, to: :place, prefix: true, allow_nil: true

  scope :term, ->(term) { where('name ILIKE ?', "%#{term}%") }
  scope :exclude, ->(place_id) { where.not(id: place_id) }

  def to_s
    name
  end
end
