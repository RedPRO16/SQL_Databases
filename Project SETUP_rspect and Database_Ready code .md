rvm get stable; rvm use ruby --latest --install --default; gem install bundler; bundle init; bundle add rspec; rspec --init; mkdir lib; mkdir recipes; bundle add pg; touch lib/database_connection.rb; touch spec/seeds.sql; touch app.rb;
printf "require 'pg'

# This class is a thin wrapper around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection
  # This method connects to PostgreSQL using the
  # PG gem. We connect to 127.0.0.1, and select
  # the database name given in argument.
  def self.connect(database_name)
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  end

  # This method executes an SQL query
  # on the database, providing some optional parameters
  # (you will learn a bit later about when to provide these parameters).
  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\\
      'the database was never opened. Did you make sure to call first the method '\\
      'DatabaseConnection.connect in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end" >> lib/database_connection.rb;

printf "require_relative 'lib/database_connection'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')
# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end" >> app.rb;
echo -e "require 'database_connection'

# Make sure this connects to your test database
# (its name should end with '_test')
DatabaseConnection.connect('social_network_test')\n$(cat spec/spec_helper.rb)" > spec/spec_helper.rb;
git init; git add .; git commit -m "setup";