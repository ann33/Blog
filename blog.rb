require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'data_mapper' # metagem, requires common plugins too.
require 'dm-core'
require 'haml'
require 'pry'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text
    property :created_at, DateTime
end

set :haml, :format => :html5, :layout_engine => :haml, :layout => :layout

DataMapper.auto_upgrade!

Post.auto_upgrade!

get '/add_post' do
	haml :add_post
end

get '/elo/:p1/:p2' do
	params[:p2]	
end

post '/save_post' do
	Post.create(:title => params[:tytul], :body => params[:notka])
	redirect "/wszystkie_posty"
end

get '/wszystkie_posty' do
	@posts = Post.all
	haml :wszystkie_posty
end

get '/' do
	@home = "strona główna"
	haml :home
end

get '/home/o_mnie' do
	@home = "O mnie"
	haml :o_mnie
end

get '/jedenpost' do
  @jedenpost = "Wyświetl jeden z postów"
  @posts = Post.new
  haml :jedenpost
end