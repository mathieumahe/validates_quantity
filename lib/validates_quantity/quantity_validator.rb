module ActiveModel
  module Validations
    class QuantityValidator < EachValidator
      CHECKS = { greater_than: :>, greater_than_or_equal_to: :>=,
                 equal_to: :==, less_than: :<, less_than_or_equal_to: :<=,
                 odd: :odd?, even: :even?, other_than: :!= }.freeze

      def check_validity!
        keys = CHECKS.keys - [:odd, :even]
        options.slice(*keys).each do |option, value|
          unless value.is_a?(Numeric) || value.is_a?(Proc) || value.is_a?(Symbol)
            raise ArgumentError, ":#{option} must be a number, a symbol or a proc"
          end
        end
      end

      def validate_each(record, attr_name, associations)
        return if options[:allow_blank] and associations.allow_blank?

        value = associations.size
        options.slice(*CHECKS.keys).each do |option, option_value|
          case option
            when :odd, :even
              unless value.to_i.send(CHECKS[option])
                record.errors.add(attr_name, option, filtered_options(value))
              end
            else
              case option_value
                when Proc
                  option_value = option_value.call(record)
                when Symbol
                  option_value = record.send(option_value)
              end

              unless value.send(CHECKS[option], option_value)
                record.errors.add(attr_name, option, filtered_options(value).merge!(count: option_value))
              end
          end
        end
      end

      protected

      def filtered_options(value)
        filtered = options.except(*CHECKS.keys)
        filtered[:value] = value
        filtered
      end
    end

    module HelperMethods
      def validates_quantity_of(*attr_names)
        validates_with QuantityValidator, _merge_attributes(attr_names)
      end
    end
  end
end