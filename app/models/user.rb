class User < ApplicationRecord
  validates :email, presence: true

  has_many :futures
  has_many :comments

  has_and_belongs_to_many :upvoted_futures, class_name: 'Future'
  has_and_belongs_to_many :upvoted_outcomes, class_name: 'Outcome'
  has_and_belongs_to_many :upvoted_comments, class_name: 'Comment'

  has_secure_password

  validates :email, uniqueness: true
  validates :role, inclusion: { in: %w(registered admin) }

  after_initialize :default_role!
  before_validation :downcase_email

  mount_uploader :avatar, AvatarUploader

  paginates_per 10

  private

  def downcase_email
    self.email = email.downcase
  end

  def default_role!
    self.role ||= 'registered'
  end

end
