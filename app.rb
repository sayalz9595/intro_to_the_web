require 'sinatra'

set :session_secret, 'super secret'
get '/' do
  "Hello World"
end
get '/secret' do
  'this is a secret'
end
get '/dogs' do
  'lab'
end
