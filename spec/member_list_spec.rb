require 'member_list'

describe MemberList do
  subject(:list)      { described_class.new(member_class) }
  let(:member_class)  { double(:member_class, new: member) }
  let(:member)        { double(:member) }

  it 'initializes with an empty list of members' do
    expect(list.members).to be_empty
  end

  describe '#add' do
    it 'creates a new user' do
      expect(member_class).to receive(:new)
      list.add('12345', 'Bananaman')
    end

    it 'adds a member to the list' do
      list.add('12345', 'Bananaman')
      expect(list.members.length).to be(1)
    end
  end

  describe '#remove' do
    it 'removes a user from the list' do
    end
  end

  describe '#assign_book' do
    it 'can assign a book to a member in the list of they exist with the id' do
      matching_id_double = double('matching_id_double', id: 7)
      allow(matching_id_double).to receive(:check_out).with('a book')
      id_double_1 = double('id_double_1', id: 5)
      id_double_2 = double('id_double_2', id: 10)
      id_double_3 = double('id_double_3', id: 15)
      list = described_class.new(member_class,
                                 [id_double_1, id_double_2, matching_id_double, id_double_3])
      expect(matching_id_double).to receive(:check_out).with('a book')

      list.assign_book(7, 'a book')
    end
  end

  describe '#return_book' do
    it 'can return a book from a member in the list of they exist with the id' do
      matching_id_double = double('matching_id_double', id: 7)
      allow(matching_id_double).to receive(:return_item).with('a book')
      id_double_1 = double('id_double_1', id: 5)
      id_double_2 = double('id_double_2', id: 10)
      id_double_3 = double('id_double_3', id: 15)
      list = described_class.new(member_class,
                                 [id_double_1, id_double_2, matching_id_double, id_double_3])
      expect(matching_id_double).to receive(:return_item).with('a book')

      list.return_book(7, 'a book')
    end
  end

  describe '#view_member' do
    it 'can view a member in the list of they exist with the id' do
      matching_id_double = double('matching_id_double', id: 7)
      allow(matching_id_double).to receive(:display_details)
      id_double_1 = double('id_double_1', id: 5)
      id_double_2 = double('id_double_2', id: 10)
      id_double_3 = double('id_double_3', id: 15)
      list = described_class.new(member_class,
                                 [id_double_1, id_double_2, matching_id_double, id_double_3])
      expect(matching_id_double).to receive(:display_details)

      list.view_member(7)
    end
  end
end
