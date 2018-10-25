class SessionsController < ApplicationController

  def new
    #login form
  end

  def create
    #Actually try and login
    @form_data = params.require(:session)

    #pull out the username and password from the form data
    @username = @form_data[:username]
    @password = @form_data[:password]

    #Lets check the user is who they say they are

    @user = User.find_by(username: @username).try(:authenticate, @password)

    #if there is a user present, redirect to homepage
    if @user
      #save this user to that user's session
      session[:user_id] = @user.id



      redirect_to root_path
    else
      render "new"
    end

  end

  def destroy
    #Log us out
    #remove the session completely
    reset_session

    #redirect to the log in page

    redirect_to new_session_path


  end

end
