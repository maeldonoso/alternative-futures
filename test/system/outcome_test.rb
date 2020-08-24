require "application_system_test_case"

class OutcomeTest < ApplicationSystemTestCase
  test 'Create an Outcome' do
    #sleep(3.seconds)
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

    visit(edit_future_path(future))
    click_on('Add a new Outcome')

    fill_in('Add an Outcome', with: 'Perfect, I always dreamed of visiting Mars. And also Jupiter.')
    click_on('Create Outcome')

    visit(future_path(future))
    assert page.has_content?('Jupiter')
  end

  test 'Edit an Outcome' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    outcome = Outcome.new impact: 'positive', description: 'Perfect, I always dreamed of visiting Mars.', future: future
    outcome.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(edit_future_path(future))
    click_on('Edit Outcome')

    fill_in('Add an Outcome', with: 'With the colonization of Mars, people will miss Earth so much. That will be so funny.')
    click_on('Update Outcome')

    visit(future_path(future))
    assert page.has_content?('Earth')
  end

  test 'Delete an Outcome' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    outcome = Outcome.new impact: 'positive', description: 'Perfect, I always dreamed of visiting Mars. And also Jupiter.', future: future
    outcome.save!

    visit(new_session_path)
    fill_in('email', with: 'new-user@epfl.ch')
    fill_in('password', with: 'password')
    within('main') do
      click_on('Log in')
    end

    visit(edit_future_path(future))
    click_on('Delete Outcome')

    visit(future_path(future))
    refute page.has_content?('Jupiter')
  end
end
