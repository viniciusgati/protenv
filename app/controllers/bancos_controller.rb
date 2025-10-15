class BancosController < ApplicationController
  before_action :set_banco, only: %i[ show edit update destroy ]

  # GET /bancos
  def index
    @bancos = Banco.all
  end

  # GET /bancos/1
  def show
  end

  # GET /bancos/new
  def new
    @banco = Banco.new
  end

  # GET /bancos/1/edit
  def edit
  end

  # POST /bancos
  def create
    @banco = Banco.new(banco_params)

    if @banco.save
      redirect_to @banco, notice: "Banco was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /bancos/1
  def update
    if @banco.update(banco_params)
      redirect_to @banco, notice: "Banco was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /bancos/1
  def destroy
    @banco.destroy!
    redirect_to bancos_path, notice: "Banco was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco
      @banco = Banco.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def banco_params
      params.expect(banco: [ :name, :tipo, :backup ])
    end
end
