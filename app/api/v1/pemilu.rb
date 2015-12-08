module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :tps_surabaya do
      desc "Return all TPS Surabaya"
      get do
        tps_surabaya = Array.new

        # Prepare conditions based on params
        valid_params = {
          kecamatan: 'id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        # Set Limit, default is `10`
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        # Build Data
        KelurahanList.includes(:alamat_lists)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |tps|
            tps_surabaya << {
              kecamatan: tps.kecamatan_list.kecamatan,
              kelurahan: tps.kelurahan,
              tps:  tps.build_tps
            }
          end

          # Send output as JSON format
          {
            results: {
              count: tps_surabaya.count,
              total: KecamatanList.where(conditions).count,
              data_tps_surabaya: tps_surabaya
            }
          }
      end
    end
  end
end