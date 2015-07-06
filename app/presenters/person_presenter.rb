module PersonPresenter
  include Gris::Presenter

  property :id, writeable: false, type: String, desc: 'Person unique ID.'
  property :name, writeable: true, type: String, desc: 'Person name.'

  link :self do |opts|
    request = Grape::Request.new(opts[:env])
    "#{request.base_url}/people/#{id}"
  end
end
