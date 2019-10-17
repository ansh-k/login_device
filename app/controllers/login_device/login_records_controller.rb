require_dependency "login_device/application_controller"

module LoginDevice
  class LoginRecordsController < ApplicationController
    # before_action :set_login_record, only: [:show, :edit, :update, :destroy]
    def index
      if user_signed_in?
        @login_records = LoginDevice::LoginRecord.where(user_id: current_user.id, is_active: true)
      end
    end

    # # GET /login_records/1
    # def show
    # end

    # # GET /login_records/new
    # def new
    #   @login_record = LoginRecord.new
    # end

    # # GET /login_records/1/edit
    # def edit
    # end

    # # POST /login_records
    # def create
    #   @login_record = LoginRecord.new(login_record_params)

    #   if @login_record.save
    #     redirect_to @login_record, notice: 'Login record was successfully created.'
    #   else
    #     render :new
    #   end
    # end

    # # PATCH/PUT /login_records/1
    # def update
    #   if @login_record.update(login_record_params)
    #     redirect_to @login_record, notice: 'Login record was successfully updated.'
    #   else
    #     render :edit
    #   end
    # end

    # # DELETE /login_records/1
    # def destroy
    #   @login_record.destroy
    #   redirect_to login_records_url, notice: 'Login record was successfully destroyed.'
    # end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_login_record
      #   @login_record = LoginRecord.find(params[:id])
      # end

      # # Only allow a trusted parameter "white list" through.
      # def login_record_params
      #   params.require(:login_record).permit(:last_seen, :token, :device)
      # end
  end
end
