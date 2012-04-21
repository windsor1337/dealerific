# == Schema Information
#
# Table name: dealers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  address1           :string(255)
#  address2           :string(255)
#  city               :string(255)
#  state              :string(255)
#  zipcode            :string(255)
#  sales_phone        :string(255)
#  service_phone      :string(255)
#  email              :string(255)
#  hours_of_operation :string(255)
#  website_url        :string(255)
#  mobile_website_url :string(255)
#  facebook           :string(255)
#  twitter            :string(255)
#  logo_url           :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

require 'test_helper'

class DealerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
