class Player < ApplicationRecord
   belongs_to :team

   validates :name, presence:true
   validates :number, presence:true
   validates :position, presence:true
   validates :club, presence:true
end