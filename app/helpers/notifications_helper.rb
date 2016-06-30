module NotificationsHelper
	def hide_in_all(notification)
		return link_to "Mark as unread", mark_as_unread_path(notification) if notification.read?
		link_to "Mark as read", mark_as_read_path(notification)
	end

	def hide_in_dropdown()
		return render current_user.notifications.where(read: false).order('created_at DESC') if notification.read?
	end

end