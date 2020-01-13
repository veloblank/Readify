class AudibleScraper < ApplicationRecord
  require 'open-uri'

  def scrape_audible_books
    doc = Nokogiri::HTML(open("https://www.audible.com/search?keywords=&title="+"#{self.searchTerm.split(' ').join('+')}"))
    bookHTML = doc.css(".productListItem")
    books = bookHTML.map do |book| 
      title = book.css(".bc-list-item")[0].text.gsub(/\s+/, " ").split(':').join('').strip
      author = book.css(".bc-list-item")[1].text.gsub(/\s+/, " ").split(':').join('').strip   
      img_src = book.css("img.bc-image-inset-border").attr('src').value
      length_text = book.css(".bc-list-item")[3].text.gsub(/\s+/, " ").split(':').join('').strip
      length_text_sanitized = length_text.split - %w[Length hr hrs and mins]
      length_text_to_i = length_text_sanitized.map(&:to_i)
      if (length_text_to_i.size === 1)
        length_text_to_i.unshift(0)
      end
      hour = length_text_to_i[0] * 60
      #hour = length_text_to_i[0]
      mins = length_text_to_i[1]
      #mins = (length_text_to_i[1].to_f/60.to_f).round(1)
      length_to_read = hour + mins
      
      book_hash = {
        title: title,
        author: author,
        img_src: img_src,
        length_text_string: length_text,
        length_text_mins: length_to_read,
        search_id: Search.find_by(text: self.searchTerm).id
      }
      Book.create(book_hash)
    end
    return books
  end
end