class WillreadsController < ApplicationController
    before_action :require_user_logged_in

    def index
        @willreads = current_user.willreads.order(id: :desc).page(params[:id])
    end

    def show
        @willread = Willread.find(params[:id])
    end

    def new
        @willread = Willread.new
    end

    def create
        @willread = current_user.willreads.new(willread_params)

        if @willread.save
            flash[:success] = '読みたい本の登録に成功しました'
            redirect_to @willread
        else
            flash[:danger] = '読みたい本の登録に失敗しました'
            render :new
        end

    end

    private
    def willread_params
        params. require(:willread).permit(:title, :details, :image)
    end
end
