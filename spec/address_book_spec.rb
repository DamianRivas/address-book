require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an empty array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "removes only one entry from the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Damian Rivas', '123.456.7890', 'damian@damian.com')
      book.add_entry('Ioannis Hatzistavros', '333.444.5555', 'ioannis@gmail.com')
      book.add_entry('Alonso Baltazar', '343.757.9089', 'alonso@live.com')
      original_size = book.entries.size
      book.remove_entry('Ioannis Hatzistavros', '333.444.5555', 'ioannis@gmail.com')

      expect(book.entries.size).to eq(original_size - 1)
    end

    it "doesn't remove an entry if there's no match" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Damian Rivas', '123.456.7890', 'damian@damian.com')
      book.add_entry('Ioannis Hatzistavros', '333.444.5555', 'ioannis@gmail.com')
      book.add_entry('Alonso Baltazar', '343.757.9089', 'alonso@live.com')
      original_size = book.entries.size
      book.remove_entry('John Doe', '333.444.5555', 'ioannis@gmail.com')

      expect(book.entries.size).to eq(original_size)
    end
  end
end