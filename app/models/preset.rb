# == Schema Information
#
# Table name: presets
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color_1    :string
#  color_2    :string
#  color_3    :string
#  color_4    :string
#  bg_color   :string
#  seeds      :integer
#  angle      :float
#  zoom       :float
#  opacity    :integer
#  b1         :integer
#  b2         :integer
#  b3         :integer
#  b4         :integer
#  b5         :integer
#  x          :float
#  y          :float
#

class Preset < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :ratings
end
