// // datepicker for listing reservation calendar
$(function() {
	$("#reservation_start_date").datepicker({
		format: 'YYYY-MM-DD',
		language: 'ja'
	}).on('dp.error', function(e) {
		$(e.target).val('');
	});

	$("#reservation_end_date").datepicker({
		format: 'YYYY-MM-DD',
		language: 'ja'
	}).on('dp.error', function(e) {
		$(e.target).val('');
	});
});
