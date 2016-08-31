class Post < ApplicationRecord
  belongs_to :user
  has_many :attachments
  validates :title, presence: true, uniqueness: true
  include PicturableConcern
end
