class Outcome < ApplicationRecord
  validates :impact, presence: true
  validates :impact, inclusion: { in: %w(positive neutral negative) }
  validates :description, presence: true

  belongs_to :future

  has_and_belongs_to_many :users
end
