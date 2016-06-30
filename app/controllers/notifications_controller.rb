class NotificationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_notifications, only: [:link_through, :mark_as_read, :mark_as_unread]
	
  def link_through
    @notification.update read: true
    redirect_to post_path @notification.post
  end

  def mark_as_read
    @notification.update read: true
    redirect_to action: "index"
  end

  def mark_as_unread
    @notification.update read: false
    redirect_to action: "index"
  end

  def index
    @notifications =  current_user.notifications.order('created_at DESC').page params[:page]
  end

  private
  def set_notifications
  	@notification = Notification.find(params[:id])
  end
end