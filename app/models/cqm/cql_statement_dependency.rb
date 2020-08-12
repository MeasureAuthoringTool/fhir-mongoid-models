module CQM
  # Statement is a given CQL Statement within a CQL Library, which has many dependencies
  class StatementDependency
    include Mongoid::Document
    embedded_in :cql_library

    field :statement_name, type: String
    embeds_many :statement_references

    def as_json(*args)
      result = Hash.new
      unless self.statement_name.nil?
        result['statement_name'] = self.statement_name
      end
      unless self.statement_references.nil?  || !self.statement_references.any?
        result['statement_references'] = self.statement_references.map{ |x| x.as_json(*args) }
      end

      result
    end

    def self.transform_json(json_hash, target = StatementDependency.new)
      result = target
      result['statement_name'] = json_hash['statement_name'] unless json_hash['statement_name'].nil?
      result['statement_references'] = json_hash['statement_references'].map { |var| CQM::StatementReference.transform_json(var) } unless json_hash['statement_references'].nil?

      result
    end
  end

  # StatementReference notes a CQL Library/Statement which a given Statement (in which it is embedded) relies upon. This
  # is also used for populations/stratifications/SDEs to reference their defining statement.
  class StatementReference
    include Mongoid::Document
    embedded_in :statement_dependency
    # embedded_in :population_set
    # embedded_in :population_map
    # embedded_in :stratification

    field :library_name, type: String
    field :statement_name, type: String
    field :set_id, type: String

    def as_json(*args)
      result = Hash.new
      unless self.library_name.nil?
        result['library_name'] = self.library_name
      end
      unless self.statement_name.nil?
        result['statement_name'] = self.statement_name
      end
      unless self.hqmf_id.nil?
        result['hqmf_id'] = self.hqmf_id
      end

      result
    end

    def self.transform_json(json_hash, target = StatementReference.new)
      result = target
      result['library_name'] = json_hash['library_name'] unless json_hash['library_name'].nil?
      result['statement_name'] = json_hash['statement_name'] unless json_hash['statement_name'].nil?
      result['hqmf_id'] = json_hash['hqmf_id'] unless json_hash['hqmf_id'].nil?

      result
    end
  end
end
