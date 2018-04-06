# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  user_id    :integer
#  preset_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :preset
end
