describe CourseRegistration do
  context 'database fields' do
    it { should have_db_column(:user_id) }
    it { should have_db_column(:student_id) }
    it { should have_db_column(:course_id) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:student) }
    it { should belong_to(:course) }
  end

  context 'validations' do
    context 'achieved minimum level' do
      before { allow(subject).to receive(:minimum_level_achieved).and_return(true) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:student_id) }
      it { should validate_presence_of(:course_id) }
    end
  end
end
