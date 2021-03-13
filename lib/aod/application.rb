#

module Aod
  class Application < Sinatra::Application

    class Error < StandardError; end

    get '/' do
      "bar"
    end
  end
end
