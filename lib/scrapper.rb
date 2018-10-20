require 'open-uri'
require 'nokogiri'
class Scrapping
	attr_accessor :nom_email
	def get_the_email_of_a_townhal_from_its_webpage(url,nom)
		compteur = 0
		compteur_2 = 0
		tab_email = []
		tab_email_text = []
		url.each{|x|
			doc2 = Nokogiri::HTML(open(x))
			tab_email[compteur] = doc2.css('table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)')
			tab_email_text[compteur_2] = tab_email[compteur].text
			compteur += 1
			compteur_2 += 1
		}
		nom_email = nom.zip(tab_email_text).to_h
		return nom_email
	end

	def get_all_the_urls_of_val_doise_townhalls
		links = []
		compteur = 0
		compteur_2 = 0
		nom = []
		doc2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

		doc2.css('a.lientxt').each do |link|
			link = link['href'].gsub('./','')
			links[compteur] = "http://annuaire-des-mairies.com/#{link}"
			compteur += 1
		end

		doc2.css('a.lientxt').each do |link|
			nom[compteur_2] = link.text
			compteur_2 += 1
		end
		get_the_email_of_a_townhal_from_its_webpage(links,nom)
	end
end