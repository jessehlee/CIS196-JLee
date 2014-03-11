class Job < ActiveRecord::Base
  belongs_to :reviewer


  yearFormatValidation = /\d{4}/

  # validations
  validates :company, presence: true
  validates :role, presence: true
  validates :startyear, presence: true, format: {with: yearFormatValidation}, length: {is: 4}
  validates :endyear, format: {with: yearFormatValidation}, allow_blank: true, length: {is: 4}


end
