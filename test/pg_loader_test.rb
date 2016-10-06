require 'test_helper'

class PgLoaderTest < Minitest::Test
  def setup
    ActiveRecord::Base.establish_connection :adapter => :postgresql
  end

  def test_that_it_has_a_version_number
    refute_nil ::PgLoader::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_postgres_adapter
    assert_raises PostgresOnlyError do
      ActiveRecord::Base.establish_connection :adapter => :nulldb
      PgLoader.new
    end
  end
end
