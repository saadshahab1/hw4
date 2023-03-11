class UsersController < ApplicationController
  def show
    @user = User.find_by({"id" => params["id"]})
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    #@user["last_name"] = params["user"]["last_name"]#
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/users/#{@user["id"]}"
  end
end
