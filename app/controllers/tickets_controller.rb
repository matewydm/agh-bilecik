class TicketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_ticket, only: [:buy, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def buy
    @ticket.user_id = current_user.id
    if @ticket.save
      format.html { redirect_to @ticket, notice: 'Ticket was bought successfully.' }
      format.json { render :show, status: :ok, location: @ticket }
    else
      format.json { render json: @ticket.errors, status: :unprocessable_entity }
    end
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:name, :address, :price, :email_address, :seat_id_seq, :phone_number, :event_id, :user_id)
    end

    def correct_user
      @ticket = Ticket.find(params[:id])
      redirect_to tickets_path, notice: "Nie jesteś uprawniony do edycji tego biletu" if !@ticket.user.nil? && @ticket.user.id == current_user.id
    end

    def authenticate_user!
      if !user_signed_in?
        redirect_to tickets_path, notice: "Nie jesteś uprawniony do przeglądania tej strony"
      end
    end

end
