class SharedEntry < ApplicationRecord
    belongs_to :user
    belongs_to :entry
end
