module FHIR
  # fhir/imaging_study_series_instance.rb
  class ImagingStudySeriesInstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudySeriesInstance'
    embeds_one :uid, class_name: 'PrimitiveId'
    embeds_one :sopClass, class_name: 'Coding'
    embeds_one :number, class_name: 'PrimitiveUnsignedInt'
    embeds_one :title, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ImagingStudySeriesInstance.new
      result['uid'] = PrimitiveId.transform_json(json_hash['uid'], json_hash['_uid']) unless json_hash['uid'].nil?      
      result['sopClass'] = Coding.transform_json(json_hash['sopClass']) unless json_hash['sopClass'].nil?      
      result['number'] = PrimitiveUnsignedInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      

      result
    end
  end
end
