class ReadsController < ApplicationController

    before_action :require_user_logged_in

 def index
    #@reads = Read.order(id: :desc).page(params[:page]).per(25)
    @reads = current_user.reads.order(id: :desc).page(params[:page])
    @tag_list = Tag.all
 end
 
 def show
    @read = Read.find(params[:id])
    @read_tags = @read.tags
 end

 def new
    @read = Read.new
 end

 def create
   @read = current_user.reads.new(read_params)
   tag_list = params[:read][:name].split(nil)
    if @read.save
       @read.save_tag(tag_list)
        flash[:success] = '読んだ本の登録に成功しました'
        redirect_to @read
    else
        flash.now[:danger] = '読んだ本の登録に失敗しました'
        render :new
    end
 end

 def edit
   @read = Read.find(params[:id])
 end

 def update
   @read = Read.find(params[:id])
   tag_list = params[:read][:name].split(nil)
   if @read.update(read_params)
      @read.save_tag(tag_list)
      flash[:success] = '読んだ本の編集が成功しました'
      redirect_to @read
   else
      flash.now[:danger] = '読んだ本の編集が失敗しました'
      render :edit
   end
 end


 private 
 def read_params
   params. require(:read).permit(:tags, :title, :image, :details)
 end

end
