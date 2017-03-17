class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @registration = current_user.registrations.create(registration_params)

    redirect_to @registration.event, notice: "Thanks for registering"
  end

  private

  def registration_params
    params.require(:registration).permit(:price, :guest_count, :active, :event_id)
  end
end
