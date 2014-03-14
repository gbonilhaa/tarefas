class TarefasController < ApplicationController
	before_action :count_all, only: [:index, :ativas, :concluidas]

	def index
 		@tarefas = Tarefa.all
 		@count_concluidas = count_concluidas
 	end

 	def ativas
 		@tarefas = Tarefa.ativas
	    @count_concluidas = count_concluidas
 		render :index
 	end

 	def concluidas
	    @tarefas = Tarefa.where concluida: true
	    @tarefas = Tarefa.concluidas
	    render :index
    end
	def destroy
	    tarefa = Tarefa.find params[:id]
	    tarefa.destroy
	    redirect_to tarefas_path
	end

	def destroy_concluidas
	    Tarefa.concluidas.delete_all
	    redirect_to tarefas_path
	end

	def toggle
	    Tarefa.find(params[:id]).toggle! :concluida
	    redirect_to tarefas_path
	end

	def create
	    Tarefa.create titulo: params[:tarefa]
	    redirect_to tarefas_path
  	end

	private

		def count_all
		    count_concluidas
		    count_todas
		    count_ativas
	  end

	  def count_concluidas
	    	@count_concluidas = Tarefa.concluidas.count
	  end

	  def count_ativas
	    	@count_ativas = Tarefa.ativas.count
	  end

	  def count_todas
			Add a comment to this line
		    @count_todas = Tarefa.count
	  end
end