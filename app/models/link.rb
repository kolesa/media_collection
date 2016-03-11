class Link < ActiveRecord::Base
  belongs_to :collection

  validates :link, :collection_id, presence: true
  validates :link, url: true
end
