require 'csv'

def calc_score_size(score)
	if score.to_s.include? "pouco"
		1
	elsif score.to_s.include? "muito"
		3
	else
		2		
	end
end

puts "::::::::: Lendo arquivo CSV :::::::::"

ubs_csv = File.read(Rails.root.join('lib','seeds','ubs.csv'))
csv = CSV.parse(ubs_csv, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|	
  row.to_s.gsub!("Ã¢","â").to_s.gsub!("Ã£","ã").to_s.gsub!("Ã©", "é")
  t = Unit.new  
  t.id_unit = row['cod_cnes']
  t.name = row['nom_estab']
  t.address = "#{row['dsc_endereco']}, #{row['dsc_bairro']}"
  t.city = row['dsc_cidade']
  t.phone = row['dsc_telefone']
  t.geocode_lat = row['vlr_latitude']
  t.geocode_long = row['vlr_longitude']
  t.score_size = calc_score_size(row['dsc_estrut_fisic_ambiencia'])
  t.score_adptation_for_seniors = calc_score_size(row['dsc_adap_defic_fisic_idosos'])
  t.score_medical_equipment = calc_score_size(row['dsc_equipamentos'])
  t.score_medicine = calc_score_size(row['dsc_medicamentos'])

  t.save
end

puts "Total de registros : #{Unit.count}"



