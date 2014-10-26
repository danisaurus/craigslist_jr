# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")
end


assets do
  serve '/js', from: 'public/js'
  serve '/bower_components', from: 'bower_components'

  js :modernizr, [
    '/bower_components/modernizr/modernizr.js',
  ]

  js :libs, [
    '/bower_components/jquery/dist/jquery.js',
    '/bower_components/foundation/js/foundation.js'
  ]

  js :application, [
    '/js/app.js'
  ]

  js_compression :jsmin

end


run Sinatra::Application