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
      stylist = Stylist.new(:name => 'Gwen')
      expect(@stylist).to eq(stylist)
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
end
