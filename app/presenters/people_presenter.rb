module PeoplePresenter
  include Gris::PaginatedPresenter

  collection :to_a, extend: PersonPresenter, as: :people, embedded: true
end
