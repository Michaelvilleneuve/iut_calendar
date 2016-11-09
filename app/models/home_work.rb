# == Schema Information
#
# Table name: home_works
#
#  id          :integer          not null, primary key
#  title       :string
#  event_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  verified    :boolean
#

class HomeWork < ActiveRecord::Base
  belongs_to :event
  validates :title, :description, presence: true

  def verify!
  	self.verified = true
  	save
  end
end
