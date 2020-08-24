require "application_system_test_case"

class ChronologyTest < ApplicationSystemTestCase
  test "Add a Future to Chronology and remove it from Chronology" do
    #sleep(3.seconds)
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    future_2 = Future.new title: 'What if we colonized Venus?', description: 'In this scenario, humanity expands the colonization of the solar system.', predicted_year: 2300, user: user
    future_2.save!
    user.upvoted_futures << future
    user.upvoted_futures << future_2

    1.upto(12) do |i|
      Future.create! title: "Future n°#{i}", description: 'This Future is very interesting, for some reasons.', user: user
    end

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(chronology_path)
    assert page.has_content?('Your Chronology is currently empty.')
    refute page.has_content?('What if we colonized Mars?')

    visit(future_path(future))
    click_on('Add to Chronology')

    visit(chronology_path)
    assert page.has_content?('What if we colonized Mars?')
    refute page.has_content?('What if we colonized Venus?')

    visit(future_path(future))
    click_on('Remove from Chronology')

    visit(chronology_path)
    assert page.has_content?('Your Chronology is currently empty.')
    refute page.has_content?('What if we colonized Mars?')
  end

  test "Display the standard Chronologies" do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    future_2 = Future.new title: 'What if we colonized Venus?', description: 'In this scenario, humanity expands the colonization of the solar system.', predicted_year: 2300, user: user
    future_2.save!
    user.upvoted_futures << future
    user.upvoted_futures << future_2

    1.upto(12) do |i|
      Future.create! title: "Future n°#{i}", description: 'This Future is very interesting, for some reasons.', user: user
    end

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(chronology_path)
    assert page.has_content?('Your Chronology is currently empty.')
    refute page.has_content?('What if we colonized Mars?')

    click_on('My Futures')
    assert page.has_content?('What if we colonized Mars?')
    assert page.has_content?('What if we colonized Venus?')

    click_on('Popular Futures')
    assert page.has_content?('What if we colonized Mars?')
    assert page.has_content?('What if we colonized Venus?')

    click_on('Recent Futures')
    refute page.has_content?('What if we colonized Mars?')
    refute page.has_content?('What if we colonized Venus?')
  end
end
