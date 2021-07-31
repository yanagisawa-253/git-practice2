class UsersController < ApplicationController

# before_action :baria_user, only: [:edit, :destroy]
#　制限の仕方がわからない

  def index
    @users = User.all
    @user = current_user
    # kaeru
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    # params[:id] ではなく紐付けてデータを取り出す
    @books = Book.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "You have save user successfully."
      redirect_to books_path
    else
       flash.now[:notice] = "You have user error successfully."
      render :index
    end
  end

  def edit
     @user = User.find(params[:id])
     if @user == current_user
       render "edit"
     else
        @user = current_user
        redirect_to user_path(current_user.id)
       # kokokaetayo
     end
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
      else
       flash.now[:notice] = "You updated error successfully."
       render :edit
      end
    else
      redirect_to books_path
    end
  end
  # ユーザーが他人の時は＆updateのif分の２重

  def destroy
    @user.destroy
    redirect_to :homes => :top
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
