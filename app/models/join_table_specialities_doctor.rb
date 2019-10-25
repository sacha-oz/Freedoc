class JoinTableSpecialitiesDoctor < ApplicationRecord
  belongs_to :doctor
  belongs_to :speciality
end
