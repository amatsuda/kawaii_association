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

  class OptionEvaluator < BasicObject
    attr_reader :opts

    def initialize
      @opts = {}
    end

    def method_missing(name, value)
      @opts[name] = value
    end
  end

  class Evaluator < BasicObject
    def initialize(model, type)
      @model, @type = model, type
    end

    def method_missing(name, *scope, **opts, &opt_block)
      if opt_block
        opt_evaluator = OptionEvaluator.new
        opt_evaluator.instance_eval(&opt_block)
        opts.merge!(opt_evaluator.opts)
      end
      @model.method(@type).super_method.call name, *scope, **opts
    end
  end
end

ActiveSupport.on_load :active_record do
  extend KawaiiAssociation::AssociationWrapper
end
