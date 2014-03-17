class UsuariosController < ApplicationController

  def index
    @usuarios = Usuario.all
    render :index
  end

  def create
    Usuario.create nome: params[:nome], email: params[:email], password_digest: params[:password_digest]
    redirect_to usuarios_path
  end

  def update
    Usuario.update nome: params[:nome], email: params[:email], password_digest: params[:password_digest]
    redirect_to usuarios_path
  end

  def destroy
    usuario = Usuario.find params[:id]
    usuario.destroy
    redirect_to usuarios_path
  end

  def edit
  	@usuario = Usuario.find params[:id]
  	render :new
  end

  def create
  	@usuario = new Usuario
  	render :new
  end
end


