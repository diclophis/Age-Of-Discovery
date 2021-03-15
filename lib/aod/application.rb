#

module Aod
  class Application < Sinatra::Application
    class Error < StandardError; end

    get '/' do
      full_render = !params['p']
      max_r = [0, (params['max_r'] || 1).to_i].max

      mabb = Markaby::Builder.new

      dashboard_partial_proc = Proc.new { |mab, sp, sc|
        mab.div do
          mab.a(:href => "?") do
            mab.h1 "aod"
          end

          mab.p Time.now

          mab.ul do
            mab.li do
              mab.span "first"
              mab.span  { "&emsp;" }

              mab.a(:href => "?max_r=#{[0, max_r-1].max}") do
                mab.span "less"
              end

              mab.span  { "&emsp;" }

              mab.a(:href => "?max_r=#{max_r+1}") do
                mab.span "more"
              end
            end

            max_r.times { |i|
              mab.li("#" * (i + 1))
            }
          end

          mab.pre {
            Aod::Models::Hero.first&.username
          }

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
