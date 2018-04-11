class Library

  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.find do |book|
      if book.title == title
        true
      else
        false
      end
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end

  end

end
