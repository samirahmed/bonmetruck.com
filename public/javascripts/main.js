$( function(){
	$(document).ready(function()
	{
		if ($('.location-days').length > 0 )
		{
			var today = ['sunday','monday','tuesday','wednesday','thursday','friday','saturday'][new Date().getDay()];
			$('.location-days a[data$="'+today+'"]').parent().addClass("active");
			$("#location-info").load('/day/'+today+' #info');
			$('.location-days a').on('click',function(){
				$("#location-info").load('/day/'+$(this).attr('data')+' #info');
			})
		}
	})
});
