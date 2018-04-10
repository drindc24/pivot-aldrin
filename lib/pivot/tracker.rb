module Pivot
  class Tracker
    def self.count(items)
      items.count
    end

    def self.item_for(items, email)
      items.reverse.detect{|item| item[:assignee] == email}
    end

    def self.pivoted?(items, email)
      items.select{|item| item[:assignee] == email}.any?
    end

    def self.total_points(items, options = {})
      return items.select{|item| item[:assignee] == options[:assignee]}.map{|item| item[:points]}.inject(:+) if options[:assignee]

      self.unique_assignees(items).map{|item| item[:points]}.inject(:+)
    end

    def self.unique_assignees(items)
      items.reverse.uniq! {|item| item[:assignee]}.reverse
    end
  end
end