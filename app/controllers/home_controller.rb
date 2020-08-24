class HomeController < ApplicationController
  include ScoreHelper

  def index
    @futures = Future.most_recent

    # Data for the graphs.
    @nb_futures = Future.all.length
    @nb_outcomes = Outcome.all.length
    @nb_comments = Comment.all.length
    @nb_users = User.all.length

    # Specific layout for the Homepage.
    render :layout => 'application_root'
  end

  def about
    @current_year = Time.now.year

    # Data for the graphs.
    @score_array = []
    Future.all.each do |future|
      @future = future
      compute_future_score()
      @score_array.push [@future.predicted_year, @future_score]
    end
  end

  def chronology
    futures_display_limit = 12

    # Select the Futures owned by the User.
    if logged_in?
      @my_futures = Future.chronology_my_futures(current_user, futures_display_limit)
    else
      @my_futures = []
    end

    # Select the most recent Futures.
    @recent_futures = Future.chronology_recent_futures(6)

    # Select the most popular Futures.
    @popular_futures = Future.chronology_popular_futures(futures_display_limit)
  end
end
