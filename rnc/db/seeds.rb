# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "DESTROYING ALL TABLES...."
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    puts "RESETTING ALL ID SEQUENCES..."
    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end
    
    puts "CREATING SEED DATA...."
    u1 = User.create!({username: "Michael Shih"})
    u2 = User.create!({username: "Michael Aman"})
    u3 = User.create!({username: "Michael Madsen"})

    a1 = Artwork.create!({title: "puppy", image_url: "https://en.wikipedia.org/wiki/Puppy", artist_id: u1.id})
    a2 = Artwork.create!({title: "kittens", image_url: "https://en.wikipedia.org/wiki/kittens", artist_id: u2.id})
    a3 = Artwork.create!({title: "puppy2", image_url: "https://en.wikipedia.org/wiki/Puppy2", artist_id: u3.id})


    s1 = ArtworkShare.create!({viewer_id: u2.id, artwork_id: a1.id})
    s2 = ArtworkShare.create!({viewer_id: u3.id, artwork_id: a1.id})
    s3 = ArtworkShare.create!({viewer_id: u2.id, artwork_id: a3.id})
    s4 = ArtworkShare.create!({viewer_id: u1.id, artwork_id: a3.id})
end



