require 'book_repository'

def reset_books_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
  connection.exec(seed_sql)
end

RSpec.describe BookRepository do
  before(:each) do
    reset_books_table
  end

  it "return list of database" do
    repo = BookRepository.new
    books = repo.all
    expect(books.length).to eq 2
    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq 'David'
    expect(books[0].author_name).to eq 'April 2022'
    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq 'Anna'
    expect(books[1].author_name).to eq 'May 2022'
  end
end
