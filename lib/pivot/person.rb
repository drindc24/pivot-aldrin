module Pivot
  class Person
    attr_accessor :items, :email, :first_name, :last_name

    def initialize(params = {})
      params.each{ |key, value| send("#{key}=", value) }

      @items = []
    end

    def add_item(item, &block)
      item.assignee = email
      items << item

      block.call if block_given?
    end
  end
end