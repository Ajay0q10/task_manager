class Vehical < ApplicationRecord
    validates :company, presence: true ,length: { minimum: 3, maximum: 50 }
    validates :model, presence: true 
    validates :price, numericality: { only_integer: true, greater_than: 0 }
    validates :color, presence: true
end
