require "application_system_test_case"

class CommentTest < ApplicationSystemTestCase
  test 'Add a Comment' do
    #sleep(3.seconds)
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

    visit(future_path(future))
    fill_in('Add a Comment', with: 'Great Future!')
    click_on('Post')
    assert page.has_content?('Comment by Test User')
    assert page.has_content?('Great Future!')

    visit(future_path(future))
    assert page.has_content?('Comment by Test User')
    assert page.has_content?('Great Future!')
  end

  test 'Comments cannot be added unless logged in' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!

    visit(future_path(future))
    refute page.has_content?('Add a Comment')
  end

  test 'Delete a Comment' do
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

    visit(future_path(future))
    fill_in('Add a Comment', with: 'Great Future!')
    click_on('Post')
    assert page.has_content?('Comment by Test User')
    assert page.has_content?('Great Future!')

    visit(edit_future_path(future))
    click_on('Delete Comment')

    visit(future_path(future))
    refute page.has_content?('Comment by Test User')
    refute page.has_content?('Great Future!')
  end
end
