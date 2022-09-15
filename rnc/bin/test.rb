require 'json'
def write_json
    users = User.all
    artwork = Artwork.all
    shares = ArtworkShare.all
    File.open("updated_users.json","w") do |f|
        f.write(users.as_json)
    end
    File.open("updated_artwork.json","w") do |f|
        f.write(artwork.as_json)
    end
    File.open("updated_artwork_shares.json","w") do |f|
        f.write(shares.as_json)
    end
end


def import_data

    ApplicationRecord.transaction do 
        user_path = "./updated_users.json"
        artwork_path = "./updated_artwork.json"
        shared_path = "./updated_artwork_shares.json"

        users = File.read(user_path)
        artworks = File.read(artwork_path)
        shared_art = File.read(shared_path)

        users =  JSON.parse(users.split("=>").join(":"))
        artworks = JSON.parse(artworks.split("=>").join(":"))
        shared_art = JSON.parse(shared_art.split("=>").join(":"))
        
        users.each do |user|
            user = User.create!({username: user['username']})

        end
        # artworks.each do |art|
        #     Artwork.create!({title: art['title'], image_url: art['image_url'], artist_id: user.id})
        # end

        shared_art.each do |shared|
            ArtworkShare.create!({viewer_id: shared['viewer_id'], artist_id: shared['artist_id']})
        end
    end
end

 

def delete_tables

    ApplicationRecord.transaction do 
        puts "DESTROYING ALL TABLES...."
        User.destroy_all
        Artwork.destroy_all
        ArtworkShare.destroy_all

        puts "RESETTING ALL ID SEQUENCES..."
        %w(users artworks artwork_shares).each do |table_name|
            ApplicationRecord.connection.reset_pk_sequence!(table_name)
        end
    end
    puts "TABLES DELETED"
end
#delete_tables
#import_data 