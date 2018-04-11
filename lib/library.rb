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

  def find_by_author(author)
    new_hash = {}
    @books.each do |book|
      if book.author_first_name + " " + book.author_last_name == author
        new_hash[book.title] = book
      end
    end
    new_hash
  end

end
