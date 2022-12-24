# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :place, optional: true
  has_many :children, class_name: 'Place', dependent: :nullify

  validates :name, presence: true, length: { minimum: 3 }
end
