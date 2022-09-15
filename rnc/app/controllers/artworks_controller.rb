class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks
    end

    def create
        @artwork = Artwork.new(artwork_params) #it won't create if the parameters are incorrect

        if @artwork.save #validation / constraints
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id]) #return found value or null
        if @artwork
            @artwork.destroy
            redirect_to artworks_url(@artwork)
        else
            render json:"Artwork DNE"
        end
    end

    # def edit
    # end

    # def new
    # end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render json: @artwork
        else
            render json: @artowrk.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :image_url, :title)
    end
end
