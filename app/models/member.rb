class Member < ActiveRecord::Base
  has_many :shipments
end
