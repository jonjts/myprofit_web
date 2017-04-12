class Bill < ApplicationRecord

  belongs_to :users

  validates_presence_of :title
  validates_presence_of :input
  validates_presence_of :date_input


end
