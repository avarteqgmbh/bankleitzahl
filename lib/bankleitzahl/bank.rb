module Bankleitzahl
  class Bank < Struct.new(:blz, :name, :short_name, :zip, :city, :bic)
  end
end
