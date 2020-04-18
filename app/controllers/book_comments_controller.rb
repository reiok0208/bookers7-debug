class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book), notice: "successfully created comment!"
    else
      flash[:danger] = comment.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = BookComment.find_by(id: params[:book_id],id: params[:book_id])
    if comment.user_id = current_user.id
      comment.destroy
      redirect_to book_path(comment.book_id), notice: "successfully delete comment!"
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
