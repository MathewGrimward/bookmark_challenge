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
        #p ENV
        @bookmarks = Bookmark.all
        erb :'bookmarks/index'
    end

    get '/bookmark/new' do
        erb :"bookmarks/new"
    end

    post '/bookmarks' do
        url = params['url']
        connection = PG.connect(dbname: 'bookmark_manager_test')
        connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
        redirect '/bookmark'
    end

    run! if app_file == $0
end
