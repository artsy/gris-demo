module PersonPresenter
  include Gris::Presenter

  property :id, writeable: false, type: String, desc: 'Person unique ID.'

  link :self do
    "#{Gris::Identity.base_url}/people/#{id}"
  end
end
