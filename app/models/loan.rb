# frozen_string_literal: true

# == Schema Information
#
# Table name: loans
#
#  id         :bigint           not null, primary key
#  due_date   :date
#  status     :integer
#  user_id    :bigint           not null
#  book_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Loan < ApplicationRecord
  scope :active, -> { where.not(status: %i[returned cancelled]) }

  enum status: { created: 0, returned: 1, late: 2, cancelled: 3 }

  belongs_to :user
  belongs_to :book

  validates :due_date,
            :status,
            presence: true

  validates :due_date, :due_date_in_future

  def due_date_in_future
    return if due_date.blank? || due_date > Time.zone.today

    errors.add(:due_date, "can't be in the past")
  end
end
