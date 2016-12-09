require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper.rb')


describe("Stylist RESTful routes", {:type => :feature}) do
  before(:each) do
    @stylist = Stylist.new({:name => "Dan"})
    @stylist.save()
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


end
