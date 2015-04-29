class CreaturesController < ApplicationController

  before_action :is_authenticated?, except: [:login]
  def index
    @creatures = Creature.all
    @user = current_user
  end

  def new
    @creature = Creature.new
    @tags = Tag.all
  end

  def create
    # render :json => params
    @creature = current_user.creatures.create(creature_params)
    # @creature = Creature.create(creature_params)
    tags = params[:creature][:tag_ids]
    tags.each do |tag_id|
      @creature.tags << Tag.find(tag_id) unless tag_id.blank?
    end
    redirect_to @creature
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def about
  end

  def edit
    @creature = Creature.find(params[:id])
    @tags = Tag.all
  end

  def update
    @creature = Creature.update(params[:id], creature_params)
    @creature.tags.clear
    tags = params[:creature][:tag_ids]
    tags.each do |tag_id|
      @creature.tags << Tag.find(tag_id) unless tag_id.blank?
    end
    redirect_to @creature

  end

  def destroy
    @creature = Creature.destroy(params[:id])
    redirect_to creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name,:description)
  end

end