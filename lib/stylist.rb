class Stylist

attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    DB.exec("SELECT * FROM stylists;").map do |stylist|
      Stylist.new({:name => stylist.fetch('name'), :id => stylist.fetch('id').to_i})
    end
  end
  
  define_method(:==) do |other|
    self.name().==(other.name) && self.id.==(other.id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

end
