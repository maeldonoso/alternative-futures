require "application_system_test_case"

class ShowTest < ApplicationSystemTestCase
  test 'Show Future view displays Future title, description and predicted year' do
    #sleep(3.seconds)
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!

    visit(future_path(future))
    assert page.has_content?('Mars')
    assert page.has_content?('solar')
    assert page.has_content?('2150')
  end

  test 'Show Future view displays positive, neutral and negative Outcomes' do
    user = User.new email: 'new-user@epfl.ch', name: 'Test User', password: 'password'
    user.save!
    future = Future.new title: 'What if we colonized Mars?', description: 'In this scenario, humanity starts the colonization of the solar system.', predicted_year: 2150, user: user
    future.save!
    positive_outcome = Outcome.new impact: 'positive', description: 'Very well done, because Earth was crowded.', future: future
    positive_outcome.save!
    neutral_outcome = Outcome.new impact: 'neutral', description: 'Nothing will really change.', future: future
    neutral_outcome.save!
    negative_outcome = Outcome.new impact: 'negative', description: 'Say hello to interplanetary wars.', future: future
    negative_outcome.save!

    visit(future_path(future))
    assert page.has_content?('Earth')
    assert page.has_content?('Nothing')
    assert page.has_content?('interplanetary')
  end
end
