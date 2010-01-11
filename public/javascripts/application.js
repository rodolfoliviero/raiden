$(function() {
		$("#taks_drop").draggable();
		$("#taks_drop2").droppable({
		    accept: '#taks_drop',
			drop: function(event, prop) {
			    $("#display_container").load("/tasks/change");
			}
		});

	});

