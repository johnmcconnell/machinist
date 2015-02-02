module Machinist
  class Table
    reader_struct :rows

    def head_row
      @head_row ||= rows.first
    end

    def value_rows
      @value_rows ||= rows[1..-1]
    end

    def to_h
      @to_h ||=
      begin
        value_rows.map do |row|
          (0...row.size).each_with_object({}) do |index, hash|
            hash[head_row[index]] = row[index]
          end
        end
      end
    end
  end
end
