class LinksController < ApplicationController
  def show
    load_link
  end

  def new
    build_link
  end

  def create
    build_link
    save_link(notice_on(:create)) || render(:new)
  end

  def destroy
    load_link
    @link.destroy
    flash[:notice] = notice_on(:destroy)
    redirect_to redirection_path
  end

  private

  def load_links
    @links ||= link_scope
  end

  def load_link
    @link ||= link_scope.find(params[:id])
  end

  def build_link
    @link ||= link_scope.build
    @link.attributes = link_params
  end

  def save_link(notice = nil)
    return redirect_to redirection_path, notice: notice if @link.save
    redirect_message(@link)
    render :new
  end

  def redirection_path
    @link.collection
  end

  def link_params
    link_params = params[:link]
    link_params ? link_params.permit(:name, :link, :collection_id) : {}
  end

  def link_scope
    Link.all
  end
end
