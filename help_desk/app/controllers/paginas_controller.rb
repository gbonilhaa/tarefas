class PaginasController < ApplicationController
  http_basic_authenticate_with name: "gbonilha", password: "gbonilha", only: :contatos
  def home
  end

  def recurso
  end

  def preco
  end

  def contato
  	@contato = Contato.new nome: 'Teste2',
                           email: 'teste@teste.com'
                           mensagem: 'its work'
  end

  def envia_contato
    @contato = Contato.create params.require(:contato).permit!
    unless @contato.valid?
    	render :contato
    end
  end

  def contatos
  	@contatos = Contato.all.reverse_order
  end
end