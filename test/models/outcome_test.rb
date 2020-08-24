require 'test_helper'

class OutcomeTest < ActiveSupport::TestCase
  test 'Saving a Future without and with an Outcome' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!
    outcome = Outcome.new description: "The AI will be kind and helpful.", impact: 'positive', future: future
    future.outcomes << outcome
    future.save!
    id = future.outcomes.first.id
    assert_equal(Outcome.find(id), outcome)
  end

  test 'Saving a Future with several Outcomes' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    future.save!
    outcome_1 = Outcome.new description: "The AI will be kind and helpful.", impact: 'positive', future: future
    future.outcomes << outcome_1
    outcome_2 = Outcome.new description: "The AI will be neutral.", impact: 'neutral', future: future
    future.outcomes << outcome_2
    outcome_3 = Outcome.new description: "The AI will be unpleasant.", impact: 'negative', future: future
    future.outcomes << outcome_3
    future.save!
    id = future.outcomes.first.id
    assert_equal(Outcome.all.length, 3)
  end

  test 'Outcomes must have their impact defined' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    outcome = Outcome.new description: "We do not know the consequences.", future: future
    future.outcomes << outcome
    refute future.valid?
  end
  
  test 'Outcomes can only take predefined values for impact' do
    user = User.new email: 'test@epfl.ch', password: 'password'
    future = Future.new title: 'What if a strong AI was developed?', user: user
    outcome = Outcome.new description: "We do not know the consequences.", impact: 'uncertain', future: future
    future.outcomes << outcome
    refute future.valid?
  end
end
