class ReadingsController < ApplicationController

  before_action :require_user_logged_in
  
  def index 
    @readings = current_user.readings.order(id: :desc).page(params[:page])
  end

  def show
    @reading = Reading.find(params[:id])
    @reading_tags = @reading.tags
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = current_user.readings.new(reading_params)
    tag_list = params[:reading][:name].split(nil)
     if @reading.save 
       @reading.readingsave_tag(tag_list)
      flash[:success] = '読んでいる本の登録に成功しました'
      redirect_to @reading
     else
      flash[:danger]
      render :new
     end
  end

  def edit 
    @reading = Reading.find(params[:id])
    @reading_tags = @reading.tags
  end

  def update
    @reading = Reading.find(params[:id])
    tag_list = params[:reading][:name].split(nil)
    if @reading.update(reading_params) 
      @reading.readingsave_tag(tag_list)
      flash[:success] = '読んでいる本の編集に成功しました'
      redirect_to @reading
    else
      flash[:danger]
      render :new
    end
  end

  private
  def reading_params
    params. require(:reading).permit(:tags, :title, :image, :details)
  end
end
