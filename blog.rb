require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'data_mapper' # metagem, requires common plugins too.
require 'dm-core'
require 'haml'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Posty
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text
    property :created_at, DateTime
end

DataMapper.auto_upgrade!

get '/' do
	"Strona główna: Witaj blogowiczu!"
	haml :glowna
end

get '/add_post' do
	@add_post = "sth"
	haml :add_post
end

get '/add_post/action' do
	@action = "dodawanie posta"
	haml :action
end

get '/home' do
	@home = "strona główna"
	haml :home
end

get '/home/o_mnie' do
	@home = "O mnie"
	haml :o_mnie
end
