require('spec_helper.rb')

describe(Stylist) do
  before(:each) do
  @stylist = Stylist.new(:name => 'Gwen')
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
  end
end
