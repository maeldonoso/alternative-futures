# ALTERNATIVES FUTURES

## About this application

### General description

The objective of this application is to serve as a platform to exchange ideas about the evolution of humanity. Users can discover the Futures created by others, or write their own scenarios. Each Future should include a title, a general description, a predicted year of realization, as well as several alternative Outcomes. These Outcomes can be either positive, neutral or negative.

For example, the Future 'What if a government or a company succeeded in developing a strong AI?' might lead to three possibilities: an era of peace and prosperity for all humanity (positive Outcome), barely any change (neutral Outcome), or a rebellion of the machines followed by a dark age (negative Outcome). Of course, not all scenarios need to be so extreme!

Users need to be registered in order to create a Future with its Outcomes, or comment on existing Futures. Registered Users can also upvote Futures, Outcomes and Comments. Every visitor, whether or not he/she is registered on the application, may also select some Futures of interest and display them in the Chronology, in order to see them in a consistent timeline.

### Audience

By providing different Outcomes, and encouraging the discussion about them, this application should allow a nuanced and constructive vision of the evolution of our societies. Therefore, it will be of particular interest for think tanks, NGOs, political parties, science-fiction writers and scenarists, and anybody interested in discussing alternative futures.

### Author

This application was created by Maël Donoso using Ruby on Rails, initially as a project for the École Polytechnique Fédérale de Lausanne.


## Implemented technologies

### Ruby version
* ruby '2.6.5'

### Gems for all environments
* gem 'rails', '5.1.7'
* gem 'puma', '3.7'
* gem 'sass-rails', '5.0'
* gem 'uglifier', '>= 1.3.0'
* gem 'coffee-rails', '4.2'
* gem 'turbolinks', '5'
* gem 'jbuilder', '2.5'
* gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
* gem 'bcrypt', '3.1.7'
* gem 'kaminari'
* gem 'inline_svg'
* gem 'chartkick'
* gem 'unsplash'
* gem 'figaro'
* gem 'carrierwave', '1.1.0'
* gem 'fog-aws'

### Gems for development and test environments only
* gem 'sqlite3'
* gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
* gem 'capybara', '>= 2.15'
* gem 'selenium-webdriver'

### Gems for development environment only
* gem 'web-console', '>= 3.3.0'
* gem 'listen', '>= 3.0.5', '< 3.2'
* gem 'spring'
* gem 'spring-watcher-listen', '2.0.0'

### Gem for production environment only
* gem 'pg'

### Third party APIs
* Unsplash
