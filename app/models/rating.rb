# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  rating     :integer
#  preset_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :preset
end
