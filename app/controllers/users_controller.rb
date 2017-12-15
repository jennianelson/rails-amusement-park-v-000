class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
            flash[:notice] = "Could not create account."
        end
    end

    def show
        if current_user
            @user = current_user
        else
            redirect_to root_path
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :nausea, :height, :tickets, :happiness, :admin, :password)
    end

end
