require "application_system_test_case"

class UpvotesTest < ApplicationSystemTestCase
  test "Upvote buttons are hidden to non-registered Users" do
    #sleep(3.seconds)
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    outcome = Outcome.new impact: 'positive', description: 'A new place to go on vacations.', future: future
    outcome.save!
    comment = Comment.new body: 'I volunteer.', user: user, future: future
    comment.save!

    visit(future_path(future))
    refute page.has_selector?(:link_or_button, 'Upvote this Future')
    refute page.has_selector?(:link_or_button, 'Upvote this Outcome')
    refute page.has_selector?(:link_or_button, 'Upvote this Comment')
  end

  test "Upvote buttons are accessible to registered Users" do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    outcome = Outcome.new impact: 'positive', description: 'A new place to go on vacations.', future: future
    outcome.save!
    comment = Comment.new body: 'I volunteer.', user: user, future: future
    comment.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Upvote this Future')
    assert page.has_selector?(:link_or_button, 'Upvote this Outcome')
    assert page.has_selector?(:link_or_button, 'Upvote this Comment')
  end

  test "Upvote and Downvote buttons work correctly" do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    outcome = Outcome.new impact: 'positive', description: 'A new place to go on vacations.', future: future
    outcome.save!
    comment = Comment.new body: 'I volunteer.', user: user, future: future
    comment.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(future_path(future))

    click_on('Upvote this Future')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Remove your upvote')
    click_on('Remove your upvote')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Upvote this Future')

    click_on('Upvote this Outcome')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Remove your upvote')
    click_on('Remove your upvote')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Upvote this Outcome')

    click_on('Upvote this Comment')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Remove your upvote')
    click_on('Remove your upvote')
    visit(future_path(future))
    assert page.has_selector?(:link_or_button, 'Upvote this Comment')
  end
end
