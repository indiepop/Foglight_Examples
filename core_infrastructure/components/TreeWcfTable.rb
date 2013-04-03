module WCF
  module Components

    # Represents tree from Wcf component in the application usually by the title.
    class TreeWcfTable < DwrContainer
      # Uses {DwrContainer#initialize} with tree grid locator generation options.
      # @param [String] title of the tree. Very first text (label, title) above the tree.
      # @param [String] under_locator locator of the parent container.
      def initialize(title = nil, under_locator = nil, index = 1)
        index = index.nil? ? "1" : index

        css_class_of_tree_grid = "contains(@class,'tree grid wcfTable') or contains(@class,'tree wcfTable')"
        if title == "[unnamed]" or title.to_s == ''
          super("#{under_locator}//table[#{css_class_of_tree_grid}][#{index}]/tbody")
        else
          super("#{under_locator}//span[text()='#{title}']/following::table[#{css_class_of_tree_grid}][#{index}]/tbody")
        end
      end

      # Splits string by '->' separator and strip every element in result.
      # @param [String] path_string to split.
      # @return [Array<String>] array of stripped elements returned by split.
      # @example
      #  split_path("Tree head -> tree second level element->tree third level element") #=> ["Tree head", "tree second level element", "tree third level element"]
      def split_path(path_string)
        path_string.split('->').map! { |element| element.strip }
      end

      # Expands all element through path.
      # @param [String,Array<String>] mixpath to target element.
      def navigate(mixpath)
        path = mixpath.is_a?(String) ? split_path(mixpath) : Array.new(mixpath)
        path.each_index do |index|
          get_element(path.take(index+1)).expand
        end
      end

      # Retrieve element from inside the tree.
      # @param (see #navigate).
      # @return [TreeWcfTableElement] required element.
      def get_element(mixpath, second_column = nil)
        TreeWcfTableElement.new(@locator, mixpath, second_column)
      end

      # Clicks element inside the tree.
      # @param (see #navigate).
      def click_element(mixpath)
        get_element(mixpath).click
      end

      # Verify that element is inside tree or not.
      # @param (see #navigate).
      # @return [Boolean] true if element found, false otherwise.
      def include_element?(mixpath, second_column = nil, seconds = 2)
        begin
          get_element(mixpath, second_column).wait(seconds)
        rescue RuntimeError
          false
        end
      end

      # Verify that row is inside grid or not.
      # @note Performs {#wait} before acting.
      # @param [Hash{String => String}] row column header => value.
      # @return [Boolean] true if row found, false otherwise.
      def include?(row, second = 5)
        wait
        get_row(row, second).nil? ? false : true
      end

      # Generate locator for the row with specified conditions (values).
      # @param (see #include?)
      # @return [GridWcfTableRow] object with generated locator.
      def get_row(values, second = 5)
        condition = ""
        values.each do |header, value|
          unless condition.empty?
            condition += " and "
          end
          lastpart = ""
          if header != "[unnamed]" and header != ""
            lastpart = "/@column-id=preceding::thead[1]/tr/th/div[.//text()=#{$browser.generate_concat_for_xpath_text header} " +
                "or normalize-space(.//text())=#{$browser.generate_concat_for_xpath_text header}]/@column-id"
          end
          if value =~ /^\[img\](.*)$/ # For the image processing
            condition += "td/div[.//img[contains(@src,#{$browser.generate_concat_for_xpath_text $1})]]#{lastpart}"
          elsif value == "[spark]" # For the spark line processing
            condition += "td/div[.//canvas]#{lastpart}"
          elsif value =~ /^\[fuzzy\](.*)$/
            condition += "td/div[.//*[contains(text(),#{$browser.generate_concat_for_xpath_text $1})]]#{lastpart}"
          elsif value =~ /^\[fuzzy\](.*)$/
            condition += "td/div[.//*[contains(text(),#{$browser.generate_concat_for_xpath_text $1})]]#{lastpart}"
          elsif ['[selected]', '[unselected]'].include?(value)
            condition += "contains(@class,'SelectedRow')"
          else
            condition += "td/div[.//*[contains(text(), #{$browser.generate_concat_for_xpath_text value})]]#{lastpart}"
          end
        end

        while true
          row = GridWcfTableRow.new("#{@locator}/tr[#{condition}]")

          $browser.wait_for_body_text

          if row.wait(second, false)
            return row
          else
            if is_scrollbar_reach_bottom?
              return nil
            else
              drop_vscrollbar
            end
          end
        end
      end


      # Click toolbar button on the top of grid table.
      # @param [String] the title of the toolbar button.
      def click_toolbar_button name
        wait
        Button.new(name, "#{@locator}/ancestor::div[div[@class='toolbar']]/div[@class='toolbar']").click
      end

      # Search specified rows by value.
      # @param [String] value.
      def set_search_field_value value
        search_field = SearchField.new("", "#{@locator}/ancestor::div[div[@class='toolbar']]/div[@class='toolbar']")
        search_field.clear_value
        search_field.set_value(value)
      end

      # click customize object.
      def click_customize
        wait
        element = Element.new("#{@locator}/..//img[contains(@id,'TableCustomizer')]")
        if element.is_present?
          element.click_at("1,1")
        else
          element = Element.new("#{@locator}/ancestor::div[div[@class='toolbar']]/div[@class='toolbar']//img[contains(@id,'TableCustomizer')]")
          if element.is_present?
            element.click_at("1,1")
          else
            element = Element.new("#{@locator}/ancestor::div[span[@class='wcfTableCustomizerFiller grid' or @wcf:classname='wcfTableCustomizerFiller grid']]//img[contains(@id,'TableCustomizer')]")
            if element.is_present?
              element.click_at("1,1")
            else
              raise RuntimeError, "This customize isn't found."
            end
          end
        end
      end

      # Get specified element which text is specified.
      # @param [String] element's text'.
      # @return [Element]
      def get_value(key)
        Element.new("#{@locator}//*[text()='#{key}']")
      end


      # Click vscrollbar object to drop page down.
      def drop_vscrollbar
        element = Element.new("(#{@locator}/ancestor::div | #{@locator}/following::div)[div[@class='vscrollbar']]/div[@class='vscrollbar']/div[contains(@class,'down')]")
        element.click
      end

      # Verify scroll bar reach bottom or not
      # @return [Boolean] true or false
      def is_scrollbar_reach_bottom?
        begin
          thumb = Element.new("(#{@locator}/ancestor::div | #{@locator}/following::div)[div[@class='vscrollbar']]/div[@class='vscrollbar']/div[contains(@class,'thumb')]")
          if thumb.is_present?
            $browser.execute_script("var evt = document.createEvent('MouseEvents');" +
                                        "evt.initMouseEvent('mouseover',true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0,null);" +
                                        "arguments[0].dispatchEvent(evt);", thumb.get_element)

            tracker_tip = Element.new("//div[@id='trackerDwell' and @class='tooltip']")
            tracker_text = tracker_tip.text.strip

            if tracker_text =~ /(\d+)-(\d+)\/(\d+)/
              return $2 == $3
            else
              raise "Tool tip not match /(\\d+)-(\\d+)\\/(\\d+)/"
            end
          else
            return true
          end
        rescue Exception => e
          raise "Scroll bar reach bottom has exception: #{e}"
        end
      end
    end
  end
end
