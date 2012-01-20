CONSUMER_KEYS = {
  twitter: {
    key: '',
    secret: ''
  },
  facebook: {
    key: '',
    secret: ''
  },
  linkedin: {
    key: '',
    secret: ''
  }
}

require 'sinatra'
require 'omniauth'
require 'omniauth-twitter'
require 'omniauth-facebook'
require 'omniauth-linkedin'

use Rack::Session::Cookie
use OmniAuth::Strategies::Twitter, CONSUMER_KEYS[:twitter][:key], CONSUMER_KEYS[:twitter][:secret]
use OmniAuth::Strategies::Facebook, CONSUMER_KEYS[:facebook][:key], CONSUMER_KEYS[:facebook][:secret]
use OmniAuth::Strategies::LinkedIn, CONSUMER_KEYS[:linkedin][:key], CONSUMER_KEYS[:linkedin][:secret]

get '/' do
  CONSUMER_KEYS.map do |name, consumer|
    "<a href='/auth/#{name}'>#{name}</a>"
  end.join("\n")
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  auth.inspect
end
