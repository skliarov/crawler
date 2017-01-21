## README - Ruby on Rails web crawler demo

### Ruby and Rails versions:

* Ruby version 2.3.1
* Rails version 5.0.1

### Initial setup

* Clone project `git clone git@github.com:skliarov/crawler.git`
* To prevent security issues `config/database.yml` and `config/secrets.yml` are not included into git repository, so you have to create them.
* Create `config/database.yml` file, it should look like this:
```
development:
  adapter: sqlite3
  pool: 5
  timeout: 5000
  database: db/development.sqlite3
  
test:
  adapter: sqlite3
  pool: 5
  timeout: 5000
  database: db/test.sqlite3
```
* Create `config/secrets.yml` file, generate secrets by executing `rake secret` in Terminal:
```
development:
  secret_key_base: YOUR_DEVELOPMENT_SECRET_GOES_HERE
  
test:
  secret_key_base: YOUR_TEST_SECRET_GOES_HERE
```
* Execute `bundle install` in Terminal to install all required RubyGems.
* Perform migrations by executing `rake db:migrate` in Terminal.
* Start server `rails server` and visit [http://localhost:3000/api/v1/web_pages](http://localhost:3000/api/v1/web_pages).

### To run tests execute this command in Terminal

```
rspec -f doc --color
```
