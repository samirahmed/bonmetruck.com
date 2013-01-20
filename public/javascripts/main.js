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
		  $('#sunburst').pow({
				rays: 50,
				originX:'50%',
				originY:'50%',
				bgColorStart: 'hsl(210,100%,90%)',
				rayColorStart: 'hsl(210,100%,97%)',
				bgColorEnd: 'hsl(210,100%,60%)',
				rayColorEnd: 'hsl(210,100%,80%)',
				sizingRatio: 4
		  });	
	})
});
