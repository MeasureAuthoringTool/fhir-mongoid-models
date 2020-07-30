module CQM
  # bonnie/patient.rb
  class Patient
    include Mongoid::Document
    include Mongoid::Timestamps

    field :expected_values, type: Array
    field :notes, type: String
    field :measure_ids, type: Array

    embeds_one :fhir_patient, class_name: 'FHIR::Patient', autobuild: true
    embeds_many :data_elements, class_name: 'CQM::PatientDataCriteria'
  end
end
