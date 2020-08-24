require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Saving a Future without and with a Comment' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!
    comment = Comment.new body: "Great future!", user: user
    future.comments << comment
    future.save!
    id = future.comments.first.id
    assert_equal(Comment.find(id), comment)
  end

  test 'Comments are ordered correctly' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!
    comment_1 = Comment.new body: 'Great future!', user: user
    comment_2 = Comment.new body: "I agree! But that could also be dangerous.", user: user
    future.comments << comment_1
    future.comments << comment_2
    future.save!
    assert_equal(future.comments.first, comment_1)
    assert_equal(future.comments.length, 2)
  end
end
