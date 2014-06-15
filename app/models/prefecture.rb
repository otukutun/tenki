class Prefecture < ActiveRecord::Base
  has_one :city

  def insert_prefectures
    html = fetch_prefectures
    html.encode('utf-8')
    prefectures = parse_html html
    save_prefectures(prefectures)
  end

  private

  def fetch_prefectures
    response = RestClient.get 'http://elze.tanosii.net/d/kenmei.htm'

    return nil unless response.code == 200
    return response
  end

  def parse_html(html)
    prefectures = Array.new
    doc = Nokogiri::HTML.parse(html, nil,"SHIFT-JIS")
    count = 1
    doc.xpath('//tr').each do |node|
      prefectures << { 'name' => remove_furigana(node.children.children[1].text) } unless count == 1
      count += 1
    end
    return prefectures
  end
  
  def remove_furigana(prefecture)
    /(^.+\()/ =~ prefecture
    return $1.delete("(")
  end

  def save_prefectures(prefectures)
    prefectures.each do |prefecture|
      p = Prefecture.new(prefecture)
      puts "Failed" unless p.save
    end
  end
end
