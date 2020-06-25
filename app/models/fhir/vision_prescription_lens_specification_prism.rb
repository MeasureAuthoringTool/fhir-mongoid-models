module FHIR
  # fhir/vision_prescription_lens_specification_prism.rb
  class VisionPrescriptionLensSpecificationPrism < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionPrescriptionLensSpecificationPrism'
    embeds_one :amount, class_name: 'PrimitiveDecimal'
    embeds_one :base, class_name: 'VisionBase'

    def self.transform_json(json_hash)
      result = VisionPrescriptionLensSpecificationPrism.new
      result['amount'] = PrimitiveDecimal.transform_json(json_hash['amount'], json_hash['_amount']) unless json_hash['amount'].nil?      
      result['base'] = VisionBase.transform_json(json_hash['base']) unless json_hash['base'].nil?      

      result
    end
  end
end
