require './test/test_helper'
require './lib/library'
require './lib/author'
require './lib/book'

class LibraryTest < Minitest::Test

  def test_it_exists
    library = Library.new
    assert_instance_of Library, library
  end

  def test
    skip
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
  end


  def test_it_has_no_books_initially
    library = Library.new

    assert_equal [], library.books
    assert_equal 0, library.books.count
  end

  def test_it_can_add_book_to_collection
    library = Library.new

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")

    library.add_to_collection(jane_eyre)

    assert_instance_of Book, library.books.first
    assert_equal "Jane Eyre", library.books.first.title
    assert_equal "October 16, 1847", library.books.first.publication_date
    assert_equal "Charlotte", library.books.first.author_first_name
    assert_equal "Bronte", library.books.first.author_last_name

    assert_equal 1, library.books.count

  end

  def test_it_can_add_more_books_to_collection
    library = Library.new

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_books("To Kill a Mockingbird", "July 11, 1960")


    library.add_to_collection(jane_eyre)
    library.add_to_collection(mockingbird)

    assert library.books.all?{|book|book.is_a?(Book)}

    assert_equal 2, library.books.count
  end

  def test_it_can_tell_if_a_book_is_in_the_collection
    library = Library.new

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_books("To Kill a Mockingbird", "July 11, 1960")


    library.add_to_collection(jane_eyre)
    library.add_to_collection(mockingbird)

    assert library.include?("To Kill a Mockingbird")
    assert library.include?("Jane Eyre")

    refute library.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_can_sort_books_in_alphabetical_order_by_author_last_name
    library = Library.new

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Acre"})
    jane_eyre = charlotte_bronte.add_books("Jane Eyre", "October 16, 1847")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Bronte"})
    mockingbird = harper_lee.add_books("To Kill a Mockingbird", "July 11, 1960")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Ciars"})
    good_life = harper_lee.add_books("Life's good", "July 11, 1960")


    library.add_to_collection(jane_eyre)
    library.add_to_collection(mockingbird)
    library.add_to_collection(good_life)

    assert_equal "Jane Eyre",library.card_catalogue.first.title
    assert_equal "To Kill a Mockingbird",library.card_catalogue[1].title
    assert_equal "Life's good",library.card_catalogue.last.title
  end




end
