class RottingzombiesController < ApplicationController
  def index
  	@rotting_zombies = Zombie.rotting #相當於.where(rotting: true)
  	@young_zombies = Zombie.young #.where("age < 18")
  	@recent_zombies = Zombie.recent #.order("created_at desc").limit(3)

  	# 也可以重複用
  	# Zombie.rotting.limit(3)
  	# Zombie.recent.rotting
  	# Zombie.recent.young.rotting
  end
end
