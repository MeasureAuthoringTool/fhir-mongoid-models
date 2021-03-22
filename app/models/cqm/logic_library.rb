module CQM
  # CqlElmLibrary encapsulates what used to be a Hash in Ruby, by explicitly specifying
  # a library ID, and the CQL string for that library
  class LogicLibrary
    include Mongoid::Document
    embedded_in :measure

    field :library_name, type: String
    field :library_version, type: String
    field :cql, type: String
    field :elm, type: Hash
    field :elm_annotations, type: Hash
    field :is_main_library, type: Boolean, default: false

    # Currently this is only relevant for cql libraries that are included in composite measures,
    # true indicates the library files are in the "top level" folder of the measure package, rather
    # than coming from a component measure folder.
    # field :is_top_level, type: Boolean, default: true

    embeds_many :statement_dependencies, class_name: 'CQM::StatementDependency'

    def as_json(*args)
      result = Hash.new
      unless self.library_name.nil?
        result['library_name'] = self.library_name
      end
      unless self.library_version.nil?
        result['library_version'] = self.library_version
      end
      unless self.cql.nil?
        result['cql'] = self.cql
      end
      unless self.elm.nil?
        result['elm'] = self.elm
      end
      unless self.elm_annotations.nil?
        result['elm_annotations'] = self.elm_annotations
      end
      unless self.is_main_library.nil?
        result['is_main_library'] = self.is_main_library
      end
      unless self.statement_dependencies.nil?  || !self.statement_dependencies.any?
        result['statement_dependencies'] = self.statement_dependencies.map{ |x| x.as_json(*args) }
      end

      result
    end

    def self.transform_json(json_hash, target = LogicLibrary.new)
      result = target
      result['library_name'] = json_hash['library_name'] unless json_hash['library_name'].nil?
      result['library_version'] = json_hash['library_version'] unless json_hash['library_version'].nil?
      result['cql'] = json_hash['cql'] unless json_hash['cql'].nil?
      result['elm'] = json_hash['elm'] unless json_hash['elm'].nil?
      result['elm_annotations'] = json_hash['elm_annotations'] unless json_hash['elm_annotations'].nil?
      result['is_main_library'] = json_hash['is_main_library'] unless json_hash['is_main_library'].nil?
      result['statement_dependencies'] = json_hash['statement_dependencies'].map { |var| CQM::StatementDependency.transform_json(var) } unless json_hash['statement_dependencies'].nil?

      result
    end
  end
end
