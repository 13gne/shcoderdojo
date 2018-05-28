describe Belt do
  context 'database fields' do
    it { should have_db_column(:name) }
    it { should have_db_column(:sequence) }
  end

  context 'associations' do
    it { should have_many(:achievements) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sequence) }
  end
end
