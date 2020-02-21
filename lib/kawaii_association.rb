# frozen_string_literal: true

require 'kawaii_association/version'

module KawaiiAssociation
  module AssociationWrapper
    %i(has_many has_one belongs_to).each do |type|
      define_method type do |name = nil, _scope = nil, **, &block|
        if name
          super
        else
          Evaluator.new(self, type).instance_eval(&block)
        end
      end
    end
  end

  class Evaluator < BasicObject
    def initialize(model, type)
      @model, @type = model, type
    end

    def method_missing(name, *scope, **opts, &extension)
      @model.method(@type).super_method.call name, *scope, **opts, &extension
    end
  end
end

ActiveSupport.on_load :active_record do
  extend KawaiiAssociation::AssociationWrapper
end
