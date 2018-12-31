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
  has_many :home_works, -> { uniq }, through: :events

  def get_calendar
    require 'icalendar'
    require "open-uri"
    cal_file = URI.parse("https://hyperplanning.iut.u-bordeaux.fr#{url}").read
    Icalendar::Calendar.parse(cal_file)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end 

  def ordered_events
    events.where("ends_at >= ?", DateTime.now).where.not(title: "").order('starts_at asc')
  end
end
