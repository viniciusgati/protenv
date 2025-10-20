class InstalacaosController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_instalacao, only: %i[ show edit update destroy maintenance start_download download_progress ]
  before_action :authorize_owner!, only: %i[ edit update destroy maintenance start_download download_progress ]

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

  # GET /instalacaos/1/maintenance
  def maintenance
    @app_bin = @instalacao.appserver_binario
    @db_bin = @instalacao.dbaccess_binario
    @app_task = DownloadTask.where(instalacao: @instalacao, binario: @app_bin).order(updated_at: :desc).first
    @db_task  = DownloadTask.where(instalacao: @instalacao, binario: @db_bin).order(updated_at: :desc).first
  end

  # POST /instalacaos/1/start_download?kind=appserver|dbaccess
  def start_download
    kind = params[:kind]
    bin = case kind
          when 'appserver' then @instalacao.appserver_binario
          when 'dbaccess' then @instalacao.dbaccess_binario
          else
            render json: { error: 'invalid kind' }, status: :unprocessable_entity and return
          end
    task = DownloadTask.create!(instalacao: @instalacao, binario: bin, status: :queued, progress: 0)
    DownloadBinarioJob.perform_later(task.id)
    render json: { task_id: task.id, status: task.status, progress: task.progress }
  end

  # GET /instalacaos/1/download_progress?kind=appserver|dbaccess
  def download_progress
    kind = params[:kind]
    bin = kind == 'appserver' ? @instalacao.appserver_binario : @instalacao.dbaccess_binario
    task = DownloadTask.where(instalacao: @instalacao, binario: bin).order(updated_at: :desc).first
    if task
      render json: { task_id: task.id, status: task.status, progress: task.progress, error: task.error_message }
    else
      render json: { status: 'none', progress: 0 }
    end
  end

  # POST /instalacaos/1/start_all_downloads
  def start_all_downloads
    tasks = {}
    { appserver: @instalacao.appserver_binario, dbaccess: @instalacao.dbaccess_binario }.each do |k, bin|
      next unless bin
      task = DownloadTask.create!(instalacao: @instalacao, binario: bin, status: :queued, progress: 0)
      DownloadBinarioJob.perform_later(task.id)
      tasks[k] = { task_id: task.id, status: task.status, progress: task.progress }
    end
    render json: tasks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalacao
      @instalacao = Instalacao.find(params.expect(:id))
    end

    def authorize_owner!
      redirect_to root_path, alert: 'Acesso negado' unless @instalacao.user == current_user
    end

    # Only allow a list of trusted parameters through.
    def instalacao_params
      params.expect(instalacao: [ :name, :appserver_binario_id, :dbaccess_binario_id, :banco_id ])
    end
end
