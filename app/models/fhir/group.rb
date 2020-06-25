module FHIR
  # fhir/group.rb
  class Group < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Group'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_one :type, class_name: 'GroupType'
    embeds_one :actual, class_name: 'PrimitiveBoolean'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :quantity, class_name: 'PrimitiveUnsignedInt'
    embeds_one :managingEntity, class_name: 'Reference'
    embeds_many :characteristic, class_name: 'GroupCharacteristic'
    embeds_many :member, class_name: 'GroupMember'

    def self.transform_json(json_hash)
      result = Group.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['type'] = GroupType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['actual'] = PrimitiveBoolean.transform_json(json_hash['actual'], json_hash['_actual']) unless json_hash['actual'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['quantity'] = PrimitiveUnsignedInt.transform_json(json_hash['quantity'], json_hash['_quantity']) unless json_hash['quantity'].nil?      
      result['managingEntity'] = Reference.transform_json(json_hash['managingEntity']) unless json_hash['managingEntity'].nil?      
      result['characteristic'] = json_hash['characteristic'].map { |var| GroupCharacteristic.transform_json(var) } unless json_hash['characteristic'].nil?
      result['member'] = json_hash['member'].map { |var| GroupMember.transform_json(var) } unless json_hash['member'].nil?

      result
    end
  end
end
