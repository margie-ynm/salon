require('spec_helper.rb')

describe(Client) do
  before(:each) do
  @client = Client.new(:name => 'Tammy')
  @client2 = Client.new(:name => 'John')
  end

  describe('#initialize') do
    it('adds attributes to class') do
      # @client = Client.new(:name => 'Tammy')
      expect(@client.name).to eq('Tammy')
      expect(@client.stylist_id).to eq(nil)
    end
  end
  describe('.all') do
    it('will contain no clients to begin with') do
      expect(Client.all()).to eq([])
    end
  end
  describe('.==') do
    it('two instances with the same name and id will be equal') do
      client = Client.new(:name => 'Tammy')
      expect(@client).to eq(client)
    end
  end
  describe('#save') do
    it('will save a client to a database') do
      @client.save()
      expect(Client.all).to eq([@client])
    end
    it('will add an id to the client') do
      @client.save()
      expect(@client.id.class).to eq(Fixnum)
    end
  end
  describe(".find") do
    it('lets you find a client by its id') do
      @client.save()
      @client2.save()
      expect(Client.find(@client.id)).to eq(@client)
    end
  end
  describe('#update') do
    it('lets you update a city in the database') do
      @client.save()
      @client.update({:name => 'Shawna'})
      expect(@client.name).to eq('Shawna')
    end
  end
  describe('#delete') do
    it('lets you delete a client from database') do
      @client.save()
      expect(Client.all).to eq([@client])
      @client.delete()
    end
  end
end
