# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click','.toggle-home-work, .close', -> 
	id = $(this).data('id')
	if $(this).hasClass('form')
		$('.new_hw').toggleClass('hidden')
		$('.new_hw').find('form').attr('action', '/events/'+id+'/home_works')
	else
		$("#home-work-#{id}").toggleClass('show')


$(document).on 'click', '#load_more', ->
	$('.loader').removeClass('hidden')
	$('.text').remove()