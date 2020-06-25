module FHIR
  # fhir/group_member.rb
  class GroupMember < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupMember'
    embeds_one :entity, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :inactive, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = GroupMember.new
      result['entity'] = Reference.transform_json(json_hash['entity']) unless json_hash['entity'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?      

      result
    end
  end
end
