class ImagesController < ApplicationController
  def show
    load_image
  end

  def new
    build_image
  end

  def create
    build_image
    save_image(notice_on(:create)) || render(:new)
  end

  def destroy
    load_image
    @image.destroy
    flash[:notice] = notice_on(:destroy)
    redirect_to redirection_path
  end

  private

  def load_images
    @images ||= image_scope
  end

  def load_image
    @image ||= image_scope.find(params[:id])
  end

  def build_image
    @image ||= image_scope.build
    @image.attributes = image_params
  end

  def save_image(notice = nil)
    return redirect_to redirection_path, notice: notice if @image.save
    redirect_message(@image)
    render :new
  end

  def redirection_path
    @image.collection
  end

  def image_params
    image_params = params[:image]
    image_params ? image_params.permit(:name, :image, :collection_id) : {}
  end

  def image_scope
    Image.all
  end
end
