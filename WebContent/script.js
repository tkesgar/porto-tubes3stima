(function(){
	
	var updateDate = function() {
		var datetime = new Date();
		$("#navbar_clock").html(datetime.toLocaleDateString() + " " + datetime.toLocaleTimeString());
	};
	updateDate();
	setInterval(updateDate, 1000);
	
})();