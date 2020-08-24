require 'test_helper'

class FutureTest < ActiveSupport::TestCase
  test 'The first empty Future created is first in the list' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    first_future = Future.new title: 'What if a strong AI was developed?', user: user
    first_future.save!
    second_future = Future.new title: 'What if a strong AI was developed?', user: user
    second_future.save!
    assert_equal(first_future, Future.all.first)
  end

  test 'The first complete Future created is first in the list' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    first_future = Future.new title: 'What if a strong AI was developed?',
                          predicted_year: 2050,
                          user: user
    first_future.save!
    second_future = Future.new title: 'What if we colonized Mars?',
                          description: 'We could launch a mission to colonize the planet.',
                          predicted_year: 2100,
                          user: user
    second_future.save!
    assert_equal(first_future, Future.all.first)
  end

  test 'Updated_at is changed after updating title' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new user: user
    future.title = 'What if a strong AI was developed?'
    future.save!
    first_updated_at = future.updated_at
    future.title = 'What if we colonized Mars?'
    future.save!
    refute_equal(future.updated_at, first_updated_at)
  end

  test 'One matching result' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new user: user
    future.title = 'What if a strong AI was developed?'
    future.save!
    assert_equal(Future.search('strong AI').length, 1)
  end

  test 'No matching result' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new user: user
    future.title = 'What if a strong AI was developed?'
    future.save!
    assert_empty(Future.search('Mars'))
  end

  test 'Two matching results where both title and description match' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future_1 = Future.new user: user
    future_1.title = 'What if a strong AI was developed?'
    future_1.save!
    future_2 = Future.new user: user
    future_2.title = 'What if we colonized Mars?'
    future_2.description = 'A strong AI could help to do that.'
    future_2.save!
    assert_equal(Future.search('strong AI').length, 2)
  end

  test 'Only description matches' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future_1 = Future.new user: user
    future_1.title = 'What if a strong AI was developed?'
    future_1.save!
    future_2 = Future.new user: user
    future_2.title = 'What if we colonized Mars?'
    future_2.description = 'A strong AI could help to do that.'
    future_2.save!
    assert_equal(Future.search('help').length, 1)
  end

  test 'No Future record exists' do
    assert_empty(Future.most_recent)
  end

  test 'Six Future records exist' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    6.times do |i|
      future = Future.new user: user
      future.title = "Interesting Future #{i+1}"
      future.save!
    end
    assert_equal(Future.all.length, 6)
    assert_equal(Future.most_recent[0].title, 'Interesting Future 6')
  end

  test 'Title too long' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new user: user
    future.title = 'This is a very long title, with a lot of words.
    This title is probably longer than 75 characters, which is the limit
    that we have defined for a title of our Idea object.'
    refute future.valid?
  end

  test 'No title' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new user: user
    refute future.valid?
  end
end
