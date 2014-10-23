# == Schema Information
#
# Table name: pokemons
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  level       :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Pokemon < ActiveRecord::Base
  belongs_to :user

  validates :name, :user_id, :level, presence: true
  validates :name, uniqueness: true
end
