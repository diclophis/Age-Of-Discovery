#

module Aod
  module Views
    def self.factory(mab, params, cookies)
      name = cookies["name"]
      name = nil if name == ""

      card = params['c'] || (name ? 'port' : 'welcome')

      ##max_r = [0, (params['max_r'] || 1).to_i].max

      case card
        when 'welcome'
          welcome(mab)

        when 'set_sail'
          set_sail(mab)

        when 'port'
          port(mab, name)
      end
    end

    def self.port(mab, name) #TODO: hero object
      mab.div(:id => "container") do
        mab.div(:id => "port") do
          mab.div(:id => "port-title") do
            mab.h3 "Waiting for ..."
            mab.em name
          end
        end
      end
    end

    def self.welcome(mab)
      mab.div(:id => "container") do
        mab.div(:id => "welcome") do
          mab.div(:id => "welcome-title") do
            mab.h3 "Welcome To the ..."

            mab.a(:href => "?c=set_sail") do
              mab.h1 "Age of Discovery"
            end
          end
        end
      end
    end

    def self.set_sail(mab)
      mab.div(:id => "container") do
        mab.div(:id => "welcome") do
          mab.div(:id => "welcome-title") do
            #mab.h3 "Welcome To the ..."
            #mab.a(:href => "?") do
            #  mab.h1 "Age of Discovery"
            #end
            mab.form("method" => "post") do
              mab.label { "Name:" }
              mab.span  { "&emsp;" }
              mab.input("name" => "name", "class" => "focal", "autofocus" => true)

              #mab.a(:href => "?") do
              #  mab.h1 "Set Sail!"
              #end

              mab.input("type" => "submit", "value" => "Set Sail!")
            end

            #mab.button do
            #  mab.h1 "Set Sail!"
            #end
          end
        end
      end
    end

    def self.debug(mab, max_r = 0)
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
      end
    end
  end
end
