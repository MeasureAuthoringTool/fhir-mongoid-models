module FHIR
  # fhir/media.rb
  class Media < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Media'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MediaStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :modality, class_name: 'CodeableConcept'
    embeds_one :view, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :createdDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :createdPeriod, class_name: 'Period'
    embeds_one :issued, class_name: 'PrimitiveInstant'
    embeds_one :operator, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :deviceName, class_name: 'PrimitiveString'
    embeds_one :device, class_name: 'Reference'
    embeds_one :height, class_name: 'PrimitivePositiveInt'
    embeds_one :width, class_name: 'PrimitivePositiveInt'
    embeds_one :frames, class_name: 'PrimitivePositiveInt'
    embeds_one :duration, class_name: 'PrimitiveDecimal'
    embeds_one :content, class_name: 'Attachment'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash, target=Media.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MediaStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['modality'] = CodeableConcept.transform_json(json_hash['modality']) unless json_hash['modality'].nil?      
      result['view'] = CodeableConcept.transform_json(json_hash['view']) unless json_hash['view'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['createdDateTime'] = PrimitiveDateTime.transform_json(json_hash['createdDateTime'], json_hash['_createdDateTime']) unless json_hash['createdDateTime'].nil?      
      result['createdPeriod'] = Period.transform_json(json_hash['createdPeriod']) unless json_hash['createdPeriod'].nil?      
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['operator'] = Reference.transform_json(json_hash['operator']) unless json_hash['operator'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['deviceName'] = PrimitiveString.transform_json(json_hash['deviceName'], json_hash['_deviceName']) unless json_hash['deviceName'].nil?      
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?      
      result['height'] = PrimitivePositiveInt.transform_json(json_hash['height'], json_hash['_height']) unless json_hash['height'].nil?      
      result['width'] = PrimitivePositiveInt.transform_json(json_hash['width'], json_hash['_width']) unless json_hash['width'].nil?      
      result['frames'] = PrimitivePositiveInt.transform_json(json_hash['frames'], json_hash['_frames']) unless json_hash['frames'].nil?      
      result['duration'] = PrimitiveDecimal.transform_json(json_hash['duration'], json_hash['_duration']) unless json_hash['duration'].nil?      
      result['content'] = Attachment.transform_json(json_hash['content']) unless json_hash['content'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
