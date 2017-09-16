// datepicker for listing reservation calendar
$(function() {
	$("#reservation_start_date").datepicker({
		format: 'YYYY-MM-DD',
		language: 'ja',
		minDate: 0,
		maxDate: '3m',
		onSelect: function(selected) {
			$('#reservation_end_date').datepicker("option", "minDate", selected);
			$('#reservation_end_date').attr('disabled', false);
		}
	});

	$("#reservation_end_date").datepicker({
		format: 'YYYY-MM-DD',
		language: 'ja',
		minDate: 0,
		maxDate: '3m',
		onSelect: function(selected) {
			$('#reservation_start_date').datepicker("option", "maxDate", selected);
		}
	});
});
