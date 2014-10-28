module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :provinces do
      desc "Return all provinces"
      get do
        {
          provinces: Province.all
        }
      end
    end
  end
end