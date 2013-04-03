module WCF
  module Components

    # Represents inline text editor in the application.
    class InlineTextEditor < DwrElement

      def initialize(under_locator = nil)
        super("#{under_locator}//div[contains(@class, 'inlineTextEditor')]/input")
      end

      def blur
        # click on the tooltip, and let the editor blur
        book_body = Element.new("//div[@id='bookBody']")
        10.downto(1) do
          book_body.click
          sleep 0.1
          print '.'
        end
      end
    end
  end
end
