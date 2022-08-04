
require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'books_store_test' })
    connection.exec(seed_sql)
  end
  describe BookRepository do
    before(:each) do
      reset_books_table
    end
    # (your tests will go here).
  end
  it "returns all" do
        repo = BookRepository.new
        books = repo.all

        expect(books[1].id).do eq 1
        expect(books[1].title).do eq 'David'
        expect(books[1].author).do eq 'April 2022'
        expect(books[2].id).do eq 2
        expect(books[2].title).do eq 'Anna'
        expect(books[2].author).do eq 'May 2022'
  end
end