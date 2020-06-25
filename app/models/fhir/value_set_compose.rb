module FHIR
  # fhir/value_set_compose.rb
  class ValueSetCompose < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetCompose'
    embeds_one :lockedDate, class_name: 'PrimitiveDate'
    embeds_one :inactive, class_name: 'PrimitiveBoolean'
    embeds_many :include, class_name: 'ValueSetComposeInclude'
    embeds_many :exclude, class_name: 'ValueSetComposeInclude'

    def self.transform_json(json_hash)
      result = ValueSetCompose.new
      result['lockedDate'] = PrimitiveDate.transform_json(json_hash['lockedDate'], json_hash['_lockedDate']) unless json_hash['lockedDate'].nil?      
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?      
      result['include'] = json_hash['include'].map { |var| ValueSetComposeInclude.transform_json(var) } unless json_hash['include'].nil?
      result['exclude'] = json_hash['exclude'].map { |var| ValueSetComposeInclude.transform_json(var) } unless json_hash['exclude'].nil?

      result
    end
  end
end
