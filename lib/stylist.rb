class Stylist

attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    DB.exec("SELECT * FROM stylists").map do |stylist|
      Stylist.new({:name => ('name'), :id => ('id').to_i})
    end
  end
  define_method(:==) do |other|
    self.name().==(other.name) && self.id.==(other.id)
  end
end
