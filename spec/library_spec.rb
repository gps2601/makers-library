require 'library'

describe Library do
  subject(:library)       { described_class.new(member_list_class) }
  let(:member_list_class) { double(:member_list_class, new: member_list) }
  let(:member_list)       { double(:member_list) }

  describe 'add_member' do
    it('tells the member list to add a member') do
      expect(member_list).to receive(:add)
      library.add_member('12345', 'Bananaman')
    end
  end

  describe '#assign_book' do
    it 'tells the member list to assign a book to a member' do
      expect(member_list).to receive(:assign_book).with(1, "a book")
      library.assign_book(1, "a book")
    end
  end

  describe '#return_book' do
    it 'tells the member list to return a book from a member' do
      expect(member_list).to receive(:return_book).with(1, "a book")
      library.return_book(1, "a book")
    end
  end
end
