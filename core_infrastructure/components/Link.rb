module WCF
  module Components

    # Represents link in the application that contains specified text.
    class Link < DwrElement
      # Uses {DwrElement#initialize} with link locator generation options.
      # @param [String] name text inside looking link.
      # @param [String] under_locator locator of the parent container.
      def initialize(name, under_locator = nil, index = 1)
        condition = "[contains(.,'#{name}') or span[.='#{name}']][#{index}]"
        if Object.new("#{under_locator}//descendant-or-self::a#{condition}").is_present?
          super("#{under_locator}//descendant-or-self::a#{condition}")
        elsif Object.new("#{under_locator}//descendant-or-self::li#{condition}").is_present?
          super("#{under_locator}//descendant-or-self::li#{condition}")
        end
        #super("(#{under_locator}//descendant-or-self::a#{condition} | #{under_locator}//descendant-or-self::li#{condition})")
        # TODO replace contains with =
      end
    end
  end
end