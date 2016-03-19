require 'rails_helper'

describe Experience do
  describe 'GET /' do
    context 'there is no experiences on the archive' do
      it 'displays an empty archive message' do
        visit root_path

        expect(page).to have_content I18n.t('experiences.no_data')
      end
    end

    context 'there is some content on the archive' do
      it 'displays a list of experiences' do
        create_list(:experience, 5, approved: true)

        visit root_path

        expect(page).to have_selector('li.experience', count: 5)
      end
    end
  end

  describe 'GET /experience/:some_experience' do
    it 'displays the mandatory contents of an experience' do
      experience = create(:experience, approved: true)

      visit experience_path(experience)

      expect(page).to have_selector('div.experience_data')
      expect(page).to have_selector('div.report')

      expect(page).not_to have_selector('div.cocktail_data')
    end

    it 'displays the contents of an experience and its cocktail information' do
      experience = create(:experience_with_cocktail_data, approved: true)

      visit experience_path(experience)

      expect(page).to have_selector('div.experience_data')
      expect(page).to have_selector('div.cocktail_data')
      expect(page).to have_selector('div.report')
    end
  end

  describe 'GET /experiences/new' do
    it 'shows a disclaimer about the approval process' do
      visit new_experience_path
      expect(page).to have_content I18n.t('experiences.addition.disclaimer')
    end

    it 'shows a simple form to fill your report' do
      visit new_experience_path
      expect(page).to have_selector('form')
    end

    it 'has and requires to fill a CAPTCHA in order to submit' do
      visit new_experience_path
      expect(page).to have_xpath "//input[contains(@id, 'gotcha')]"
    end
  end

  describe 'POST /experiences' do
    before do
      @fields = %w(title pseudonym set setting body).map { |f| "experience[#{f}]" }
    end

    it 'sends a report back to us for approval' do
      visit new_experience_path

      @fields.each do |field|
        fill_in field, with: 'Nature to be enslaved must enslave us.'
      end

      click_button I18n.t('experiences.addition.submit')

      expect(page).to have_content I18n.t('experiences.waiting_for_approval')
    end
  end

  describe 'GET /search' do
    context 'there is no content on the site' do
      it 'isn\'t available if there is no content on the site' do
        visit root_path

        expect(page).not_to have_content('div.search')
      end
    end

    context 'there is some content on the site' do
      before do
        @experience = create(:experience, approved: true)
      end

      it 'appears on the homepage' do
        visit root_path

        expect(page).to have_selector('div.search')
      end

      it 'returns acceptable results' do
        visit root_path

        fill_in :query, with: (query = 'report')
        click_button I18n.t('experiences.search')

        expect(page).to have_content /Resultados de la búsqueda para: #{query}/
        expect(page).to have_link \
          I18n.t('experiences.random.keep_reading'), href: experience_path(@experience)
      end
    end
  end
end
