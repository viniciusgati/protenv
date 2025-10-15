class InstalacaosController < ApplicationController
  before_action :set_instalacao, only: %i[ show edit update destroy ]

  # GET /instalacaos
  def index
    @instalacaos = Instalacao.all
  end

  # GET /instalacaos/1
  def show
  end

  # GET /instalacaos/new
  def new
    @instalacao = Instalacao.new
  end

  # GET /instalacaos/1/edit
  def edit
  end

  # POST /instalacaos
  def create
    @instalacao = Instalacao.new(instalacao_params)
    @instalacao.user = current_user if respond_to?(:current_user)

    if @instalacao.save
      redirect_to @instalacao, notice: "Instalacao was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /instalacaos/1
  def update
    if @instalacao.update(instalacao_params)
      redirect_to @instalacao, notice: "Instalacao was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /instalacaos/1
  def destroy
    @instalacao.destroy!
    redirect_to instalacaos_path, notice: "Instalacao was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalacao
      @instalacao = Instalacao.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def instalacao_params
      params.expect(instalacao: [ :name, :appserver_binario_id, :dbaccess_binario_id, :banco_id ])
    end
end
