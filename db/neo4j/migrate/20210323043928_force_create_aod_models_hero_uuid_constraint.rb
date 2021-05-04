class ForceCreateAodModelsHeroUuidConstraint < ActiveGraph::Migrations::Base
  def up
    add_constraint :"Aod::Models::Hero", :uuid, force: true
  end

  def down
    drop_constraint :"Aod::Models::Hero", :uuid
  end
end
