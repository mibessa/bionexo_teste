class UnitsController < ApplicationController
	def find_ubs
		lat =0
		long =0
		
		if (!params['query'].nil? && params['query'].split(',').size > 1) 
			lat = params['query'].split(',')[0].to_f.round(7) 			
			long = params['query'].split(',')[1].to_f.round(7) 			
		end
		
		unit = Unit.where(" geocode_lat <= :latitude AND geocode_long <= :longitude ", {latitude: lat, longitude: long}).order(geocode_long: :desc, geocode_lat: :desc).first
		if unit		
			entries = [{"id" => unit.id_unit, "name" => unit.name, "address" => unit.address, "city"=> unit.city,"phone"=> unit.phone,
				"geocode"=> {"lat" => unit.geocode_lat, "long" => unit.geocode_long},
					"scores" => {"size" => unit.score_size, "adaptation_for_seniors" => unit.score_adptation_for_seniors, "medical_equipment" => unit.score_medical_equipment,
						"medicine" => unit.score_medicine}}]

			response = {"current_page" => params['page'], "per_page"=>params['per_page'],"total_entries"=>Unit.count, "entries"=> entries}
			render json: response
		else
			render json: {status: 'sucesso', message: 'UBS não encontrada', status: :ok}
		end
	end				
end

