# Cars API

## Instalation
1. Install ruby 2.2 or superior
2. Setup a mongodb database. For local development, I used the mongo docker image, on port 27017 without authentication. For more details, see https://hub.docker.com/_/mongo/
3. Clone repository and CD to it
4. Run <strong>gem install bundler</strong>
5. Run <strong>bundle install</strong>
6. To run the tests, execute 

  <strong>RAILS_ENV=test rake db:mongoid:create_indexes</strong> #Create the geo indexes on mongodb
  <strong>rspec</strong> # Run the unit tests with rspec

7. To run application on production mode, execute 

    <strong>RAILS_ENV=production rake db:mongoid:create_indexes</strong> #Create the geo indexes on mongodb production database
    <strong>RAILS_ENV=production rake db:seed</strong> #Load the database with the contents of data.json file
    <strong>RAILS_ENV=production unicorn -c config/unicorn.rb -p 3000</strong> # Run unicorn server on port 3000

8. Execute GET http://localhost:3000/cars?coordinates=51.5444204,-0.22707 and watch the results

## Optimization tips
1. To support a larger amount of requests, you can add more workers to unicorn (https://www.digitalocean.com/community/tutorials/how-to-optimize-unicorn-workers-in-a-ruby-on-rails-app)
2. MongoDB can be sharded and distributed to support a large amount of data. 
3. The application could have a load balancer to clusterize requests. I like to use nginx for that. 


Questions? E-mail me at ricardo.luis.baumann@gmail.com
