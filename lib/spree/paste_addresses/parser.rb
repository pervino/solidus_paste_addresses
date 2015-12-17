require 'street_address'

module Spree
  module PasteAddresses
    class Parser

      def initialize(address)
        @address = address
      end

      def to_h
        firstname, lastname, company, phone = ""

        lines = @address.split("\n")

        # Parse name
        if (name = /^(\S*).*?(\S*)$/.match(lines[0]))
          firstname = name[1]
          lastname = name[2]
          lines.shift
        end

        # Parse company
        if (!Spree::Config[:company] && !(lines[0] =~ /^\d.*/))
          company = lines.shift
        end

        # Parse phone
        if (lines[-1] =~ /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/)
          phone = lines.pop
        end

        street_address = StreetAddress::US.parse(lines.join(" "))

        {
            firstname: firstname,
            lastname: lastname,
            company: company,
            phone: phone,
            address1: street_address.try(:line1),
            address2: street_address.try(:line2),
            city: street_address.try(:city),
            state: street_address.try(:state),
            state_name: street_address.try(:state_name),
            zipcode: street_address.try(:postal_code)
        }
      end
    end
  end
end