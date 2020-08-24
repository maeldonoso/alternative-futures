require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Email is lowercased before validation' do
    user = User.new email: 'tEsT@EpFl.Ch', password: 'password'
    user.save!
    assert_equal(user.email, 'test@epfl.ch')
  end

  test 'Adding a name to a User' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    user.save!
    user.name = 'New User'
    assert user.valid?
  end

  test 'Adding an avatar to a User' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    user.save!
    user.avatar = 'avatar.png'
    assert user.valid?
  end

  test 'Default role for Users is registered' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    user.save!
    assert user.role == 'registered'
  end

  test 'Users can only take predefined values for role' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    user.save!
    user.role = 'hacker'
    refute user.valid?
  end
end
