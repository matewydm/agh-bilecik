class Ticket < ApplicationRecord
  validates :name,
            presence: true,
            length: { minimum: 5 }
  validates :email_address,
            presence: true,
            format: { with: /\A^.+@.+$\z/, message: "Błędny format adresu email" }
  validates :price,
            presence: true
  validates :address,
            presence: true
  validates :phone_number,
            presence: true,
            length: { minimum: 9, maximum: 9 },
            format: { with: /\A^[0-9]+$\z/, message: "Błędny format telefonu" }

end
