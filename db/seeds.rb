# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Users
admin = User.create! email: ENV["SEEDS_ADMIN_EMAIL"], password: ENV["SEEDS_ADMIN_PASSWORD"], name: 'Admin User', role: 'admin'
registered = User.create! email: ENV["SEEDS_REGISTERED_EMAIL"], password: ENV["SEEDS_REGISTERED_PASSWORD"], name: 'Registered User'
hari_seldon = User.create! email: ENV["SEEDS_HARI_SELDON_EMAIL"], password: ENV["SEEDS_HARI_SELDON_PASSWORD"], name: 'Hari Seldon'
susan_calvin = User.create! email: ENV["SEEDS_SUSAN_CALVIN_EMAIL"], password: ENV["SEEDS_SUSAN_CALVIN_PASSWORD"], name: 'Susan Calvin'

# Future 1
future_1 = Future.create! title: "What if the United Nations evolved into a world state?", description: "In this scenario, a world parliament, a world government and a world supreme court are founded.", photo_url: 'https://images.unsplash.com/photo-1590274853856-f22d5ee3d228?ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80', predicted_year: 2080, user: admin
Outcome.create! impact: "positive", description: "This will be the beginning of an era of peace, progress and great achievements.", future: future_1
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_1
Outcome.create! impact: "negative", description: "This new state could turn into an authoritarian regime.", future: future_1

# Future 2
future_2 = Future.create! title: "What if the United States of Europe were created?", description: "In this scenario, the European Union advances significatively in its political integration.", photo_url: 'https://images.unsplash.com/photo-1536181783029-1097aaf179de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2704&q=80', predicted_year: 2040, user: admin
Outcome.create! impact: "positive", description: "This will lead to a stronger, better Europe.", future: future_2
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_2
Outcome.create! impact: "negative", description: "This will bring even more bureaucracy.", future: future_2

# Future 3
future_3 = Future.create! title: "What if renewable energies were encouraged by massive subventions?", description: "In this scenario, hydraulic, wind and solar energy develop quicker and take precedence over other energy sources.", photo_url: 'https://images.unsplash.com/photo-1589201529153-5297335c1684?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3289&q=80', predicted_year: 2030, user: registered
Outcome.create! impact: "positive", description: "This will accelerate the energetic transition and lead to a cleaner environment.", future: future_3
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_3
Outcome.create! impact: "negative", description: "Massive subventions will create a massive debt and distort the economic competition.", future: future_3

# Future 4
future_4 = Future.create! title: "What if genetic manipulation on human genome was allowed?", description: "In this scenario, all the legal barriers to human genome manipulation are removed.", photo_url: 'https://images.unsplash.com/photo-1579154392128-bf8c7ebee541?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60', predicted_year: 2070, user: registered
Outcome.create! impact: "positive", description: "Nice, at last we will get rid of cancer and other diseases.", future: future_4
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_4
Outcome.create! impact: "negative", description: "This technology will be used to tailor human bodies to the needs of corporations.", future: future_4

# Future 5
future_5 = Future.create! title: "What if a strong AI was developed?", description: "In this scenario, a government or a corporation is able to develop a human-like AI.", photo_url: 'https://images.unsplash.com/photo-1580706483913-b6ea7db483a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2737&q=80', predicted_year: 2050, user: susan_calvin
Outcome.create! impact: "positive", description: "The AI will be kind and helpful.", future: future_5
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_5
Outcome.create! impact: "negative", description: "The AI will be unpleasant.", future: future_5

# Future 6
future_6 = Future.create! title: "What if robots took all our jobs?", description: "In this scenario, human work is not needed anymore.", photo_url: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2700&q=80', predicted_year: 2080, user: susan_calvin
Outcome.create! impact: "positive", description: "Perfect! More time for hobbys.", future: future_6
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_6
Outcome.create! impact: "negative", description: "Humans will feel useless.", future: future_6

# Future 7
future_7 = Future.create! title: "What if nuclear fusion was developed?", description: "In this scenario, an almost unlimited energy source is obtained.", photo_url: 'https://images.unsplash.com/photo-1594116640715-b8262ed62ea0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80', predicted_year: 2100, user: hari_seldon
Outcome.create! impact: "positive", description: "Amazing! No more electricity problems.", future: future_7
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_7
Outcome.create! impact: "negative", description: "With more energy, industrial production and environmental destruction will be on the rise.", future: future_7

# Future 8
future_8 = Future.create! title: "What if we colonized Mars?", description: "In this scenario, humanity starts the colonization of the solar system.", photo_url: 'https://images.unsplash.com/photo-1573588028698-f4759befb09a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2980&q=80', predicted_year: 2150, user: hari_seldon
Outcome.create! impact: "positive", description: "Very well done, because Earth was crowded.", future: future_8
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_8
Outcome.create! impact: "negative", description: "Say hello to interplanetary wars.", future: future_8

