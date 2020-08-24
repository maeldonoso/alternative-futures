require "application_system_test_case"

class SearchTest < ApplicationSystemTestCase
  test "Search term is displayed when searching from main search form" do
    #sleep(3.seconds)
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', user: user
    future.save!
    future_2 = Future.new title: 'What if we built new spaceships?', description: 'We could use them to go to Mars.', user: user
    future_2.save!

    visit(root_path)
    assert page.has_content?('Create your Futures. Explore their Outcomes.')

    within('main') do
      fill_in('q', with: 'Mars')
      click_on('Search')
    end

    assert has_content?('Mars')
    assert has_content?('spaceships')
    assert current_url.include?('q=Mars')
  end

  test "Search term is displayed when searching from header search form" do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', user: user
    future.save!
    future_2 = Future.new title: 'What if we built new spaceships?', description: 'We could use them to go to Mars.', user: user
    future_2.save!

    visit(root_path)

    within('header') do
      fill_in('q', with: 'Mars')
      click_on('Search')
    end

    assert has_content?('Mars')
    assert has_content?('spaceships')
    assert current_url.include?('q=Mars')
  end

  test 'No search result' do
    visit(futures_path)
    assert page.has_content?('No Future found for this search!')
  end
end
