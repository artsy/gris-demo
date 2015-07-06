class PeopleEndpoint < Grape::API
  namespace :people do
    desc 'List existing people'
    params do
      optional :page, type: Integer, default: 1, desc: 'Current page.'
      optional :size, type: Integer, default: 10, desc: 'Number of people to return per page.'
    end
    get do
      conditions = {}
      people = Person.where(conditions)
      present Kaminari.paginate_array(people).page(params[:page]).per(params[:size]), with: PeoplePresenter
    end

    desc 'Create new person.'
    params do
      requires :person, type: Hash do
        # Use this requires block to whitelist params which
        # may be updated via mass assignment at this endpoint.
        #
        # requires :name, type: String
        # optional :category, type: String
      end
    end
    post do
      create Person, with: PersonPresenter, from: permitted_params[:person]
    end

    desc 'Retrieve existing person.'
    params do
      requires :id, desc: 'ID of the person'
    end
    get ':id' do
      person = Person.find params[:id]
      present person, with: PersonPresenter
    end

    desc 'Update existing person.'
    params do
      requires :id, type: String, desc: 'Person id.'
      requires :person, type: Hash do
        # Use this requires block to whitelist params which
        # may be updated via mass assignment at this endpoint.
        #
        # requires :name, type: String
        # optional :category, type: String
      end
    end
    patch ':id' do
      person = Person.find params[:id]
      update person, with: PersonPresenter, from: permitted_params[:person]
    end

    desc 'Delete existing person.'
    params do
      requires :id, type: String, desc: 'Person id.'
    end
    delete ':id' do
      person = Person.find params[:id]
      delete person, with: PersonPresenter
    end
  end
end
