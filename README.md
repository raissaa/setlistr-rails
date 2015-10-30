## Setlistr

Companion app for cover bands. Easily manage your setlist, add media files to songs (lyrics, tabs, 
anything), create concerts and decide which songs to play there, suggest new songs and generate 
statistics to help the band stay dynamic.

### Versions
The app was developed using Ruby 2.1.1 and Rails 4.2.4.

### System dependencies
Dependencies are managed by Bundler. Among the great stuff used there's [rails-assets](https://github.com/rails-assets/rails-assets/), [bootstrap](twitter.github.com/bootstrap/), [zocial](https://github.com/smcllns/css-social-buttons) and [omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook).

This project was done so I could get a grasp in BDD in Rails. I've used [rspec-rails](https://github.com/rspec/rspec-rails), [factory-girl](https://github.com/thoughtbot/factory_girl), [rspec-autotest](https://github.com/rspec/rspec-autotest) and [capybara](https://github.com/jnicklas/capybara).

### Installation
1. Clone the repository. `git clone git@github.com:wormangel/setlistr-rails.git`
2. Install dependencies. `bundle install`
3. Configure a Facebook app (for login). Don't forget to allow the app root URL under OAuth authorized callbacks (for example, `http://localhost:3000/` for DEV environment)
4. Configure a Amazon S3 bucket (for file uploads store - if you don't want to use that the changes you'll need should be simple enough thanks to [carrierwave](https://github.com/carrierwaveuploader/carrierwave)). 
5. Create a `.env` file in the root of the app with the following variables:

        SETLISTR_FB_APP_ID="" # Self-explanatory
        SETLISTR_FB_APP_SECRET="" # Self-explanatory
        SETLISTR_FB_REDIRECT_URL="" # This should be the rails root path of the application
        SETLISTR_INVITE_SALT="" # Any string you want, to make the band invite codes unique to your setup
        SETLISTR_S3_BUCKET="" # Self-explanatory
        SETLISTR_S3_ACCESS_KEY="" # Self-explanatory
        SETLISTR_S3_SECRET_KEY="" # Self-explanatory
        SETLISTR_S3_REGION="" # Self-explanatory
        SETLISTR_S3_ENDPOINT="" # Self-explanatory - Make sure it matches the S3 region

6. Install Postgres if you don't have it (or change the db settings to use sqlite3)
7. Create the db `rake db:create`
8. Run migrations `rake db:migrate`
9. Start app `rails server`

### Tests
Expect tons of feature tests using rspec! Try running ```bundle exec rspec```
