require 'bundler'
Bundler.require

def save_as_JSON
  json = File.read('email.json')
  obj = JSON.parse(json)

  return obj
end

.unshift File.expand_path("./lib", __FILE__)
require 'user' #plus besoin de préciser le path exact
