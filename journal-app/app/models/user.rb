class User < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :shared_entries, dependent: :destroy
  has_many :shared_entries_with_me, through: :shared_entries, source: :entry

  def to_s
    "#{first_name} #{last_name}"
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
