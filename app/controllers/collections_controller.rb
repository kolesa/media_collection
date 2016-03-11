class CollectionsController < ApplicationController
  def index
    load_collections
  end

  def show
    load_collection
  end

  def new
    build_collection
  end

  def create
    build_collection
    save_collection(notice_on(:create)) || render(:new)
  end

  def destroy
    load_collection
    @collection.destroy
    flash[:notice] = notice_on(:destroy)
    redirect_to redirection_path
  end

  private

  def load_collections
    @collections ||= collection_scope.where(user_id: current_user.id)
  end

  def load_collection
    @collection ||= collection_scope.find(params[:id])
  end

  def build_collection
    @collection ||= collection_scope.build
    @collection.attributes = collection_params
  end

  def save_collection(notice = nil)
    return redirect_to redirection_path, notice: notice if @collection.save
    redirect_message(@collection)
    render :new
  end

  def redirection_path
    collections_path
  end

  def collection_params
    collection_params = params[:collection]
    collection_params ? collection_params.permit(:name, :share).merge(user_id: current_user.id) : {}
  end

  def collection_scope
    Collection.all
  end
end
