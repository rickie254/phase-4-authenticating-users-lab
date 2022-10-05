class SessionsController < ApplicationController
    def create
       user=User.find_by(username:params[:username])
       if user
        session[:user_id]=user.id
        render json: user, status: :ok
        else
        render json:{error:"Unauthorized user"},status: :unauthorized
        end
    end

    def destroy
        user=User.find_by(id:session[:user_id])
        if user
        session.delete :user_id
        head:no_content
        end
        # byebug
    end
end