# Future 9
future_9 = Future.create! title: "What if psychology was taught in elementary school?", description: "In this scenario, the education system includes psychology courses as a part of the core program for children.", photo_url: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2809&q=80', predicted_year: 2060, user: susan_calvin
Outcome.create! impact: "positive", description: "Future generations will have more empathy and a better understanding of the fundamentals of human mind.", future: future_9
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_9
Outcome.create! impact: "negative", description: "Children will become mentally insane while trying to learn concepts way ahead of their age.", future: future_9

# Future 10
future_10 = Future.create! title: "What if organic farming was mandatory?", description: "In this scenario, laws forbid entirely non-organic farming around the globe.", photo_url: 'https://images.unsplash.com/photo-1495107334309-fcf20504a5ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60', predicted_year: 2040, user: hari_seldon
Outcome.create! impact: "positive", description: "A very good decision for the environment, as well as for human health.", future: future_10
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_10
Outcome.create! impact: "negative", description: "Food will become very expensive, and poor people won't be able to afford it.", future: future_10

# Future 11
future_11 = Future.create! title: "What if we developed human-like robots?", description: "In this scenario, humanity starts a cohabitation with robots.", photo_url: 'https://images.unsplash.com/photo-1535378620166-273708d44e4c?ixlib=rb-1.2.1&auto=format&fit=crop&w=2066&q=80', predicted_year: 2070, user: susan_calvin
Outcome.create! impact: "positive", description: "These new companions will be pleasant, for sure.", future: future_11
Outcome.create! impact: "neutral", description: "Nothing will really change.", future: future_11
Outcome.create! impact: "negative", description: "Uprising of the machines is coming.", future: future_11

# Future 12
future_12 = Future.create! title: "What if we invested heavily in neuroscience to improve our intelligence?", description: "In this scenario, humanity does new discoveries about the humain brain. The brain functions subserving reasoning, planning, decision-making and learning are better understood, as well as the mechanisms of memory, language, emotion and perception. These new advances convince the governments to allocate even more funds to neuroscience laboratories. Conditions of human experimentation are also revised, in order for scientists to develop brain-computer interfaces and other neurotechnology tools. Also, neurobiologists identify some promising molecules that could improve some aspects of the brain neurochemistry.", photo_url: 'https://images.unsplash.com/photo-1494869042583-f6c911f04b4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80', predicted_year: 2040, user: hari_seldon
Outcome.create! impact: "positive", description: "A good opportunity to accelerate our evolution. The discoveries in neuroscience are used to improve our intelligence and empathy. Strong legal measures are taken to avoid any misuse.", future: future_12
Outcome.create! impact: "neutral", description: "Nothing will really change. Our brain appears to be already very well fitted for our needs. Every improvement on a certain function results in new weaknesses, so overall the new neurotechnologies do not present any advantages.", future: future_12
Outcome.create! impact: "negative", description: "Mind-controlling devices, here we come. This new understanding of the humain brain is used by authoritarian governments and greedy corporations to achieve mental control on a tremendous scale.", future: future_12
Comment.create! body: "This Future is very interesting. I wonder if we could also add some other outcomes, in order to get a more precise idea of this Future. For example, we could explore the possibility that these discoveries had a significant impact in other aspects of society, such as education, medicine or robotics.", future: future_12, user: susan_calvin
Comment.create! body: "Also, I think the positive outcomes could be more developed.", future: future_12, user: susan_calvin

# Upvotes
admin.upvoted_futures << future_1
admin.upvoted_futures << future_2
admin.upvoted_futures << future_3
admin.upvoted_futures << future_10
admin.upvoted_futures << future_11
admin.upvoted_futures << future_12
admin.upvoted_outcomes << future_1.outcomes.first
admin.upvoted_outcomes << future_2.outcomes.first
admin.upvoted_outcomes << future_10.outcomes.second
admin.upvoted_outcomes << future_11.outcomes.last
admin.upvoted_comments << future_12.comments.first
registered.upvoted_futures << future_1
registered.upvoted_futures << future_2
registered.upvoted_futures << future_3
registered.upvoted_outcomes << future_1.outcomes.first
registered.upvoted_outcomes << future_2.outcomes.first
hari_seldon.upvoted_outcomes << future_7.outcomes.first
hari_seldon.upvoted_outcomes << future_7.outcomes.second
hari_seldon.upvoted_outcomes << future_8.outcomes.first
hari_seldon.upvoted_outcomes << future_8.outcomes.second
susan_calvin.upvoted_outcomes << future_9.outcomes.second
susan_calvin.upvoted_outcomes << future_9.outcomes.last
susan_calvin.upvoted_outcomes << future_10.outcomes.second
susan_calvin.upvoted_outcomes << future_10.outcomes.last
