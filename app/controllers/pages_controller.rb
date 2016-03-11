class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def root
    load_collections
  end

  private

  def load_collections
    @collections ||= collection_scope.shared
  end

  def collection_scope
    Collection.all
  end
end
