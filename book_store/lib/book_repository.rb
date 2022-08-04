require_relative 'book'



class BookRepository
  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT * FROM books'
      output = []
      results_set = DatabaseConnection.exec_params(sql, [])
      results_set.each { |records|
      book = Book.new
      book.title =records['title']
      book.id = records['id']
      book.author_name = records['author_name']
      output << book
      }
      return output
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM books;
    # Returns an array of book objects.
  end


end
