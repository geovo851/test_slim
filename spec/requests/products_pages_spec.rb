require 'rails_helper'

describe 'Products pages' do

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector(selector, text: heading) }
    it { should have_title("#{page_title} | Clothes store") }
  end

  describe 'Home page' do
    before { visit root_path }
    let(:heading)    { 'featured products' }
    let(:page_title) { 'Home' }
    let(:selector)   { 'h2' }

    it_should_behave_like "all static pages"
    it { should_not have_title('Contact Us |') }

    describe 'services' do
      let(:heading)    { 'Our Services' }
      let(:page_title) { 'Services' }
      let(:selector)   { 'h4' }
      before { click_link 'services' }

      context 'have link services' do
        it_should_behave_like "all static pages"
      end
    end

    describe 'contact us' do
      let(:heading)    { 'get in touch' }
      let(:page_title) { 'Contact Us' }
      before { click_link 'Contact us' }

      context 'have link contact us' do
        it_should_behave_like "all static pages"
      end
    end
  end

  describe 'products' do
    let!(:category) { FactoryGirl.create(:category) }

    describe 'category' do
      before do
        visit root_path
        click_link category.title
      end

      context 'when category is found' do 
        it { expect(page).to have_selector('h2', text: category.title) }
      end
    end

    describe 'pagination' do
      context 'when pagination is found' do
        before do
          15.times { FactoryGirl.create(:product, category: category) }
          visit root_path
          click_link category.title
        end
        it { expect(page).to have_css('.pagination') }
      end

      context 'when pagination is not found' do
        before do
          1.times { FactoryGirl.create(:product, category: category) }
          visit root_path
          click_link category.title
        end
        it { expect(page).to_not have_css('.pagination') }
      end
    end
  end

  describe 'contact us' do
    before do
      visit root_path
      click_link 'Contact us'
    end

    describe 'send message' do 
      context 'when valid send message' do
        before do
          fill_in 'Name',   with: 'Stas'
          fill_in 'E-mail', with: 'wet@gmail.com'
          fill_in 'Subject',   with: 'Hi. Good store!!!'
          click_button "Send"
        end
        it { expect(page).to have_css('.alert-success', text: 'Your message sent.') }
      end

      context 'when invalid send message' do
        before { click_button "Send" }
        it { expect(page).to_not have_css('.alert-success', text: 'Your message sent.') }
      end
    end
  end

end
