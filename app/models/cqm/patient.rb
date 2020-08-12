module CQM
  # bonnie/patient.rb
  class Patient
    include Mongoid::Document
    include Mongoid::Timestamps

    field :expected_values, type: Array
    field :notes, type: String
    field :measure_ids, type: Array

    embeds_one :fhir_patient, class_name: 'FHIR::Patient', autobuild: true
    embeds_many :data_elements, class_name: 'CQM::DataElement'

    def as_json(*args)
      result = Hash.new
      unless self.id.nil?
        result['id'] = self.id.to_s
      end
      unless self.expected_values.nil?
        result['expected_values'] = self.expected_values
      end
      unless self.notes.nil?
        result['notes'] = self.notes
      end
      unless self.measure_ids.nil?
        result['measure_ids'] = self.measure_ids
      end
      unless self.fhir_patient.nil?
        result['fhir_patient'] = self.fhir_patient.as_json(*args)
      end
      unless self.data_elements.nil?  || !self.data_elements.any?
        result['data_elements'] = self.data_elements.map{ |x| x.as_json(*args) }
      end
      result['created_at'] = self.created_at unless self.created_at.nil?
      result['updated_at'] = self.updated_at unless self.updated_at.nil?

      result
    end

    def self.transform_json(json_hash, target = Patient.new)
      result = target
      result['id'] = json_hash['id'] unless json_hash['id'].nil?
      result['expected_values'] = json_hash['expected_values'] unless json_hash['expected_values'].nil?
      result['notes'] = json_hash['notes'] unless json_hash['notes'].nil?
      result['description'] = json_hash['description'] unless json_hash['description'].nil?
      result['measure_ids'] = json_hash['measure_ids'] unless json_hash['measure_ids'].nil?
      result['fhir_patient'] = FHIR::Patient.transform_json(json_hash['fhir_patient']) unless json_hash['fhir_patient'].nil?
      result['data_elements'] = json_hash['data_elements'].map { |var| CQM::DataElement.transform_json(var) } unless json_hash['data_elements'].nil?
      result['created_at'] = json_hash['created_at'] unless json_hash['created_at'].nil?
      result['updated_at'] = json_hash['updated_at'] unless json_hash['updated_at'].nil?
      result
    end
  end
end
