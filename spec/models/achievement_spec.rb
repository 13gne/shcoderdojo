require 'rails_helper'

describe Achievement do
  context 'database fields' do
    it { should have_db_column(:topic_id) }
    it { should have_db_column(:belt_id) }
  end

  context 'associations' do
    it { should belong_to(:topic) }
    it { should belong_to(:belt) }
  end
end
