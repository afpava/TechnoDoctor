require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
      # let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_day: '01-01-1954', password:'123test' ) }
      let(:category) {Category.create(description:'Phones').reload}
      let(:category2) {Category.create(description:'Tablets').reload}
      let(:brand_params){title_params = { description:"This is test#{rand(1000)}", category_id: category.id } }

  describe 'GET #edit' do
    let(:brand1) {category.brands.create(brand_params)}

    context 'should return exect category brand' do
      # let(:brand_params){brand_params = {text:'Test'}}
        before do
          brand1
          get :edit, params: { category_id: brand1.category.id, id: brand1.id }
        end
        it{ expect( assigns( :brand1 )).to eq ( brand1 ) }
    end
  end #GET edit


  describe 'brand brands#create' do
    context 'should create a new brand' do
      before do
        category
        brand_params
      end

      it { expect { post(:create, params: { category_id: category.id, brand: brand_params }) }.to change(brand1, :count).by(1)}
      it do
        post(:create, params: {category_id: category.id, brand: brand_params })
        expect(response).to redirect_to( category_path(category) )
      end

      it do
        post(:create, params: {category_id: category.id, brand: brand_params })
        expect(flash[:notice]).to eq 'Brand was successfully created.'
      end

    end

    context 'should render new template if description is blank' do
      let(:brand_params){brand_params = {description: nil} }

      before do
        category
        brand_params
      end

      it do
        post(:create, params: {category_id: category.id, brand: brand_params })
        expect(flash[:alert]).to eq 'Brand can not be blank or exists.'
      end
    end

  end #brand #create

  describe 'PATCH#update' do
    let(:brand_params){brand_params = {title:"This is test#{rand(1000)}", text:'Test message'}}
    let(:brand1) {person1.brands.create(brand_params)}
    subject { patch :update, params: {category_id: brand1.category.id, id: person1.id, brand: brand_ch_params} }
      before do
        allow(controller).to receive(:current_user) {person1}
        person1
        user
        brand1

      end


      context 'as a user' do

        context 'with valid params' do
          let(:brand_ch_params) {brand_params = {title: 'Foo', text: 'Foo' } }

          it 'updates requested record' do
            subject
            expect(brand1.reload.text).to eq(brand_ch_params[:text])
            expect(response).to redirect_to(root_path)

          end

        end

        context 'with invalid params' do
          let(:brand_ch_params) {brand_params = {title: nil, text: nil } }

          it do
             subject
             expect(response).to render_template(:edit)
           end
        end

      end


    end #PUT update

  describe 'Delete #destroy' do
  # describe 'DELETE destroy' do
    let(:brand1) {person1.brands.create(brand_params)}
    before do
      allow(controller).to receive(:current_user) {person1}
      person1
      brand1

    end

      context 'when params are valid' do

        it do
          expect{ delete :destroy, params: {category_id: brand1.category.id, id: brand1.id} }.to change(brand, :count).by(-1)
        end
        it do
          delete :destroy, params: {category_id: brand1.category.id, id: person1.id}
          expect(flash[:notice]).to eq 'brand was successfully destroyed.'
        end

      end

     end # Delete #destroy

end #Rspec
