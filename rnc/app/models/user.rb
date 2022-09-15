class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        inverse_of: :artist,
        dependent: :destroy

    has_many :artwork_shared,
        foreign_key: :viewer_id,
        inverse_of: :viewer,
        dependent: :destroy


end
