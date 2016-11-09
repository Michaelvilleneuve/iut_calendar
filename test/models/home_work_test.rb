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

require 'test_helper'

class HomeWorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
