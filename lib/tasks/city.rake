namespace :db do
  desc "Load database.yml"
  task :configuration => :environment do
    @config = YAML.load_file('config/database.yml')[DATABASE_ENV]
  end

  desc "Connect the database"
  task :configure_connect => :configuration do
    ActiveRecord::Base.establish_connection @config
  end

  desc "Insert Cities information"
  task :insert_cities => :environment do
    city = City.new
    city.insert_cities
  end

  desc "Insert Prefectures information"
  task :insert_prefectures => :environment do
    p = Prefecture.new
    p.insert_prefectures
  end

  desc "Insert Prefectures and Cities information"
  task :insert_prefectures_and_cities => :environment do
    p = Prefecture.new
    p.insert_prefectures
    city = City.new
    city.insert_cities
  end

end
