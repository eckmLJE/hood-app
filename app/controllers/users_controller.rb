class UsersController < ApplicationController
    before_action :require_login, only: [:index]
    before_action :find_user, only: [:show]

    def new
        @user = User.new
    end

    def show
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to :root
        else
            flash[:error] = @user.errors.full_messages
            redirect_to controller: 'users', action: 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :neighborhood_id)
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end

    def find_user
        @user = User.find(params[:id])
    end
end
