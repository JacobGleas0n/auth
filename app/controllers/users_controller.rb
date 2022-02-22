class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def create
  #params["user"]=>
  # {"first_name"=>"Jacob", 
  #"last_name"=>"Gleason", 
  #"email"=>"jacob.gleason@kellogg.northwestern.edu", 
  #"password"=>"tacos"}
  plain_text_password = params["user"]["password"] #=> tacos   
  @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(plain_text_password) 
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
