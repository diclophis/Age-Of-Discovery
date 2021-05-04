class ForceCreateAodModelsVoucherUuidConstraint < ActiveGraph::Migrations::Base
  def up
    add_constraint :"Aod::Models::Voucher", :uuid, force: true
  end

  def down
    drop_constraint :"Aod::Models::Voucher", :uuid
  end
end
