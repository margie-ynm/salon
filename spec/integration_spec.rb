require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper.rb')


describe("Stylist RESTful routes", {:type => :feature}) do
  before(:each) do
    @stylist = Stylist.new({:name => "Dan"})
    @stylist.save()
    @client = Client.new({:name => "Bobby"})
    @client.save()
  end
  describe('GET Stylists') do
    it('shows a list of all of the stylists') do
      visit("/stylists")
      expect(page).to have_content("Dan")
    end
  end
  describe("POST stylists") do
    it('allows a user to create a stylist') do
      visit('/stylists')
      fill_in('new-stylist-name', :with => 'Bob')
      click_button('Add stylist')
      visit('/stylists')
      expect(page).to have_content('Bob')
    end
  end
  describe("GET an individual stylist") do
    it('allows a user to visit a single page for a stylist') do
      visit("/stylists/#{@stylist.id}")
      expect(page).to have_content("Dan")
    end
  end
  describe("PATCH stylist") do
    it('allows a user to update a stylist') do
      visit("/stylists/#{@stylist.id}")
      fill_in('stylist-name', :with => "Danny Smith")
      click_button('Update Stylist')
      expect(page).to have_content("Danny Smith")
    end
  end
  describe("DELETE stylist") do
    it('allows a user to delete a stylist') do
      visit("/stylists/#{@stylist.id}")
      click_button('Delete stylist')
      expect(page).not_to have_content(@stylist.name)
      expect(Stylist.find(@stylist.id)).to eq(nil)
    end
  end
  describe('viewing one stylist to add a client', {:type => :feature}) do
    it('allows a user to view a particular and add a client for it') do
    visit("/stylists/#{@stylist.id}")
    fill_in('new-client-name', :with => "Bobby")
    click_button('Add client')
    expect(page).to have_content("Bobby")
    end
  end
  describe('GET Clients') do
    it('shows a list of all of the stylists') do
      visit("/clients")
      expect(page).to have_content("Bobby")
    end
  end
  describe("GET an individual client") do
    it('allows a user to visit a single page for a client') do
      visit("/clients/#{@client.id}")
      expect(page).to have_content("Bobby")
    end
  end
  describe("PATCH client") do
    it('allows a user to update a client') do
      visit("/clients/#{@client.id}")
      fill_in('client-name', :with => "Danny Smith")
      click_button('Update Client')
      expect(page).to have_content("Danny Smith")
    end
  end
  describe("DELETE client") do
    it('allows a user to delete a client') do
      visit("/clients/#{@client.id}")
      click_button('Delete client')
      expect(page).not_to have_content(@client.name)
      expect(Client.find(@client.id)).to eq(nil)
    end
  end

end
