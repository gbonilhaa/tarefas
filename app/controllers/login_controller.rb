class LoginController < ApplicationController
  
  def index
  	render :action => 'login'
  end

  def login
  end

  def do_login
  	username = params[:username]
  	password = params[:password]

	  	if username.nill? || password.nill? || username==password
	  		redirect_to :action => "login"
	  		flash[:notice] = 'usuario ou senha incorretos'
	  	else
	  		session["user_id"] = username
	  		redirect_to :Controller => 'secure', :action => "index"
	  	end
  end
end
