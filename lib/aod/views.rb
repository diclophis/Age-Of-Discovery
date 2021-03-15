#

module Aod
  module Views
    def self.factory(mab, params, cookies)
      name = cookies["name"]
      name = nil if name == ""

      card = params['c'] || (name ? 'port' : 'welcome')

      #TODO: validate params
      #card = 'welcome' if name == nil && (card != 'set_sail' && card != 'set_sail')

      #TODO: validate params
      case card
        when 'welcome'
          welcome(mab)

        when 'set_sail'
          set_sail(mab)

        when 'port'
          port(mab, name)

        when 'blackjack'
          blackjack(mab, name)
      end
    end

    def self.blackjack(mab, name) #TODO: hero object
      mab.div(:id => "container") do
        mab.div(:id => "blackjack") do
          mab.div(:id => "blackjack-title") do
            mab.a(:href => "?") do
              mab.h2 "Back to Port"
            end
          end
        end
      end
    end

    def self.port(mab, name) #TODO: hero object
      mab.div(:id => "container") do
        mab.div(:id => "port") do
          mab.div(:id => "port-title") do
            mab.a(:href => "?c=blackjack") do
              mab.h2 "Ye Olde Inn"
            end
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
            mab.form("method" => "post") do
              mab.label { "Name:" }
              mab.span  { "&emsp;" }
              mab.input("name" => "name", "class" => "focal", "autofocus" => true)

              mab.input("type" => "submit", "value" => "Set Sail!")
            end
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
