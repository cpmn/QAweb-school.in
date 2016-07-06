begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'yaml'
require 'pathname'

AfterConfiguration do
    #Load global configuration parameters
    configuration = load_app_config_file('env.yml')
    
    $admin_user = configuration['web-school']['admin_user']
    $admin_pass = configuration['web-school']['admin_pass']
    $student_user = configuration['web-school']['student_user']
    $student_pass = configuration['web-school']['student_pass']
    $employee_user = configuration['web-school']['employee_user']
    $employee_pass = configuration['web-school']['employee_pass']
    $guardian_user = configuration['web-school']['guardian_user']
    $guardian_pass = configuration['web-school']['guardian_pass']

    $login_path = configuration['web-school']['host'] 
    puts $login_path

    # configure capybara
    config_capybara = configuration['capybara']    
    default_wait = config_capybara ['default']['wait_time'].to_i
    drivers = config_capybara ['default']['drivers']


    
    Capybara.configure do |config|
        Capybara.default_driver = :selenium
        Capybara.run_server = false        
        Capybara.default_max_wait_time = default_wait
        Capybara.app_host = $login_path
    end
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => drivers.to_sym)      
    end
    ENV["CAPYBARA_HOST"] ||= $login_path

end

def find_config_file(filename)
  root = Pathname.pwd
  while not root.root?
    root.find do |path|
      if path.file? and path.basename.to_s == filename
        return path.to_s
      end
    end
    root = root.parent
  end
  raise 'Configuration file ' #{filename}' not found!'
end

def load_app_config_file(filename)
  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
   return config
end

