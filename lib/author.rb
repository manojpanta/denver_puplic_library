
require_relative 'book'
class Author
  attr_reader :data,
              :first_name,
              :last_name,
              :books

  def initialize(data)
    @data = data
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def add_books(title, publication_date)
    data = {:author_first_name => first_name,
            :author_last_name => last_name,
            :title => title,
            :publication_date => publication_date}
    @books << Book.new(data)
    Book.new(data)
  end

end
