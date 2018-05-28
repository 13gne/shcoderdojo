require 'rails_helper'

describe Attendance do
  context 'database fields' do
    it { should have_db_column(:student_id) }
    it { should have_db_column(:session_id) }
  end

  context 'associations' do
    it { should belong_to(:student) }
    it { should belong_to(:session) }
  end
end
