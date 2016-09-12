# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Source < ActiveRecord::Base
  has_many :events
  def get_calendar
    require 'icalendar'
    require 'net/http'
    cal_file=(Net::HTTP.get "hyperplanning.iut.u-bordeaux.fr", url)
    Icalendar::Calendar.parse(cal_file)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end 
end
