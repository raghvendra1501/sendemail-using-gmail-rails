class NotificationMailer < ApplicationMailer
	default from: "raghvendra1501@gmail.com"

	def notification_email(receiver_email)
		mail(to: receiver_email, subject: 'Sample Email')
	end
end
