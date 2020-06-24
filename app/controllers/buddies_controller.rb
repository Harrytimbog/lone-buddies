class BuddiesController < ApplicationController
  before_action :set_buddy, only: [:show, :edit, :update, :destroy]

  def index
    @buddy = Buddy.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.owner = current_user
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @buddy.update(buddy_params)
      redirect_to buddy_path(@buddy)
    else
      render 'edit'
    end
  end

  def destroy
    @buddy.destroy
    redirect_to buddies_path
  end

  private

  def set_buddy
    @buddy = Buddy.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:name, :description, :price, :category, :photo, :address)
  end
end
