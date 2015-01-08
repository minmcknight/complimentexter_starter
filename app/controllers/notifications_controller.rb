class NotificationsController < ApplicationController

  def create
   notification= Notification.new(notification_params)
   notification.text
   redirect_to "/"
  end

  def new
  end

  private
  def notification_params
    params.require(:to_number)
  end
end