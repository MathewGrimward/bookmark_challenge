require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        erb :index
        redirect '/bookmark'
    end

    get '/bookmark' do
        @bookmarks = Bookmark.all
        erb :'bookmarks/index'
    end

    run! if app_file == $0
end
