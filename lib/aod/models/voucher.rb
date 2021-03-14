#

module Aod
  module Models
    class Voucher
      include ActiveGraph::Node

      property :worth, :type => Integer

      def +(b)
        worth + b.worth
      end

      def to_i
      end
    end
  end
end
