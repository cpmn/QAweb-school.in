=begin
Author: Mario Perez
Description: - Create TopBar Page Object			 
Version: 1.0
Date: 06 Jul 2016
=end
After do |scenario|
  if(scenario.failed?)
    screenshot_name = scenario.__id__.to_s + ".png"  
    page.driver.browser.save_screenshot("screenshots/#{screenshot_name}") 
    embed("screenshots/#{screenshot_name}", "image/png","Screenshots - Failed")
  end
end