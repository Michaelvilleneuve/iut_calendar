task :parse_menu => :environment do
	require 'open-uri'

	Menu.destroy_all
	page = Nokogiri::HTML(open("http://www.crous-bordeaux.fr/restaurant/resto-u-n3/"))
	page.css('#menu-repas').css('ul.slides > li').each do |single_menu|
		Menu.create(menu_date: Date.parse(single_menu.css('h3').text), content: single_menu.css('.content-repas')[1])
	end

end