class Artwork < ApplicationRecord

  validates :title, presence:true, uniqueness: { scope: :artist_id, message: "should have only one artist_id per title" }
  validates :image_url, presence: true
  validates :artist_id, presence: true

  has_many :artwork_shares,
    dependent: :destroy

  belongs_to :artist,
    class_name: :User

  has_many :artwork_share_viewer,
    through: :artwork_shares,
    source: :viewer




  def self.artworks_for(user_id)
      #return all the artworks related to user_id / viewer_id
      Artwork
        .joins(:artwork_shares)
        .where("artist_id = #{user_id} OR viewer_id = #{user_id}")
        .uniq
  end

end
