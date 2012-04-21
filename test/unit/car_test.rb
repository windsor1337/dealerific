# == Schema Information
#
# Table name: cars
#
#  id             :integer         not null, primary key
#  dealer_id      :integer
#  reference_code :string(255)
#  title          :string(255)
#  make           :string(255)
#  model          :string(255)
#  year           :string(255)
#  color          :string(255)
#  transmission   :string(255)
#  miles          :string(255)
#  list_price     :string(255)
#  list_date      :date
#  description    :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
