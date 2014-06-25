require 'rails_helper'

describe Experience, 'associations' do
  it { should have_many(:cocktails) }
  it { should accept_nested_attributes_for(:cocktails) }
end

describe Experience, 'validations' do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :pseudonym }
end

describe Experience, 'scopes' do
  describe '.approved' do
    it 'returns an array of approved experiences' do
      approved_experience = create(:experience, is_approved: true)
      new_experience = create(:experience)

      experiences = Experience.approved

      expect(experiences).to match_array([approved_experience])
    end
  end
end

describe Experience, 'cocktails' do
  context 'user has agreed to add additional data to the experience report' do
    it 'has cocktail data attached to it' do
      experience_with_cocktail_data = create(:experience_with_cocktail_data)
      expect(experience_with_cocktail_data.cocktails).not_to be_empty
      expect(experience_with_cocktail_data.cocktails.size).to eq(3)
    end
  end
end
