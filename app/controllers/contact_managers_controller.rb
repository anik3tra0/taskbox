class ContactManagersController < ApplicationController
  before_action :set_contact_manager, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /contact_managers
  # GET /contact_managers.json
  def index
    @contact_managers = ContactManager.all
  end

  # GET /contact_managers/1
  # GET /contact_managers/1.json
  def show
  end

  # GET /contact_managers/new
  def new
    @contact_manager = ContactManager.new
  end

  # GET /contact_managers/1/edit
  def edit
  end

  # POST /contact_managers
  # POST /contact_managers.json
  def create
    @contact_manager = ContactManager.new(contact_manager_params)

    respond_to do |format|
      if @contact_manager.save
        format.html { redirect_to @contact_manager, notice: 'Contact manager was successfully created.' }
        format.json { render :show, status: :created, location: @contact_manager }
      else
        format.html { render :new }
        format.json { render json: @contact_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_managers/1
  # PATCH/PUT /contact_managers/1.json
  def update
    respond_to do |format|
      if @contact_manager.update(contact_manager_params)
        format.html { redirect_to @contact_manager, notice: 'Contact manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_manager }
      else
        format.html { render :edit }
        format.json { render json: @contact_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_managers/1
  # DELETE /contact_managers/1.json
  def destroy
    @contact_manager.destroy
    respond_to do |format|
      format.html { redirect_to contact_managers_url, notice: 'Contact manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_manager
      @contact_manager = ContactManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_manager_params
      params.require(:contact_manager).permit(:first_name, :last_name, :mobile, :email)
    end
end
