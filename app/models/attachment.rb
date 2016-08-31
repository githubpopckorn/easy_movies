class Attachment < ApplicationRecord
  belongs_to :post
  include PicturableConcern
end
