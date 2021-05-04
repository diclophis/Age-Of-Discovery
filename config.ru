# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

public_urls = 
  ["/favicon.ico", "/index.js", "/fonts.css", "/vanilla.css", "/morphdom-umd.js"] +
  Dir.glob("public/images/*").collect { |img| "/images/" + File.basename(img) } +
  Dir.glob("public/fonts/*").collect { |font| "/fonts/" + File.basename(font) }

use(
  Rack::Static, {
    :urls => public_urls,
    :root => 'public'
  }
)

#@app = nil
#
#trap 'SIGTERM' do
#  @app.quit! if @app
#end
#
#trap 'SIGINT' do
#  @app.quit! if @app
#end

@app = run(Aod::Application)
