class BooksController < ApplicationController


    def index
     @books = Book.all
     @book = Book.new
     @user = current_user
    # # @user = @books.user
    end

  def show
    @book = Book.find(params[:id])
    # @book.user_id = current_user.id
    @books = Book.new
    @user = @book.user
    # ユーザーと投稿の紐付け
    # current_user ログインしているユーザーのこと
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render 'edit'
      # redirect_to edit_book_path(@book)
    else
      redirect_to books_path
    end
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "Book was error canmot updated"
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end


  private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
end
