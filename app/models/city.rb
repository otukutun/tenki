class City < ActiveRecord::Base
  
  def insert_cities()
    xml = get_livedoor_city_xml
    cities = parse_xml xml
    save_city cities
  end

  private

  def get_livedoor_city_xml()
    response = RestClient.get 'http://weather.livedoor.com/forecast/rss/primary_area.xml'
    unless response.code == 200
      puts "Faiiled.Bad request."
      return
    end
    return response
  end

  def parse_xml(response)
    cities = Array.new
    xml = Nokogiri::XML(response)
    xml.xpath('//pref').each do |pref|
      pref.children.each do |city|
        if city.node_name == 'city'
          cities <<  {'prefecture' => pref['title'], 'city' => city['title'], 'city_id' => city['id'], 'url'  => city['source']}
        end
      end
    end
    return cities
  end

  def save_city(cities)
    cities.each do |city|
      c = City.new(city)
      puts "Failed" unless c.save
    end
  end

end
