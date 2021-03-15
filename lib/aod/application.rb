#

module Aod
  class Application < Sinatra::Application
    class Error < StandardError; end

    get '/' do
      full_render = !params['p']

      mabb = Markaby::Builder.new

      dashboard_partial_proc = Proc.new { |mab, sp, sc|
        mab.div do
          mab.a(:href => "?") do
            mab.h1 "aod"
          end

          mab.p Time.now

          mab.ul do
            mab.li "first"

            (rand * 10).to_i.times.to_a.shuffle.each { |i|
              mab.li(i.to_s)
            }
          end

          mab.link("href" => "vanilla.css?#{$APPLICATION_UUID}", "rel" => "stylesheet", "type" => "text/css")
          mab.script("id" => "js-#{$APPLICATION_UUID}", "src" => "index.js?#{$APPLICATION_UUID}") {}
        end
      }

      if full_render
        mabb.html5("lang" => "en") do
          mabb.head do
            mabb.title("aod")
            mabb.script("src" => "morphdom-umd.js") {}
          end

          mabb.body do
            mabb.div("id" => "container") do
             dashboard_partial_proc.call(mabb)
            end
          end
        end
      else
        dashboard_partial_proc.call(mabb)
      end

      mabb.to_s
    end
  end
end
