require('rspec')
require('client')
require('stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

Rspec.config do |config|
  config.after(:each) do
    DB.exec('DELETE FROM stylists *;')
    DB.exec('DELETE FROM clients *;')
  end
end
