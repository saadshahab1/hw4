class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    # if user exists
    if @user
      # if user's password matches submitted password
        if BCrypt::Password.new(@user["password"]) == params["password"]
          session["user_id"] = @user["id"] 
          
          # send them to places
          flash["notice"] = "Welcome to your page!"
          redirect_to "/places"
        else
          # otherwise, back to login
          flash["notice"] = "Incorrect password. Please try again."
          redirect_to "/sessions/new"
        end
    else 
      # otherwise, back to login
      flas["notice"] = "Email and password mismatch"
      redirect_to "/sessions/new"
    end
  end

  def destroy
      session["user_id"] = nil
      flash["notice"] = "Goodbye."
      redirect_to "/sessions/new"
  end
end
  