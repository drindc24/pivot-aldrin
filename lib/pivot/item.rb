module Pivot
  class Item
    attr_accessor :name, :assignee, :points

    def initialize(params = {})
      params.each{ |key, value| send("#{key}=", value) }
    end

    def project_code
      name.split("-")[0]
    end

    def +(value)
      points + value.points
    end

    def valid?
      ["EREC", "AZR"].any?{|code| name.include?(code)}
    end
  end
end