class Client
  attr_reader(:name, :id, :stylist_id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id, nil)
      @stylist_id = attributes.fetch(:stylist_id, nil)
    end

    define_singleton_method(:all) do
      DB.exec("SELECT * FROM clients;").map do |client|
        Client.new({:name => client.fetch('name'), :id => client.fetch('id').to_i, :stylist_id => ('stylist_id')})
      end
    end

    define_method(:==) do |other|
      self.name().==(other.name) && self.id.==(other.id)
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first.fetch('id').to_i
    end

    define_singleton_method(:find) do |id|
      matches = Client.all.keep_if do |client|
        client.id == id
      end
      matches.first
    end

    define_method(:update) do |attributes|
      @name = attributes.fetch(:name)
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    end

    define_method(:delete) do
      DB.exec("DELETE FROM clients WHERE id = #{@id};")
    end

end
