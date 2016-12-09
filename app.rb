require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

set :public_folder, 'public'

puts DB rescue DB = PG.connect({:dbname => 'hair_salon'})
