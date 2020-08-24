class Future < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 75 }

  belongs_to :user

  has_many :comments
  has_many :outcomes

  has_and_belongs_to_many :users

  scope :most_recent, -> { order(created_at: :desc).limit(12) }
  scope :title_contains, ->(term) { where('title LIKE ?', "%#{term}%") }
  scope :description_contains, ->(term) { where('description LIKE ?', "%#{term}%") }
  scope :search, ->(search_term) { title_contains(search_term).or(description_contains(search_term)) }

  def self.chronology_my_futures(current_user, futures_display_limit)
    @my_futures = Future.where(user: current_user).limit(futures_display_limit).order(predicted_year: :desc)
    return @my_futures
  end

  def self.chronology_recent_futures(futures_display_limit)
    @recent_futures = Future.where(id: Future.order(created_at: :desc).limit(futures_display_limit)).order(predicted_year: :desc)
    return @recent_futures
  end

  def self.chronology_popular_futures(futures_display_limit)
    # Part 1/3: Select the Futures with the most upvotes.
    futures_upvotes = []
    Future.all.each do |future|
      futures_upvotes << [future.id, future.users.length]
    end
    futures_upvotes = futures_upvotes.sort_by{|x,y|y}[-futures_display_limit..-1]

    # Part 2/3: Order the Futures (reverse-)chronologically and add placeholder values when no predicted year.
    chronological_futures_upvotes = []
    for i in 1..futures_upvotes.length do
      future_id = futures_upvotes[i -1][0]
      future_year = Future.find(future_id).predicted_year
      if future_year == nil
        future_year = 0 # If there is no predicted year, we set a placeholder value for the sorting.
      end
      chronological_futures_upvotes << [future_id, future_year]
    end
    chronological_futures_upvotes = chronological_futures_upvotes.sort_by{|x,y|y}.reverse()

    # Part 3/3: Get the Futures IDs in (reverse) chronological order, and select the corresponding Futures.
    futures_ids = []
    for i in 1..chronological_futures_upvotes.length do
      futures_ids << chronological_futures_upvotes[i -1][0]
    end
    @popular_futures = Future.find(futures_ids)

    return @popular_futures
  end

  mount_uploader :personalized_photo, PersonalizedPhotoUploader

  paginates_per 12
end
