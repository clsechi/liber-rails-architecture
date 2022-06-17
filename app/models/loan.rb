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
end
