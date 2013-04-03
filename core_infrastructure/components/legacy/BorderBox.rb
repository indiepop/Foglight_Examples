module WCF
  module Components

    # Represents border boxes in the application by the title.
    class BorderBox < DwrContainer
      # Uses {DwrContainer#initialize} with border box locator generation options.
      # @param [String] title of the border box.
      # @param [String] under_locator locator of the parent container.
      def initialize(title, under_locator = nil)
        super("#{under_locator}//div[contains(@class, 'border')][div[1][contains(text(),'#{title}')]
              or div[2][contains(.,'#{title}')]]")
      end
    end
  end
end