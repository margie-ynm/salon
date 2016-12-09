require('spec_helper.rb')

describe(Stylist) do
  before(:each) do
  @stylist = Stylist.new(:name => 'Gwen')
  @stylist2 = Stylist.new(:name => 'Bob')
  end

  describe('#initialize') do
    it('adds attributes to class') do
      # @stylist = Stylist.new(:name => 'Gwen')
      expect(@stylist.name).to eq('Gwen')
    end
  end
  describe('.all') do
    it('will contain no stylists to begin with') do
      expect(Stylist.all()).to eq([])
    end
  end
  describe('.==') do
    it('two instances with the same name and id will be equal') do
      # stylist = Stylist.new(:name => 'Gwen')

      @stylist.save
      expect(Stylist.find(@stylist.id)).to eq(@stylist)
    end
  end
  describe('#save') do
    it('will save a stylist to a database') do
      @stylist.save()
      expect(Stylist.all).to eq([@stylist])
    end
    it('will add an id to the stylist') do
      @stylist.save()
      expect(@stylist.id.class).to eq(Fixnum)
    end
  end
  describe(".find") do
    it('lets you find a stylist by its id') do
      @stylist.save()
      @stylist2.save()
      expect(Stylist.find(@stylist.id)).to eq(@stylist)
    end
  end
  describe('#update') do
    it('lets you update a city in the database') do
      @stylist.save()
      @stylist.update({:name => 'Shawna'})
      expect(@stylist.name).to eq('Shawna')
    end
  end
  describe('#delete') do
    it('lets you delete a stylist from database') do
      @stylist.save()
      expect(Stylist.all).to eq([@stylist])
      @stylist.delete()
    end
  end
  describe('#clients') do
    it('returns an array of clients for that stylist') do
      @stylist.save()
      client = Client.new({:name => 'Bobby'})
      client.save()
      client2 = Client.new({:name => 'Laura'})
      client2.save()
      @stylist.add_client(client)
      @stylist.add_client(client2)
      expect(@stylist.clients()).to eq(([client, client2]))
    end
  end
  describe('add_client') do
    it('adds the stylist id to the client') do
      @stylist.save
      client = Client.new({:name => 'Bobby'})
      client.save()
      client2 = Client.new({:name => 'Laura'})
      client2.save()
      @stylist.add_client(client)
      @stylist.add_client(client2)
      expect(@stylist.clients()).to eq(([client, client2]))
    end
  end
end
