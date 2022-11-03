class HaittumController < ApplicationController
    before_action :authenticate_user
    
    def create
        @haittum = Haittum.new(
                    user_id: @current_user.id,
                    post_id: params[:post_id]
                    )
                    @haittum.save
                    redirect_to("/posts/#{params[:post_id]}")
    end
    
    def destroy
        @haittum = Haittum.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
            )
            @haittum.destroy
            redirect_to("/posts/#{params[:post_id]}")
    end
    
end