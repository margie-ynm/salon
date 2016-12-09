require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

set :public_folder, 'public'

puts DB rescue DB = PG.connect({:dbname => 'hair_salon'})

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

post('/stylists') do
  name = params.fetch('new-stylist-name')
  Stylist.new({:name => name}).save
  redirect('/stylists')
end
