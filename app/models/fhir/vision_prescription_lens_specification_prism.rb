module FHIR
  # fhir/vision_prescription_lens_specification_prism.rb
  class VisionPrescriptionLensSpecificationPrism < BackboneElement
    include Mongoid::Document
    embeds_one :amount, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :base, class_name: 'FHIR::VisionBase'

    def self.transform_json(json_hash, target = VisionPrescriptionLensSpecificationPrism.new)
      result = self.superclass.transform_json(json_hash, target)
      result['amount'] = PrimitiveDecimal.transform_json(json_hash['amount'], json_hash['_amount']) unless json_hash['amount'].nil?      
      result['base'] = VisionBase.transform_json(json_hash['base']) unless json_hash['base'].nil?      

      result
    end
  end
end
