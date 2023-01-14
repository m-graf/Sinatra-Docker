require 'sinatra/base'
require "sinatra/reloader"
require './ntfyable'
require 'json'

class MyApp < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	before do
		request.body.rewind
		@request_payload = JSON.parse(request.body.read)
		@request_payload.store('topic', Ntfyable::TOPIC_NAME)
	end


	post '/' do
		Ntfyable.post('', body: @request_payload.to_json)
		'cool'
	end
end
