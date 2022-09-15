class ArtworkSharesController < ApplicationController

    def create
        @share = ArtworkShare.new(shares_params)
        if @share.save
            render json: "SUCCESS"
        else
            render json: @share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @share = ArtworkShare.find_by(id: params[:id])
        if @share
            @share.destroy
            render json: "DESTROYED"
        else
            render json: @share.errors.full_messages, status: :unprocessable_entity
        end
    end


    def shares_params
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end
end
