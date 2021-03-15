#

module Aod
  class Application < Sinatra::Application
    class Error < StandardError; end

    get '/logout' do
      cookies.clear
      redirect '/'
    end

    post '/' do
      name = params["name"]
      cookies["name"] = name
      redirect '/'
    end

    get '/' do
      puts params.inspect

      inner_params = params.dup
      inner_cookies = cookies.dup

      full_render = !inner_params['p']

      mab = Markaby::Builder.new

      if full_render
        mab.html5("lang" => "en") do
          mab.head do
            mab.title("aod")
            mab.script("src" => "morphdom-umd.js") {}
            mab.link("href" => "fonts.css?#{$APPLICATION_UUID}", "rel" => "stylesheet", "type" => "text/css")
            mab.link("href" => "vanilla.css?#{$APPLICATION_UUID}", "rel" => "stylesheet", "type" => "text/css")
            mab.script("id" => "js-#{$APPLICATION_UUID}", "src" => "index.js?#{$APPLICATION_UUID}") {}
          end

          mab.body do
            mab.div("id" => "wkndr") do
              mab.div do
                Aod::Views.factory(mab, inner_params, inner_cookies)

                mab.a("href" => "/logout") {
                  mab.em("id" => "version") { $APPLICATION_UUID }
                }
              end
            end
          end
        end
      else
        mab.div do
          Aod::Views.factory(mab, inner_params, inner_cookies)

          mab.link("href" => "fonts.css?#{$APPLICATION_UUID}", "rel" => "stylesheet", "type" => "text/css")
          mab.link("href" => "vanilla.css?#{$APPLICATION_UUID}", "rel" => "stylesheet", "type" => "text/css")
          mab.script("id" => "js-#{$APPLICATION_UUID}", "src" => "index.js?#{$APPLICATION_UUID}") {}
          mab.a("href" => "/logout") {
            mab.em("id" => "version") { $APPLICATION_UUID }
          }
        end
      end

      mab.to_s
    end
  end
end
