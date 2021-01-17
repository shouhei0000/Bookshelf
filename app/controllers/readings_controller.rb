class ReadingsController < ApplicationController

  before_action :require_user_logged_in
  
  def index 
    @readings = current_user.readings.order(id: :desc).page(params[:page])
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = current_user.readings.new(reading_params)

     if @reading.save 
      flash[:success] = '読んでいる本の登録に成功しました'
      redirect_to @reading
     else
      flash[:danger]
      render :new
     end
  end

  private
  def reading_params
    params. require(:reading).permit(:title, :image, :details)
  end
end
