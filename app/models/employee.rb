class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, uniqueness: true
    validates :title, uniqueness: true 
    validates :alias, :title, uniqueness: true  
    # validates :dogs.name, numericality: { less_than: 2 }

    # only be able to select 1 dog from a list of already existing dogs.
    # No one at Dunder Mifflin can have the same alias and/or job title (Dwight made up that rule!)
end

