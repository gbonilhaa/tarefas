 class Tarefa < ActiveRecord::Base
  default_scope { order 'id desc' }
  scope :concluidas, -> { where(concluida: true) }
  #scope :ativas, -> { where(concluida: false) }

  def self.ativas
    where(concluida: false)
  end
 end