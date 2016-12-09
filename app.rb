require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

set :public_folder, 'public'

puts DB rescue DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  redirect "/stylists"
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

post('/stylists') do
  name = params.fetch('new-stylist-name')
  Stylist.new({:name => name}).save
  redirect('/stylists')
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_detail)
end

patch('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.update({:name => params.fetch('stylist-name')})
  redirect "/stylists/#{params.fetch('id').to_i}"
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.delete()
  redirect "/stylists"
end

post('/stylists/:id') do
  name = params.fetch('new-client-name')
  stylist_id = params.fetch('stylist_id').to_i
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  @stylist.add_client(@client)
  erb(:stylist_detail)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i)
  erb(:client_detail)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i)
  @client.update({:name => params.fetch('client-name')})
  redirect "/clients/#{params.fetch('id').to_i}"
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i)
  @client.delete()
  redirect "/stylists"
end

get('/clients') do
  @clients = Client.all()
  erb(:client_list)
end
