class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :user_id, :name, presence: true

  scope :shared, -> { where(share: true) }

  def self.for_select(user)
    where(user_id: user.id).order(name: :asc).pluck(:name, :id)
  end
end
