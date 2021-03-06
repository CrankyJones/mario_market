class ReviewsController < ApplicationController
  before_action only: %i[ edit ] do
    if !current_user.admin
      flash[:notice] = "You must be an admin to visit that page."
      redirect_to new_user_session_path unless current_user&.admin
    end
  end
  
  before_action only: %i[ new ] do
    if !current_user
      flash[:notice] = "Please sign in to leave a review."
    end
    redirect_to new_user_session_path unless current_user
  end
  
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
    flash[:notice] = "Review deleted!"
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating, :title)
    end
end