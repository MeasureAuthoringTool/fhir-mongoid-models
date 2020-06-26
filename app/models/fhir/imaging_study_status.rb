module FHIR
  # fhir/imaging_study_status.rb
  class ImagingStudyStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudyStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ImagingStudyStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
