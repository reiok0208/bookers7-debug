class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save

  end

  def destroy
    @comment = BookComment.find_by(id: params[:book_id],id: params[:book_id])
    if @comment.user_id = current_user.id
      @comment.destroy
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
