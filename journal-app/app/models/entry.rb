class Entry < ApplicationRecord
    def start_time
        self.created_at
    end
end
