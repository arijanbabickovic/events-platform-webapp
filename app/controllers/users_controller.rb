class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]
    
    def index
        
    end
    
    def show
        
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated."
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end
