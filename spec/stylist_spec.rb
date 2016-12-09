require('spec_helper')

describe(Stylist) do
  before(:each) do
  end

  describe('#initialize') do
    it('adds attributes to class') do
      @stylist = Style.new(:name => 'Gwen')
      expect(@stylist.name).to eq('Gwen')
    end
  end
end
