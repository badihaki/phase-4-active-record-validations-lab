class Author < ApplicationRecord
    # authors have name
    # authors  names are unique
    # phone #10 digits
    validates :name, {presence: true, uniqueness: true }
    validates :phone_number, length: {is: 10}
end
