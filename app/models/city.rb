class City < ActiveRecord::Base
  belongs_to :prefecture, :dependent => :destroy

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
    prefecture_id = 1
    xml.xpath('//pref').each do |pref|
      pref.children.each do |city|
        if city.node_name == 'city'
          case pref['title']
          when '道北', '道東', '道南', '道央'
              prefecture_id = 1
          end
          cities <<  {'prefecture' => pref['title'], 'city' => city['title'], 'city_id' => city['id'], 'url'  => city['source'], 'prefecture_id' => prefecture_id}
        end
      end
      prefecture_id += 1
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
