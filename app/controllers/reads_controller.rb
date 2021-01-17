class ReadsController < ApplicationController

    before_action :require_user_logged_in

 def index
    #@reads = Read.order(id: :desc).page(params[:page]).per(25)
    @reads = current_user.reads.order(id: :desc).page(params[:page])
 end
 
 def show
    @read = Read.find(params[:id])
 end

 def new
    @read = Read.new
 end

 def create 
    @read = current_user.reads.new(read_params)

    if @read.save
        flash[:success] = '読んだ本の登録に成功しました'
        redirect_to @read
    else
        flash.now[:danger] = '読んだ本の登録に失敗しました'
        render :new
    end
 end

 private 
 def read_params
   params. require(:read).permit(:title, :image, :details)
 end
end
