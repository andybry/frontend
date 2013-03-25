/*
  $Id: $
  $URL: $
  Description: Centers element vertically within parent element.
*/
(function ($) {
	$.fn.middle = function () {	
	  var $el = this;	   
	  console.log(this);
	  $el.each(function() {	          
          var $middle = $(this);	          
          var offset = $middle.parent().height() - $middle.innerHeight();
          var topMargin = Math.floor(offset/2);          
          $middle.css('margin-top', topMargin);
      });	    
	 };
 })(jQuery);    


        