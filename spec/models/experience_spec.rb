require 'spec_helper'

describe Experience do
  describe '.approved' do
    it 'shows only approved experiences' do
      approved_experience = create(:experience, is_approved: true)
      not_approved_experience = create(:experience)

      experiences = Experience.approved

      expect(experiences).to match_array([approved_experience])
    end
  end
end
