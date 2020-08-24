require "application_system_test_case"

class LogInTest < ApplicationSystemTestCase
  test "Sign up creates a User" do
    #sleep(3.seconds)
    # Creating a Future is necessary for the home#index view to load correctly.
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!

    visit(new_user_path)
    fill_in('Email', with: 'new-user-2@epfl.ch')
    fill_in('Password', with: 'password')
    within('main') do
      click_on('Sign up')
    end

    assert_equal(User.all.length, 2)
    assert_equal(User.last.email, 'new-user-2@epfl.ch')
  end

  test "Log in does not create a User" do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    within('main') do
        click_on('Log in')
    end

    assert_equal(User.all.length, 1)
  end

  test 'When logged in, name and email are shown in Account' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    within('main') do
        click_on('Log in')
    end

    visit(account_path)
    assert page.has_content?('Test User')
    assert page.has_content?('new-user@epfl.ch')
  end
end
