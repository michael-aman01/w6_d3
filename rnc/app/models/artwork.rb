class Artwork < ApplicationRecord
  validates :title, uniqueness {scope: :artist_id, message: "should have only one artist_id per title"}
  belongs_to :artist_id
end
