class BinariosController < ApplicationController
  before_action :set_binario, only: %i[ show edit update destroy ]

  # GET /binarios
  def index
    @binarios = Binario.all
  end

  # GET /binarios/1
  def show
  end

  # GET /binarios/new
  def new
    @binario = Binario.new
  end

  # GET /binarios/1/edit
  def edit
  end

  # POST /binarios
  def create
    @binario = Binario.new(binario_params)

    if @binario.save
      redirect_to @binario, notice: "Binario was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /binarios/1
  def update
    if @binario.update(binario_params)
      redirect_to @binario, notice: "Binario was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /binarios/1
  def destroy
    @binario.destroy!
    redirect_to binarios_path, notice: "Binario was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binario
      @binario = Binario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def binario_params
      params.expect(binario: [ :name, :tipo, :download_url, :auth_username, :auth_password ])
    end
end
