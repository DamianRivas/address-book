require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "#1 - View all entries"
    puts "#2 - Create an entry"
    puts "#3 - Search for an entry"
    puts "#4 - Import entries from a CSV"
    puts "#5 - View entry by number"
    puts "#6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "Clear"
        view_entry_by_num
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end

    system "clear"
    puts "End of Entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBook Entry"
    # Prompt the user for each entry attribute
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def view_entry_by_num
    system "clear"

    if address_book.entries.size == 0
      puts "AddressBook is empty"
      return
    end

    puts "Which entry would you like to view?"
    puts "There are currently #{address_book.entries.size} entries in your AddressBook"
    print "Enter a number: "

    selection = gets.chomp.to_i

    if selection > 0 && selection <= address_book.entries.size
      system "clear"
      puts address_book.entries[selection - 1]
      print "Press any key to continue: "
      gets
      system "clear"
    else
      system "clear"
      puts "#{selection} is not a valid entry"
    end

  end

  def entry_submenu(entry)
    # Display the submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    print "Enter your selection: "

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end