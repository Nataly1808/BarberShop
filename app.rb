require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do
	@db = SQlite3::Database.new 'barbershop.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS
		 "Users" 
	    (
	    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
	    "Username" TEXT,
	    "Phone" TEXT,
	    "datestamp" TEXT,
	    "barber" TEXT,
	    "color" TEXT 
	    )'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do

	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

hh = {:username => 'Введите имя', :phone => 'Введите телефон', :datetime => 'Введите дату и время'} 

@error = hh.select {|key,_| params[key] == ""}.values.join(", ")
if @error != ''
	return erb :visit
end
#db = get_db
#get_db.execute 'insert into Users (username, phone, datestamp, barber, color) values (?, ?, ?, ?, ?)', [@username, @phone, @datetime, @barber, @color]


	erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end
#def get_db
	#return SQlite3::Database.new 'barbershop.db'
#end

