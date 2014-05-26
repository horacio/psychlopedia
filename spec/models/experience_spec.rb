require 'spec_helper'

describe Experience do
  describe '.approved' do
    it 'shows only approved experiences' do
      good_experience = Experience.create(
        pseudonym: 'svankmajer',
        title: 'compartmentalization',
        body: 'not quite long ago...',
        is_approved: true
      )

      bad_experience = Experience.create(
        pseudonym: 'rejamknavs',
        title: 'train wreck',
        body: 'this is not going to be fun...'
      )

      experiences = Experience.approved

      expect(experiences).to match_array([good_experience])
    end
  end
end
