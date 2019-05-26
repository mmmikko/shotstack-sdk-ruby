=begin
#shotstack

#The Shotstack API is a video editing service that allows for the programatic creation of videos using JSON. 

OpenAPI spec version: v1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.0.0-beta3

=end

require 'date'

module Shotstack
  # A clip is a container for a specific type of asset, i.e. a title, photo or video. You use a Clip to define when an asset will display on the timeline, how long it will play for and transitions and effects to apply to it. 
  class Clip
    # The type of asset to display for the duration of this Clip. Value must be one of <b>TitleAsset</b>, <b>ImageAsset</b> or <b>VideoAsset</b>. 
    attr_accessor :asset

    # The start position of the Clip on the timeline, in seconds.
    attr_accessor :start

    # The length, in seconds, the Clip should play for.
    attr_accessor :length

    attr_accessor :transition

    # A motion effect to apply to the Clip.
    attr_accessor :effect

    # A filter effect to apply to the Clip.
    attr_accessor :filter

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'asset' => :'asset',
        :'start' => :'start',
        :'length' => :'length',
        :'transition' => :'transition',
        :'effect' => :'effect',
        :'filter' => :'filter'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'asset' => :'Asset',
        :'start' => :'Float',
        :'length' => :'Float',
        :'transition' => :'Transition',
        :'effect' => :'String',
        :'filter' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Shotstack::Clip` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Shotstack::Clip`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'asset')
        self.asset = attributes[:'asset']
      end

      if attributes.key?(:'start')
        self.start = attributes[:'start']
      end

      if attributes.key?(:'length')
        self.length = attributes[:'length']
      end

      if attributes.key?(:'transition')
        self.transition = attributes[:'transition']
      end

      if attributes.key?(:'effect')
        self.effect = attributes[:'effect']
      end

      if attributes.key?(:'filter')
        self.filter = attributes[:'filter']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @asset.nil?
        invalid_properties.push('invalid value for "asset", asset cannot be nil.')
      end

      if @start.nil?
        invalid_properties.push('invalid value for "start", start cannot be nil.')
      end

      if @length.nil?
        invalid_properties.push('invalid value for "length", length cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @asset.nil?
      return false if @start.nil?
      return false if @length.nil?
      effect_validator = EnumAttributeValidator.new('String', ["zoomIn", "zoomOut", "slideLeft", "slideRight", "slideUp", "slideDown"])
      return false unless effect_validator.valid?(@effect)
      filter_validator = EnumAttributeValidator.new('String', ["boost", "contrast", "darken", "greyscale", "lighten", "muted", "negative"])
      return false unless filter_validator.valid?(@filter)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] effect Object to be assigned
    def effect=(effect)
      validator = EnumAttributeValidator.new('String', ["zoomIn", "zoomOut", "slideLeft", "slideRight", "slideUp", "slideDown"])
      unless validator.valid?(effect)
        fail ArgumentError, "invalid value for \"effect\", must be one of #{validator.allowable_values}."
      end
      @effect = effect
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] filter Object to be assigned
    def filter=(filter)
      validator = EnumAttributeValidator.new('String', ["boost", "contrast", "darken", "greyscale", "lighten", "muted", "negative"])
      unless validator.valid?(filter)
        fail ArgumentError, "invalid value for \"filter\", must be one of #{validator.allowable_values}."
      end
      @filter = filter
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          asset == o.asset &&
          start == o.start &&
          length == o.length &&
          transition == o.transition &&
          effect == o.effect &&
          filter == o.filter
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [asset, start, length, transition, effect, filter].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        Shotstack.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end