# ALTERNATIVES FUTURES

## Public URL

https://powerful-bayou-33044.herokuapp.com/


## About this application

### General description

The objective of this application is to serve as a platform to exchange ideas about the evolution of humanity. Users can discover the Futures created by others, or write their own scenarios. Each Future should include a title, a general description, a predicted year of realization, as well as several alternative Outcomes. These Outcomes can be either positive, neutral or negative.

For example, the Future 'What if a government or a company succeeded in developing a strong AI?' might lead to three possibilities: an era of peace and prosperity for all humanity (positive Outcome), barely any change (neutral Outcome), or a rebellion of the machines followed by a dark age (negative Outcome). Of course, not all scenarios need to be so extreme!

Users need to be registered in order to create a Future with its Outcomes, or comment on existing Futures. Registered Users can also upvote Futures, Outcomes and Comments. Every visitor, whether or not he/she is registered on the application, may also select some Futures of interest and display them in the Chronology, in order to see them in a consistent timeline.

### Audience

By providing different Outcomes, and encouraging the discussion about them, this application should allow a nuanced and constructive vision of the evolution of our societies. Therefore, it will be of particular interest for think tanks, NGOs, political parties, science-fiction writers and scenarists, and anybody interested in discussing alternative futures.

### Author

This application was created by Maël Donoso using Ruby on Rails, as a project for the École Polytechnique Fédérale de Lausanne.


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
* Amazon Web Services: Amazon Simple Storage Service (S3)

### Deployment platform
Heroku (https://www.heroku.com/)


## Changes between the Proposal and the Application

### Elements removed

* No use of the CSS Bootstrap. This was not necessary, I used only custom CSS.

* On the Show Future view, no buttons to display selectively the positive, neutral and/or negative Outcome(s) of a Future. Eventually, I found this feature unnecessary, and even counterproductive. Using SVG spheres (see below) of different colors gives the Show Future view a consistent display, which would be lost if some Outcomes were not shown. Also, we do not expect too many Outcomes for each Future, so it does not make a lot of sense to propose a mechanism to hide them. Instead, in order to keep the Show Future view relatively short, I implemented pagination on Comments. | Note: I used JavaScript binding events elsewhere in the Application, for example for the upvotes buttons, or in the Chronology view.

* On the Chronology view, no use of a JSON file containing a list of standard, placeholder Futures. Instead, I implemented a more complex system (see below), allowing a User to select between different types of Chronologies. | Note: I used the JSON format elsewhere in the Application, for storing Future characteristics in local storage before displaying them in the Chronology view.

### Elements slightly modified

* On the Homepage view, 12 recent Futures are displayed instead of 3. The visual rendering seemed better this way.

* On the Chronology view, 20 Futures instead of 10 can be selected and displayed.

* Creation of the New Outcome and Edit Outcome views, which are accessible from the Edit Future view. Isolating Outcomes creation and update in specific views seemed a good solution, in particular because the Edit Future view was already quite complex.

* On the Show Future view, counters associated with upvotes buttons do not start with a zero displayed in grey. Instead, they display directly the adequate color (Future/Comment: blue, positive Outcome: green, neutral Outcome: yellow, negative Outcome: red). The visual rendering seemed better this way, since I tried to have a consistent color scheme throughout the Application. | Note: I added a success message when an upvote button is clicked, as well as an asynchronous modification of the counter. Success messages are also displayed in the adequate color.

### Elements added

* Addition of two other gems: *inline_svg* to display SVG icons and *chartkick* to display graphs.

* Addition of graphs on the Homepage view, to display some data about the Application.

* Addition of an About view, to display some information about the Application as well as a Statistics section.

* Addition of a specific layout for the Homepage view.

* Addition of a twinkling sphere on the Homepage view with a JavaScript recurring event. When the mouse passes over, the sphere displays all the important colors of the Application color scheme (blue, green, yellow, red).

* Addition of 3 join tables, to store information about upvotes on Futures, Outcomes and Comments.

* Addition of a Future Score for each Future. This score is based on the number of times Users have upvoted the positive, neutral and negative Outcomes associated with this Future. The Future Scores are used on the Statistics section of the About view to display several graphs.

* Possibility to upvote Futures, and not only Outcomes and Comments.

* Possibility for Admin Users and Future Owners to delete Comments associated to a Future.

* Possibility for a User to delete his/her own account.

* Possibility to add any number of Outcomes to a Future, and not only 3. Nevertheless, there are still only three possible impacts: positive, neutral or negative.

* Possibility to create a Future without specifying a predicted year. In this case, the Chronology will display a question mark instead of the year.

* When a Future is deleted, all its Outcomes and Comments are deleted too. When a User is deleted, all his/her Futures are deleted too, including the Outcomes and the Comments of these Futures. The logic behind this system is that Futures belong to their creator, who should be able to remove them entirely if he/she thinks that they are no longer relevant. Also, when a User is deleted, all the Comments he/she has written on other Futures are deleted too.

* The Chronology view allows the User to display four types of Chronologies. First, *My Chronology*: this Chronology is assembled by the User, by selecting Futures of interest and clicking the Add to Chronology button on the Show Future view. Second, *My Futures*: this Chronology is automatically assembled with a maximum of 12 Futures created by the User. Third, *Popular Futures*: this Chronology is automatically assembled with the 12 most upvoted Futures. Fourth, *Recent Futures*: this Chronology is automatically assembled with the 12 most recent Futures. In all cases, the Futures are organized in reverse chronological order, and the Futures without a predicted year display a question mark instead. Users can use buttons to navigate from one Chronology to another.


## Difficulties encountered

* I found the *chronology* section of the Home Controller difficult to code. The hardest part was to select Futures according to the number of times they received upvotes from Users. I suppose there must be more efficient ways to obtain the same result, but my knowledge of Ruby and ActiveRecords is still limited.

* When I generated the models, I started by creating the Future model, with a reference to a User model, even if the User model was yet to be created. That worked fine on my computer in the development, test and production environments, but I encountered an error during the deployment to Heroku. Eventually, I simply changed the filename of the User model migration file, in order for this migration to appear first in the list, and run db:setup. Once the migration files were organized in a consistent way, where all the models are created before being referenced, the deployment to Heroku worked. Next time, I will make sure to create the models in a logical order from the beginning.

* I was able to change the color of the SVG icons, but strangely not their size, using *inline_svg*. So I created three different versions of the same SVG file in the asset pipeline, one for each size.

* I needed to add a *script* element at the bottom of the Chronology and Show Future HTML files, otherwise my JavaScript code would not find the DOM elements.
