class MemberList
  attr_reader :members

  def initialize(member_class = Member, members = [])
    @member_class = member_class
    @members = members
  end

  def add(id, name)
    members.push(@member_class.new(id, name))
  end

  def assign_book(id, book_name)
    member = find_member_by_id(id)
    member.check_out(book_name)
  end

  def return_book(id, book_name)
    member = find_member_by_id(id)
    member.return_item(book_name)
  end

  def view_member(id)
    member = find_member_by_id(id)
    member.display_details
  end

  private

  def find_member_by_id(id)
    members.find { |member| member.id == id }
  end
end
