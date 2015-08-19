module RootPresenter
  include Gris::RootPresenter

  link :self do
    Gris::Identity.base_url
  end

  # Additional endpoint links

  resource_links :person
  endpoint_link :health
end
