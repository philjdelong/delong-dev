class Project < ApplicationRecord
    validates_presence_of :title, :description, :image
end