module FHIR
  # fhir/list_entry.rb
  class ListEntry < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ListEntry'
    embeds_one :flag, class_name: 'CodeableConcept'
    embeds_one :deleted, class_name: 'PrimitiveBoolean'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :item, class_name: 'Reference'

    def self.transform_json(json_hash, target=ListEntry.new)
      result = self.superclass.transform_json(json_hash, target)
      result['flag'] = CodeableConcept.transform_json(json_hash['flag']) unless json_hash['flag'].nil?      
      result['deleted'] = PrimitiveBoolean.transform_json(json_hash['deleted'], json_hash['_deleted']) unless json_hash['deleted'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['item'] = Reference.transform_json(json_hash['item']) unless json_hash['item'].nil?      

      result
    end
  end
end
