# This file is used by Rack-based servers to start the application.


require ::File.expand_path('../config/environment',  __FILE__)

use(
  Rack::Static, {
    :urls => ["/favicon.ico", "/index.js", "/vanilla.css", "/morphdom-umd.js"],
    :root => 'public'
  }
)

app = run(Aod::Application)

trap 'TERM' do
  app.quit!
end
