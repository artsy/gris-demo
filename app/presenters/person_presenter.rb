module PersonPresenter
  include Gris::Presenter

  property :id, writeable: false, type: String, desc: 'Person unique ID.'

  link :self do |opts|
    request = Grape::Request.new(opts[:env])
    "#{request.base_url}/people/#{id}"
  end
end
