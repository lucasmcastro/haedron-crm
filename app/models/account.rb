class Account < ActiveRecord::Base
  validates_presence_of :display_name
end
