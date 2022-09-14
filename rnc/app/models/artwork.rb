class Artwork < ApplicationRecord
  validates :title, presence:true, uniqueness: { scope: :artist_id, message: "should have only one artist_id per title" }
  validates :image_url, presence: true
  validates :artist_id, presence: true

  has_many :artwork_shares,
    dependent: :destroy


  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_share_viewer,
    through: :artwork_shares,
    source: :viewer
end


