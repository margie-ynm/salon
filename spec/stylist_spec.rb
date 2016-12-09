require('spec_helper.rb')

describe(Stylist) do
  before(:each) do
  @gwen = Stylist.new(:name => 'Gwen')
  @bob = Stylist.new(:name => 'Bob')
  end

  describe('#initialize') do
    it('adds attributes to class') do
      # @gwen = Stylist.new(:name => 'Gwen')
      expect(@gwen.name).to eq('Gwen')
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
      expect(@gwen).to eq(stylist)
    end
  end
  describe('#save') do
    it('will save a stylist to a database') do
      @gwen.save()
      expect(Stylist.all).to eq([@gwen])
    end
    it('will add an id to the stylist') do
      @gwen.save()
      expect(@gwen.id.class).to eq(Fixnum)
    end
  end
  describe(".find") do
    it('lets you find a stylist by its id') do
      @gwen.save()
      @bob.save()
      expect(Stylist.find(@gwen.id)).to eq(@gwen)
    end
  end
  describe('#update') do
    it('lets you update a city in the database') do
      @gwen.save()
      @gwen.update({:name => 'Shawna'})
      expect(@gwen.name).to eq('Shawna')
    end
  end
end
