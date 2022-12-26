# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :place, optional: true
  has_many :children, class_name: 'Place', dependent: :nullify

  validates :name, presence: true, length: { minimum: 3 }

  scope :term, ->(term) { where('name ILIKE ?', "%#{term}%") }
  scope :exclude, ->(place_id) { where.not(id: place_id) }
end
