class CommentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new()
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to products_path
  end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
