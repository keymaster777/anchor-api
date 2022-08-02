require 'sinatra/base'
require "sinatra/reloader"
require "sinatra/json"

class AnchorApi < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/ping' do
    json status: 200, message: 'pong'
  end

  get '/' do
    json status: 200, message: 'Hello world.'
  end

  post '/multiply5' do
    # Ensures that body is json, and that it is correctly formatted, to be more concise I could check the content type first.
    begin
      request_payload = JSON.parse(request.body.read)
    rescue
      return json status: 400, message: "Bad Request."
    end 

    if ( request_payload.key?("value") && is_numeric?(request_payload["value"]))
      json status: 200, message: (request_payload["value"].to_f * 5) #Casting value to float so that result isnt unintentionally floored
    else
      json status: 400, message: "Invalid value given."
    end
  end

  private
  

  def is_numeric? (val)
    val.to_s == "#{val.to_f}" || val.to_s == "#{val.to_i}" #Casting val to str in comparison so that value can be given as number or a string containing (only) a valid number
  end
end
