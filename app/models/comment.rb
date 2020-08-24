class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :future
  belongs_to :user

  has_and_belongs_to_many :users

  paginates_per 10
end
