module FHIR
  # fhir/imaging_study_series.rb
  class ImagingStudySeries < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudySeries'
    embeds_one :uid, class_name: 'PrimitiveId'
    embeds_one :number, class_name: 'PrimitiveUnsignedInt'
    embeds_one :modality, class_name: 'Coding'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :numberOfInstances, class_name: 'PrimitiveUnsignedInt'
    embeds_many :endpoint, class_name: 'Reference'
    embeds_one :bodySite, class_name: 'Coding'
    embeds_one :laterality, class_name: 'Coding'
    embeds_many :specimen, class_name: 'Reference'
    embeds_one :started, class_name: 'PrimitiveDateTime'
    embeds_many :performer, class_name: 'ImagingStudySeriesPerformer'
    embeds_many :instance, class_name: 'ImagingStudySeriesInstance'

    def self.transform_json(json_hash, target=ImagingStudySeries.new)
      result = self.superclass.transform_json(json_hash, target)
      result['uid'] = PrimitiveId.transform_json(json_hash['uid'], json_hash['_uid']) unless json_hash['uid'].nil?      
      result['number'] = PrimitiveUnsignedInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?      
      result['modality'] = Coding.transform_json(json_hash['modality']) unless json_hash['modality'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['numberOfInstances'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfInstances'], json_hash['_numberOfInstances']) unless json_hash['numberOfInstances'].nil?      
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?
      result['bodySite'] = Coding.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['laterality'] = Coding.transform_json(json_hash['laterality']) unless json_hash['laterality'].nil?      
      result['specimen'] = json_hash['specimen'].map { |var| Reference.transform_json(var) } unless json_hash['specimen'].nil?
      result['started'] = PrimitiveDateTime.transform_json(json_hash['started'], json_hash['_started']) unless json_hash['started'].nil?      
      result['performer'] = json_hash['performer'].map { |var| ImagingStudySeriesPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['instance'] = json_hash['instance'].map { |var| ImagingStudySeriesInstance.transform_json(var) } unless json_hash['instance'].nil?

      result
    end
  end
end
