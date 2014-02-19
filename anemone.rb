require 'anemone'

Anemone.crawl("http://www.bennyklotz.at/") do |anemone|
  anemone.on_every_page do |page|
      puts page.url
  end
end
