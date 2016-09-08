# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
end
