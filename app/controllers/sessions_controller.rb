class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    # if user exists
    if @user
      # if user's password matches submitted password
        if @user["password"] == params["password"]
          # send them to places
          flash["notice"] = "You logged in!"
          redirect_to "/places"
        else
          # otherwise, back to login
          flash["notice"] = "Nope!"
          redirect_to "/sessions/new"
        end
    else 
      # otherwise, back to login
      redirect_to "/sessions/new"
    end
  end
  #def destroy
  #end
end
  