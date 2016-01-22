class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:show, :edit, :update, :destroy]

  # GET /zombies
  # GET /zombies.json
  def index
    #@zombies = Zombie.all 
    @zombies = Zombie.includes(:brain).all 
    #這樣view執行 zombie.name.flavor 就不會有n+1 query issue

    render layout: 'only_for_zombie_index'
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
      @zombie = Zombie.find(params[:id])
      respond_to do |format|

        #custom render
        format.html do #如果下面不成立就render 預設的show.html.erb
          if @zombie.decomp == 'Dead (again)' 
              render :dead_again
          end   
        end
        format.json { render json: @zombie }
      end
  end

    # 只有需要同時render不同格式才要respond_to bloack 
    # 如果只要render html
    # if @zombie.decomp == 'Dead (again)'
    #   render :dead_again
    # end

    # 如果只要render json
    # render json: @zombie

    # 如果要使用API就會回傳json，同時需要回傳HTTP status code
    # render json: @zombie.errors, status: :unprocessable_entity
    # render json: @zombie, status: :created, location: @zombie
    # 當create一個resource，回傳該resource的URI，這是好的API practice

  # GET /zombies/new
  def new
    @zombie = Zombie.new
  end

  # GET /zombies/1/edit
  def edit
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie was successfully created.' }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url, notice: 'Zombie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @zombie = Zombie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :bio, :age, :rotting, :email)
    end
end
