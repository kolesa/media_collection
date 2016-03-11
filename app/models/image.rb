class Image < ActiveRecord::Base
  belongs_to :collection
  mount_uploader :image, ImageUploader

  validates :name, :image, :collection_id, presence: true
end
