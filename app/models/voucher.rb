class Voucher < Neo4j::Rails::Model
  property :worth, :type => Fixnum
  def +(b)
    worth + b.worth
  end

  def to_i
  end
end
