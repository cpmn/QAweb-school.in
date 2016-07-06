=begin
Author: Mario Perez
Description: - Create TopBar Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end

def sideBarMenu
	@sideBarMenu ||= SideBar.new
end

class SideBar
	include Capybara::DSL

	attr_reader :category_option, :sub_category_option, :panel_title

	def initialize
		@category_option = 'ul.navigation.navigation-main.navigation-accordion li'
		@sub_category_option = 'ul li a'
		@panel_title = '.panel-title'
	end
	
	def expand_category category_option
		find(@category_option, :text => category_option).click
	end
	
	def expand_sub_category sub_category_option
		find(@sub_category_option, :text => sub_category_option, :match => :prefer_exact).click
	end

	def is_title_displayed title
		page.has_css?(@panel_title, :text => title)
	end
	
end