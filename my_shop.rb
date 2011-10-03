require 'sinatra/base'
require 'dm-validations'
require 'dm-timestamps'
require 'dm-migrations'
require 'haml'
require 'less'

#
# DataMapper
#
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/shop.db")

module RubyTuesday
  include DataMapper

  class MyShopApp < Sinatra::Base
    set :haml, :format => :html5
    set :static => true
    set :public, File.dirname(__FILE__) + '/public'

    get '/' do

    end

    get %r{/([\w]+)\.css} do
      less :"less/#{params[:captures].first}"
    end
  end

end