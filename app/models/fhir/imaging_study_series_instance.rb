module FHIR
  # fhir/imaging_study_series_instance.rb
  class ImagingStudySeriesInstance < BackboneElement
    include Mongoid::Document
    embeds_one :uid, class_name: 'FHIR::PrimitiveId'
    embeds_one :sopClass, class_name: 'FHIR::Coding'
    embeds_one :number, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ImagingStudySeriesInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['uid'] = PrimitiveId.transform_json(json_hash['uid'], json_hash['_uid']) unless json_hash['uid'].nil?      
      result['sopClass'] = Coding.transform_json(json_hash['sopClass']) unless json_hash['sopClass'].nil?      
      result['number'] = PrimitiveUnsignedInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      

      result
    end
  end
end
