require 'spec_helper'

describe 'Experiences' do
  describe 'GET /experiences' do
    context 'no content have been created so far' do
      it 'displays an empty archive message' do
        visit experiences_path
        expect(page).to have_content(/Uh, qué macana. Aún no tenemos experiencias./)
      end
    end

    context 'content have been created' do
      it 'displays a list of experiences', js: true do
        experience = create(experience)

        visit experiences_path

        expect(page).to have_selector('li.experience')
        expect(page).to have_link(
          experience.title, href: experience_path(experience)
        )
      end
    end
  end
end
