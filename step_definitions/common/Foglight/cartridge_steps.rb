And /^The following cartridges should exist in (.+) list.*/ do |what, parameters|
  # ...
  cartridges_list = $context['result'].split(/------------------------------------/)

  params = parameters.raw.collect { |element| element.to_s }
  params.each do |cartridge|
    found = false
    cartridges_list.each do |data|
      if data =~ Regexp.new(cartridge)
        found = true
      end
    end

    if found
      puts "#{cartridge} is exist in #{what} list!"
    else
      raise RuntimeError, "Can't find #{cartridge} cartridge in #{what} list, please check!"
    end
  end
end

Then /^I check whether cartridge deploy successfully by the following parameters$/ do

end