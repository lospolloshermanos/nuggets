class Entry < ActiveRecord::Base
  belongs_to :nugget, dependent: :destroy
end
