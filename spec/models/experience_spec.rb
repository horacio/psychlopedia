require 'rails_helper'

describe Experience do
  describe Experience, 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :pseudonym }
  end

  describe '.approved' do
    it 'returns an array of approved experiences' do
      approved_experience = create(:experience, is_approved: true)
      new_experience = create(:experience)

      experiences = Experience.approved

      expect(experiences).to match_array([approved_experience])
    end
  end
end

