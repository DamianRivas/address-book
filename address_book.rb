require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "Welcome to AddressBook!"

menu.main_menu