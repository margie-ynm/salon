require('spec_helper.rb')

describe(Stylist) do

  describe('#initialize') do
    it('adds attributes to class') do
      @stylist = Stylist.new(:name => 'Gwen')
      expect(@stylist.name).to eq('Gwen')
    end
  end
end
