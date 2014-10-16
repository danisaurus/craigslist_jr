require 'sinatra/base'
require 'sinatra/assetpack'

class App < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve 'css', :from => 'public'
    css :application, [
      '/css/jqueryui.css',
      '/css/normalize.css',
      '/css/foundation.sass'
      '/css/'

    ]



  end

end
