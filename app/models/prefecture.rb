class Prefecture < ActiveRecord::Base

  def insert_prefectures
    html = fetch_prefectures
    html.encode('utf-8')
    prefectures = parse_html html
    #p prefectures
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
    #puts doc
    count = 1
    doc.xpath('//tr').each do |node|
      #children = node.children
      #p remove_furigana(node.children.children[1].text) unless count == 1
      prefectures << remove_furigana(node.children.children[1].text) unless count == 1
      count += 1
    end
    return prefectures
  end
  
  def remove_furigana(prefecture)
    /(^.+\()/ =~ prefecture
    return $1.delete("(")
  end

end
