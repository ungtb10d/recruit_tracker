# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailer < ApplicationMailer
	#until we come up with a better way to do this we are just going to hard code the recruit managers email here
	$current_recruit_administrator = 'marklocklear2@gmail.com'

	def new_user_registration
		@user = params[:user]

		mail(to: [@user.email, $current_recruit_administrator], subject: "Thank you for signing up for RecruitTracker")
	end

	def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "Password Reset"
	end

	def change_profile_status(user, new_status)
  	@user = user
  	@new_status = new_status
  	mail to: [user.email, $current_recruit_administrator], :subject => "Your status has changed"
	end
end
