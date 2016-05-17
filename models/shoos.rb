require('pg')
require_relative('../db/sql_runner.rb')

class Shoo

  attr_reader :first_name, :last_name, :style, :size, :quantity

  def initialize(params)
    @first_name = params['first_name']
    @last_name = params['last_name']
    @style = params['style']
    @size = params['size'].to_i
    @quantity = params['quantity'].to_i
  end

  # currently this function concatinates two strings (each) with capital first letters, then it splits them on the capital (camelcased) letters
    def pretty_name
      name = @first_name.concat(@last_name).split /(?=[A-Z])/
      name = name[0] + " " + name[1]
      return name
      # return first_name + " " + last_name
    end

  def save()
    sql = "INSERT INTO shoos (first_name, last_name, style, size, quantity) VALUES ('#{@first_name}', '#{@last_name}', '#{@style}', #{@size} #{@quantity});"
    return SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM shoos;"
    return Shoo.map_items(sql)
  end

  def self.map_items(sql)
    shoos = SqlRunner.run( sql )
    result = shoos.map { |item| Shoo.new( item ) }
    return result
  end

  def self.map_item(sql)
    result = Shoo.map_items(sql)
    return result.first
  end

end
