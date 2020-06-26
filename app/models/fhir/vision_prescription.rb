module FHIR
  # fhir/vision_prescription.rb
  class VisionPrescription < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionPrescription'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'VisionStatus'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :dateWritten, class_name: 'PrimitiveDateTime'
    embeds_one :prescriber, class_name: 'Reference'
    embeds_many :lensSpecification, class_name: 'VisionPrescriptionLensSpecification'

    def self.transform_json(json_hash)
      result = VisionPrescription.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = VisionStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['dateWritten'] = PrimitiveDateTime.transform_json(json_hash['dateWritten'], json_hash['_dateWritten']) unless json_hash['dateWritten'].nil?      
      result['prescriber'] = Reference.transform_json(json_hash['prescriber']) unless json_hash['prescriber'].nil?      
      result['lensSpecification'] = json_hash['lensSpecification'].map { |var| VisionPrescriptionLensSpecification.transform_json(var) } unless json_hash['lensSpecification'].nil?

      result
    end
  end
end
