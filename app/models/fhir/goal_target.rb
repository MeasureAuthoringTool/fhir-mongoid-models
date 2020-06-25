module FHIR
  # fhir/goal_target.rb
  class GoalTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GoalTarget'
    embeds_one :measure, class_name: 'CodeableConcept'
    embeds_one :detailQuantity, class_name: 'Quantity'
    embeds_one :detailRange, class_name: 'Range'
    embeds_one :detailCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :detailstring, class_name: 'PrimitiveString'
    embeds_one :detailboolean, class_name: 'PrimitiveBoolean'
    embeds_one :detailinteger, class_name: 'PrimitiveInteger'
    embeds_one :detailRatio, class_name: 'Ratio'
    embeds_one :duedate, class_name: 'PrimitiveDate'
    embeds_one :dueDuration, class_name: 'Duration'

    def self.transform_json(json_hash)
      result = GoalTarget.new
      result['measure'] = CodeableConcept.transform_json(json_hash['measure']) unless json_hash['measure'].nil?      
      result['detailQuantity'] = Quantity.transform_json(json_hash['detailQuantity']) unless json_hash['detailQuantity'].nil?      
      result['detailRange'] = Range.transform_json(json_hash['detailRange']) unless json_hash['detailRange'].nil?      
      result['detailCodeableConcept'] = CodeableConcept.transform_json(json_hash['detailCodeableConcept']) unless json_hash['detailCodeableConcept'].nil?      
      result['detailstring'] = PrimitiveString.transform_json(json_hash['detailstring'], json_hash['_detailstring']) unless json_hash['detailstring'].nil?      
      result['detailboolean'] = PrimitiveBoolean.transform_json(json_hash['detailboolean'], json_hash['_detailboolean']) unless json_hash['detailboolean'].nil?      
      result['detailinteger'] = PrimitiveInteger.transform_json(json_hash['detailinteger'], json_hash['_detailinteger']) unless json_hash['detailinteger'].nil?      
      result['detailRatio'] = Ratio.transform_json(json_hash['detailRatio']) unless json_hash['detailRatio'].nil?      
      result['duedate'] = PrimitiveDate.transform_json(json_hash['duedate'], json_hash['_duedate']) unless json_hash['duedate'].nil?      
      result['dueDuration'] = Duration.transform_json(json_hash['dueDuration']) unless json_hash['dueDuration'].nil?      

      result
    end
  end
end
