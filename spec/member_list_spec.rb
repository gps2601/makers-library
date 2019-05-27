require 'member_list'

describe MemberList do
  subject(:list)      { described_class.new(member_class) }
  let(:member_class)  { double(:member_class, new: member) }
  let(:member)        { double(:member) }

  it 'initializes with an emtpy list of members' do
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
end
