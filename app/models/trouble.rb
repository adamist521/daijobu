class Trouble < ActiveRecord::Base
  belongs_to :user
  belongs_to :counselor
end
