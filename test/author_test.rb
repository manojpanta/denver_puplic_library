require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def test_it_exists
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_instance_of Author, author
  end

  def test_it_can_take_an_argument
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    result = {first_name: "Charlotte", last_name: "Bronte"}
    assert_equal result, author.data
  end

  def test_it_can_access_data
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_equal "Charlotte", author.first_name
    assert_equal "Bronte", author.last_name
  end

  def test_author_has_no_books_initially
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], author.books
    assert_equal 0, author.books.count
  end

  def test_author_can_add_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")

    assert_equal 1,charlotte_bronte.books.count
    assert_instance_of Book, charlotte_bronte.books.first

    assert_equal "Charlotte", charlotte_bronte.books.first.author_first_name
    assert_equal "Bronte", charlotte_bronte.books.first.author_last_name
    assert_equal "Jane Eyre", charlotte_bronte.books.first.title
    assert_equal "October 16, 1847", charlotte_bronte.books.first.publication_date
  end

  def test_it_can_add_multiple_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")
    charlotte_bronte.add_books("Villette", "1853")

    assert charlotte_bronte.books.all?{|book|book.is_a?(Book)}

    assert_equal 2, charlotte_bronte.books.count
  end
end
