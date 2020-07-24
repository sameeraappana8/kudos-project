class KudosController < ApplicationController
  before_action :set_kudo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipient, only: [:new, :create]

  # GET /kudos
  # GET /kudos.json
  def index
    @kudos = current_user.received_kudos
    @users = User.all
    @kudo = Kudo.new
  end

  # GET /kudos/1
  # GET /kudos/1.json
  def show
  end

  # GET /kudos/new
  def new
    @kudo = current_user.sent_kudos.build
  end

  # GET /kudos/1/edit
  def edit
  end

  # POST /kudos
  # POST /kudos.json
  def create
    @kudo = current_user.sent_kudos.build(kudo_params)
    @kudo.recipient_id = @recipient.id

    respond_to do |format|
      if @kudo.save
        format.html { redirect_to root_path, notice: 'Kudo was successfully created.' }
        format.json { render :show, status: :created, location: @kudo }
      else
        format.html { render :new }
        format.json { render json: @kudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kudos/1
  # PATCH/PUT /kudos/1.json
  def update
    respond_to do |format|
      if @kudo.update(kudo_params)
        format.html { redirect_to @kudo, notice: 'Kudo was successfully updated.' }
        format.json { render :show, status: :ok, location: @kudo }
      else
        format.html { render :edit }
        format.json { render json: @kudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kudos/1
  # DELETE /kudos/1.json
  def destroy
    @kudo.destroy
    respond_to do |format|
      format.html { redirect_to kudos_url, notice: 'Kudo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kudo_params
      params.require(:kudo).permit(:message, :sender_id, :recipient_id)
    end

    def set_recipient
      @recipient = User.find(params[:user_id])
    end
end
