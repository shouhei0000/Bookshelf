class WillreadsController < ApplicationController
    before_action :require_user_logged_in

    def index
        @willreads = current_user.willreads.order(id: :desc).page(params[:id])
    end

    def show
        @willread = Willread.find(params[:id])
        @willread_tags = @willread.tags
    end

    def new
        @willread = Willread.new
    end

    def create
        @willread = current_user.willreads.new(willread_params)
        tag_list = params[:willread][:name].split(nil)
        if @willread.save
            @willread.save_tag(tag_list)
            flash[:success] = '読みたい本の登録に成功しました'
            redirect_to @willread
        else
            flash[:danger] = '読みたい本の登録に失敗しました'
            render :new
        end
    end

    def edit
        @willread = Willread.find(params[:id])
    end

    def update
        @willread = Willread.find(params[:id])
        tag_list = params[:willread][:name].split
        if @willread.update(willread_params)
            @willread.save_tag(tag_list)
            flash[:success] = '読みたい本の編集に成功しました'
            redirect_to @willread
        else
            flash[:danger] = '読みたい本の編集に失敗しました'
            render :new
        end
    end

    private
    def willread_params
        params. require(:willread).permit(:tags, :title, :details, :image)
    end
end
