MY_APP = YAML.load(File.read("#{Rails.root}/config/twitter.yml"))[Rails.env]
