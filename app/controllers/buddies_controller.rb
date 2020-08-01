class BuddiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_buddy, only: [:show, :edit, :update, :destroy]

  def index
    @buddies = Buddy.all.order(created_at: :desc)
  end

  def show
    @markers = [
      {
        lat: @buddy.latitude,
        lng: @buddy.longitude
      }
    ]
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    @buddy.owner = current_user
    if @buddy.save
      redirect_to buddy_path(@buddy), notice: 'Buddy was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @buddy.update(buddy_params)
      redirect_to buddy_path(@buddy), notice: 'Buddy was successfully updated.'
    else
      redirect_to @restaurant
    end
  end

  def destroy
    @buddy.destroy
    redirect_to buddies_path, notice: "Buddy was successfully destroyed"
  end

  def my_own
    @my_buddies = Buddy.where(owner_id: current_user.id)
  end

  private

  def set_buddy
    @buddy = Buddy.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:name, :description, :age, :category, :photo, :address)
  end
end
