class HaittaesController < ApplicationController
    before_action :authenticate_user
    
    def create
        @haittaes = Haitta.new(
                    user_id: @current_user.id,
                    post_id: params[:post_id]
                    )
                    @haittaes.save
                    redirect_to("/posts/#{params[:post_id]}")
    end
    
    def destroy
        @haittaes = Haitta.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
            )
            @haittaes.destroy
            redirect_to("/posts/#{params[:post_id]}")
    end
    
end