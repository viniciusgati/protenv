class HomeController < ApplicationController
  def index
    @appservers = Binario.appserver
    @dbaccesses = Binario.dbaccess

    @instalacaos = if user_signed_in?
      current_user.instalacaos.includes(:appserver_binario, :dbaccess_binario, :banco)
    else
      Instalacao.none
    end

    if params[:q].present?
      @instalacaos = @instalacaos.where("instalacaos.name ILIKE ?", "%#{params[:q]}%")
    end
    if params[:appserver_binario_id].present?
      @instalacaos = @instalacaos.where(appserver_binario_id: params[:appserver_binario_id])
    end
    if params[:dbaccess_binario_id].present?
      @instalacaos = @instalacaos.where(dbaccess_binario_id: params[:dbaccess_binario_id])
    end
  end
end
