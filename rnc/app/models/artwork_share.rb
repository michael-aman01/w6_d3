class ArtworkShare < ApplicationRecord
    validates :viewer_id, presence:true, uniqueness: {scope: :artwork_id, message: "View cannot share the same artwork more than once"}
    validates :artwork_id, presence:true

    belongs_to :artwork

    belongs_to :viewer,
        inverse_of: :artwork_shares

end
