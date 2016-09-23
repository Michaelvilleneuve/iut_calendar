task :import => :environment do
  Source.all.each do |source|
    cal = source.get_calendar

    unless cal.first.nil?
      if cal.first.events.count > 0
        puts "#{source.events.count} events to delete"
        source.events.destroy_all
        source.events.count == 0 ? puts("Deletion successful") : puts("Deletion failed")
      end

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

      puts "#{source.events.count} new events"
      puts "......"
    end
  end
  Event.where(source_id: nil).delete_all
end
