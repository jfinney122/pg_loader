require "pg_loader/version"

class PgLoader
  class PostgresOnlyError < StandardError; end
  attr_reader :model, :table_name, :io

  def initialize(model_or_table_name, io)
    raise PostgresOnlyError unless connection.class.name == 'PG::Connection'
    @model      = model_or_table_name if model? model_or_table_name
    @table_name = target_table model_or_table_name
    @io         = io
  end

  def load_data(columns, opts)
    col_str = columns.nil? ? ' ' : " (#{columns.join(',')}) "
    connection.copy_data "COPY #{table_name}#{col_str}FROM STDIN #{opts}" do
      io.each_line do |line|
        connection.put_copy_data line
      end
    end
  end

  private

  def model?(model_name)
    model_name.respond_to? 'table_name'
  end

  def target_table(model_or_table)
    model?(model_or_table) ? model_or_table.table_name : model_or_table
  end

  def connection
    ActiveRecord::Base.connection.raw_connection
  end
end
