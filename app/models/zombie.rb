class Zombie < ActiveRecord::Base
	scope :rotting, -> { where(rotting: true)}
	scope :young, ->{ where("age < 18")}
	scope :recent, ->{ order("created_at desc").limit(3)}
end
