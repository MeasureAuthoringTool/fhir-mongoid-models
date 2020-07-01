module FHIR
  # fhir/goal_target.rb
  class GoalTarget < BackboneElement
    include Mongoid::Document
    embeds_one :measure, class_name: 'CodeableConcept'
    embeds_one :detailQuantity, class_name: 'Quantity'
    embeds_one :detailRange, class_name: 'Range'
    embeds_one :detailCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :detailString, class_name: 'PrimitiveString'
    embeds_one :detailBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :detailInteger, class_name: 'PrimitiveInteger'
    embeds_one :detailRatio, class_name: 'Ratio'
    embeds_one :dueDate, class_name: 'PrimitiveDate'
    embeds_one :dueDuration, class_name: 'Duration'

    def self.transform_json(json_hash, target = GoalTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['measure'] = CodeableConcept.transform_json(json_hash['measure']) unless json_hash['measure'].nil?      
      result['detailQuantity'] = Quantity.transform_json(json_hash['detailQuantity']) unless json_hash['detailQuantity'].nil?      
      result['detailRange'] = Range.transform_json(json_hash['detailRange']) unless json_hash['detailRange'].nil?      
      result['detailCodeableConcept'] = CodeableConcept.transform_json(json_hash['detailCodeableConcept']) unless json_hash['detailCodeableConcept'].nil?      
      result['detailString'] = PrimitiveString.transform_json(json_hash['detailString'], json_hash['_detailString']) unless json_hash['detailString'].nil?      
      result['detailBoolean'] = PrimitiveBoolean.transform_json(json_hash['detailBoolean'], json_hash['_detailBoolean']) unless json_hash['detailBoolean'].nil?      
      result['detailInteger'] = PrimitiveInteger.transform_json(json_hash['detailInteger'], json_hash['_detailInteger']) unless json_hash['detailInteger'].nil?      
      result['detailRatio'] = Ratio.transform_json(json_hash['detailRatio']) unless json_hash['detailRatio'].nil?      
      result['dueDate'] = PrimitiveDate.transform_json(json_hash['dueDate'], json_hash['_dueDate']) unless json_hash['dueDate'].nil?      
      result['dueDuration'] = Duration.transform_json(json_hash['dueDuration']) unless json_hash['dueDuration'].nil?      

      result
    end
  end
end
