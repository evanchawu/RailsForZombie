class ChangeDefaultValueOfRottingInZombiesToFalse < ActiveRecord::Migration

	def change
	  change_column :zombies, :rotting, :boolean, :default => false
	end
end
