# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  video_url  :string
#

class Video < ActiveRecord::Base
  belongs_to :user
  validates :video_name, presence: true
  validates :video_url, presence: true
end
