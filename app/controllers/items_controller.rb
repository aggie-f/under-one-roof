class ItemsController < ApplicationController
  before_action :set_experience, only: [:new, :create, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    #@items = Item.all
    @items = Item.where(experience_id: params[:id])
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.experience = @experience
    if @item.save
      redirect_to experience_path(@experience, anchor: "supplies")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    @item.destroy
    redirect_to experience_path(@item.experience, anchor: "supplies")
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end



end
