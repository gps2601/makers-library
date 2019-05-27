class Member
  attr_reader :id_number, :name, :checked_out_items

  def initialize(id_number, name)
    @id_number = id_number
    @name = name
    @checked_out_items = []
  end

  def check_out(item)
    checked_out_items.push(item)
  end

  def return_item(item)
    raise 'Item has not been checked out!' unless checked_out_items.include?(item)

    checked_out_items.delete(item)
  end

  def display_details
    "ID: #{id_number}, Name: #{name}, Checked out: #{checked_out_items}"
  end
end
