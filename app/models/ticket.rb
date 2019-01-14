class Ticket < ApplicationRecord
  validates :name,
            presence: true,
            length: { minimum: 6 }
  validates :email_address,
            presence: true,
            format: { with: /\A^.+@.+$\z/, message: "Błędny format adresu email" }
  validates :price,
            presence: true
  validates :address,
            presence: true
end
