namespace :db do
  desc "Load database.yml"
  task :configuration => :environment do
    @config = YAML.load_file('config/database.yml')[DATABASE_ENV]
  end

  desc "Connect the database"
  task :configure_connect => :configuration do
    ActiveRecord::Base.establish_connection @config
  end

  desc "Insert Cities infomation"
  task :insert => :environment do
    city = City.new
    city.insert_cities
  end
end
