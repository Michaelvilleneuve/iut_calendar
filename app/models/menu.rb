# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  menu_date  :date
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ActiveRecord::Base
end
