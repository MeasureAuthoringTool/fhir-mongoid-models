module FHIR
  # fhir/imaging_study.rb
  class ImagingStudy < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudy'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ImagingStudyStatus'
    embeds_many :modality, class_name: 'Coding'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :started, class_name: 'PrimitiveDateTime'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :referrer, class_name: 'Reference'
    embeds_many :interpreter, class_name: 'Reference'
    embeds_many :endpoint, class_name: 'Reference'
    embeds_one :numberOfSeries, class_name: 'PrimitiveUnsignedInt'
    embeds_one :numberOfInstances, class_name: 'PrimitiveUnsignedInt'
    embeds_one :procedureReference, class_name: 'Reference'
    embeds_many :procedureCode, class_name: 'CodeableConcept'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :series, class_name: 'ImagingStudySeries'

    def self.transform_json(json_hash)
      result = ImagingStudy.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ImagingStudyStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['modality'] = json_hash['modality'].map { |var| Coding.transform_json(var) } unless json_hash['modality'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['started'] = PrimitiveDateTime.transform_json(json_hash['started'], json_hash['_started']) unless json_hash['started'].nil?      
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['referrer'] = Reference.transform_json(json_hash['referrer']) unless json_hash['referrer'].nil?      
      result['interpreter'] = json_hash['interpreter'].map { |var| Reference.transform_json(var) } unless json_hash['interpreter'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?
      result['numberOfSeries'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfSeries'], json_hash['_numberOfSeries']) unless json_hash['numberOfSeries'].nil?      
      result['numberOfInstances'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfInstances'], json_hash['_numberOfInstances']) unless json_hash['numberOfInstances'].nil?      
      result['procedureReference'] = Reference.transform_json(json_hash['procedureReference']) unless json_hash['procedureReference'].nil?      
      result['procedureCode'] = json_hash['procedureCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['procedureCode'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['series'] = json_hash['series'].map { |var| ImagingStudySeries.transform_json(var) } unless json_hash['series'].nil?

      result
    end
  end
end
