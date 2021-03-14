#

module Aod
  module Models
    class Rank
      include ActiveGraph::Node

      property :name, :type => String
    end
  end
end
