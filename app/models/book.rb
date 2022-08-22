# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  title      :string
#  author     :string
#  year       :string
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
  has_many :loans, dependent: :destroy

  validates :title,
            :author,
            :year,
            :quantity,
            presence: true
end
