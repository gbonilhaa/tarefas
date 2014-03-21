class UsuariosController < ApplicationController

  def index
    @usuarios = Usuario.all
  end

  def create
    Usuario.create usuario_params
    redirect_to usuarios_path
  end

  def update
    Usuario.update params[:id], usuario_params
    redirect_to usuarios_path
  end

  def destroy
    usuario = Usuario.find params[:id]
    usuario.destroy
    redirect_to usuarios_path
  end

  
  def new
  	@usuario = Usuario.new
  end

  def edit
  	@usuario = Usuario.find params[:id]
    render text: 'acesso negado' unless logado?
  end

  private

  def usuario_params
  	params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
  end

  def logado?
    false
  end
  
end


