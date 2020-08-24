require "application_system_test_case"

class FutureTest < ApplicationSystemTestCase
  test 'Create a Future' do
    #sleep(3.seconds)
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(account_path)
    click_on('Create Future')

    fill_in('Title', with: 'What if we colonized Mars?')
    fill_in('Description', with: 'In this scenario, humanity starts the colonization of the solar system.')
    fill_in('Predicted year', with: '2150')
    click_on('Create Future')

    visit(future_path(1))
    assert page.has_content?('Mars')
    assert page.has_content?('solar')
    assert page.has_content?('2150')
  end

  test 'Edit a Future' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(future_path(future))
    assert page.has_content?('Mars')
    assert page.has_content?('solar')
    assert page.has_content?('2150')

    visit(edit_future_path(future))
    fill_in('Title', with: 'What if we colonized Venus?')
    fill_in('Description', with: 'Finally, Venus is a better choice.')
    fill_in('Predicted year', with: '2200')
    click_on('Update Future')

    visit(future_path(future))
    assert page.has_content?('Venus')
    assert page.has_content?('choice')
    assert page.has_content?('2200')
  end

  test 'Homepage loads the twelve most recent Futures' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!

    12.times do |i|
      future = Future.new user: user
      future.title = "Exciting Future #{i+1}"
      future.save!
    end

    visit(root_path)
    12.times do |i|
      assert page.has_content?("Exciting Future #{i+1}")
    end
    sleep(3.seconds)
  end

  test 'Warning message if title too long' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(account_path)
    click_on('Create Future')

    fill_in('Title', with: 'What if we colonized Mars? Or Venus? Or Jupiter? In fact, every planet could do, as long as it is not Earth. Earth is really populated right now, I really wish I were somewhere else.')
    sleep(3.seconds)
    click_on('Create Future')
    assert page.has_content?('Title is too long')
  end
end
