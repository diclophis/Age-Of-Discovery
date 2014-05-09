class Voucher
  include Neo4j::ActiveNode

  property :worth, :type => Float

  def +(b)
    worth + b.worth
  end

  def to_i
  end
end
