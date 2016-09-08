task :import => :environment do
  require 'icalendar'
  require 'net/http'

  cal_file=(Net::HTTP.get "hyperplanning.iut.u-bordeaux.fr", "/Telechargements/ical/EdT_LP_DAWIN_Alt.ics?version=14.0.2.3&idICal=2E9320FB3603DD675723E4F26AD44288&param=643d5b312e2e36325d2666683d3126663d3131303030")
  cal = Icalendar::Calendar.parse(cal_file)

  Event.delete_all if cal.first.events.count > 0

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
      description: desc
      )
  end
end