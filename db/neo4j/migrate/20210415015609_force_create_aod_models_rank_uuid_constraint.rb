class ForceCreateAodModelsRankUuidConstraint < ActiveGraph::Migrations::Base
  def up
    add_constraint :"Aod::Models::Rank", :uuid, force: true
  end

  def down
    drop_constraint :"Aod::Models::Rank", :uuid
  end
end
