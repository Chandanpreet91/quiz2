class LikesController < ApplicationController
    def create
         idea = Idea.find params[:idea_id]
         like = Like.new(idea: idea,user: current_user)
        if  like.save
            flash[:success] = 'Idea Liked'  
        else
            flash[:danger] =  like.errors.full_messages.join(', ')
        end
        redirect_to idea_path(idea)
    end
    
    
    
    def destroy 
        like = current_user.likes.find params[:id]
        if  like.destroy
            flash[:success] = 'Idea Unliked'
        else
            flash[:warning] = "Couldn't like the idea"
        end
        redirect_to idea_path(like.idea)
    end
end
