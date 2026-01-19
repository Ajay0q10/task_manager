class Library < ApplicationRecord
    validates :name , presence: true
    validates :author , presence: true
    validates :price , numericality: { only_integer: true, greater_than: 0}
end
