describe Course do
  context 'database fields' do
    it { should have_db_column(:name) }
    it { should have_db_column(:start_date) }
    it { should have_db_column(:end_date) }
    it { should have_db_column(:description) }
    it { should have_db_column(:max_students) }
    it { should have_db_column(:enrollable) }
    it { should have_db_column(:current) }
    it { should have_db_column(:resources) }
    it { should have_db_column(:published) }
    it { should have_db_column(:minimum_level) }
  end

  context 'associations' do
    it { should have_many(:course_registrations) }
    it { should have_many(:sessions) }
    it { should have_many(:students) }
    it { should have_many(:attendances) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:max_students) }
  end
end
