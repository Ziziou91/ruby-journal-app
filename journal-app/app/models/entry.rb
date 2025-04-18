class Entry < ApplicationRecord
    belongs_to :user
    has_many :shared_entries, dependent: :destroy
    has_many :shared_with_users, through: :shared_entries, source: :user

    def start_time
        self.created_at
    end
end
