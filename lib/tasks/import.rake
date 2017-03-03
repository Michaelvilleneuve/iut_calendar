task :import => :environment do
  Source.all.each do |source|
    cal = source.get_calendar
    Event.where(source: source).delete_all
    unless cal.first.nil?
      puts source.events.count
      cal.first.events.each do |new_event|
        desc = new_event.description.nil? ? "" : new_event.description.force_encoding('ISO-8859-1').encode('UTF-8')
        decomposed = desc.split("\n")

        title = decomposed[0].nil? ? desc : decomposed[0]
        teacher = decomposed[1].nil? ? "" : decomposed[1]
        room = decomposed[2].nil? ? "" : decomposed[2]

        title.slice!('MatiÃ¨re : ')
        teacher.slice!('Enseignant : ')
        room.slice!('Salle : ')

        Event.create(
          starts_at: new_event.dtstart, 
          ends_at: new_event.dtend, 
          title: title,
          teacher: teacher,
          room: room,
          source: source,
          description: desc
          )
      end
    end
    puts source.events.count
  end
  Event.where(source_id: nil).delete_all
end
