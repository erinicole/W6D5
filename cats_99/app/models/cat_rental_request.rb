# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status,  :inclusion => { :in => ['PENDING', 'APPROVED', 'DENIED']}
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat
end
