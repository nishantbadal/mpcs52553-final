class AccessController < ApplicationController
  def menu
  end

  def login
  end
  
  def signup
  end 
    
  def signupAttempt
      if params[:name].present? && params[:password].present? && params[:email].present?
            searchUser = User.where(:name => params[:name]).first
            if searchUser
               authorizeUser = searchUser.authenticate(params[:password])
            end
        end
      
      if authorizeUser
            flash.now[:notice] = "User already exists."
            render('signup')
        else
            newUser = User.new
            newUser.name = params[:name]
            newUser.email = params[:email]
            newUser.password = params[:password]
            newUser.save
          
            session[:user_id] = newUser.id
            flash[:notice] = "Logged in successfully."
            redirect_to(admin_path)
        end
  end
    
    
    def attempt
        if params[:name].present? && params[:password].present?
            searchUser = User.where(:name => params[:name]).first
            if searchUser
               authorizeUser = searchUser.authenticate(params[:password])
            end
        end
        
        if authorizeUser
            session[:user_id] = authorizeUser.id
            flash[:notice] = "Logged in successfully."
            redirect_to(admin_path)
        else
            flash.now[:notice] = "Invalid username/password."
            render('login')
        end
    end
    
    def logout
        session['user_id'] = nil
        flash[:notice] = 'Logged out.'
        redirect_to(access_login_path)
    end
    
end
