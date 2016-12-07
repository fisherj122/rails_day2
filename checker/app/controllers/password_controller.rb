class PasswordController < ApplicationController

  def check
    @user = params[:user]
    @pass = params[:pass]
    @user_error = ""
    @pass_error = ""

    if @user.nil? || @user == ""
      @user_error = "Please enter a username. "
    else
      if @user.length < 6
        @user_error += "Please enter a user name at least six characters long. "
      end

      if @user.include? "#" or @user.include? "!" or @user.include? "$"
        @user_error += "Username cannot include '$!#'. "
      end

      if @user_error == ""
        @user_error = "Username is acceptable."
      end
    end


    if @pass.nil? || @pass == ""
      @pass_error = "Please enter a password. "
    else
      if @pass.length < 6
        @pass_error += "Please enter a password at least six characters long. "
      end

      if @pass.exclude? "#"  and @pass.exclude? "$"  and @pass.exclude? "!" 
        @pass_error += "Password must include '$!#'. "
      end

      if @pass_error == ""
        @pass_error = "Password is acceptable."
      end
    end
  end
end
