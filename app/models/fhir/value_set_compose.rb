module FHIR
  # fhir/value_set_compose.rb
  class ValueSetCompose < BackboneElement
    include Mongoid::Document
    embeds_one :lockedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :inactive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :include, class_name: 'FHIR::ValueSetComposeInclude'    
    embeds_many :exclude, class_name: 'FHIR::ValueSetComposeInclude'    

    def self.transform_json(json_hash, target = ValueSetCompose.new)
      result = self.superclass.transform_json(json_hash, target)
      result['lockedDate'] = PrimitiveDate.transform_json(json_hash['lockedDate'], json_hash['_lockedDate']) unless json_hash['lockedDate'].nil?
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?
      result['include'] = json_hash['include'].map { |var| ValueSetComposeInclude.transform_json(var) } unless json_hash['include'].nil?
      result['exclude'] = json_hash['exclude'].map { |var| ValueSetComposeInclude.transform_json(var) } unless json_hash['exclude'].nil?

      result
    end
  end
end
