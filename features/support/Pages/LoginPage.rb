=begin
Author: Paola Munoz
Description: - Create TopBar Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end

def logIn	
	@logIn ||=LoginPage.new
end
class LoginPage
	include Capybara::DSL
	attr_reader :inputLogin, :inputPass, :SignInBtn, :validation_error
	attr_accessor :user, :password

	def initialize	
		@inputLogin = page.find('#UserLogin_username')
		@inputPass = page.find('#UserLogin_password')
		@SignInBtn = 'Sign in'
		@title_content='.content-group'	
		@validation_error = '.errorSummary'		
	end	
	def set_user_name(user_name)
		@user = user_name
		@inputLogin.set @user
	end	
	def set_pasword (passwd)
		@password = passwd
		@inputPass.set @password
	end
	def click_sign_in_button
		click_on(@SignInBtn)
	end
	def is_login_title_displayed (value)
		page.has_css?(@title_content, :text => value, :match => :prefer_exact)
	end	

	def validation_error_txt(error_message)
  		page.has_css?(@validation_error, :text => error_message)
	end
end
