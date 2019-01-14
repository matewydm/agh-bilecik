class AddPhoneNumberToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :phone_number, :text
  end
end
