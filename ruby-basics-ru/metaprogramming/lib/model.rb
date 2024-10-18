# frozen_string_literal: true
require 'date'

# BEGIN
module Model
  attr_reader :attributes

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(attributes = {})
    @attributes = {}
    attributes.each do |name, value|
      self.send("#{name}=", value)
    end
    self.private_methods.each do |method|
      if method.to_s.end_with?("_metadata")
        meta = self.send(method)
        if @attributes[meta[:name]].nil?
          self.send("#{meta[:name]}=", meta[:default])
        end
      end
    end
  end

  private

  def value_to_correct_type(name, value)
    type = self.send("#{name}_metadata")[:type]
    return nil if value.nil?
    
    case type
    when :string
      value.to_s
    when :integer
      value.to_i
    when :datetime
      DateTime.parse(value)
    when :nil  
      value
    when :boolean
      value  
    else
      raise "Can't covert value to #{type}"
    end
  end

  module ClassMethods
    def attribute(name, options = {})
      define_method "#{name}" do
        self.instance_variable_get "@#{name}"
      end 

      define_method "#{name}=" do |value|
        converted_value = self.send(:value_to_correct_type, name, value)
        self.instance_variable_set "@#{name}", converted_value
        @attributes[name.to_sym] = converted_value
      end

      define_method "#{name}_metadata" do
        { name: name.to_sym, type: options[:type], default: options[:default] }
      end

      private "#{name}_metadata".to_sym
    end
  end
end
# END
