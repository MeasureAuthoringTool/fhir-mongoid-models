module FHIR
  # fhir/group_member.rb
  class GroupMember < BackboneElement
    include Mongoid::Document
    embeds_one :entity, class_name: 'FHIR::Reference'
    embeds_one :period, class_name: 'FHIR::Period'
    embeds_one :inactive, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = GroupMember.new)
      result = self.superclass.transform_json(json_hash, target)
      result['entity'] = Reference.transform_json(json_hash['entity']) unless json_hash['entity'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?      

      result
    end
  end
end
