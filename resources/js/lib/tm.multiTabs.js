/*
  $Id: $
  $URL: $
  Description: Allows multiple tabs on a page with onclick event, hide or show content through the ID Element.
*/
(function ($) {

$.fn.tab = function () {

  var $el = this;
   
  $el.each(function() {
          
          var $tabs = $(this);
          
          $tabs.find(".tab-content").hide().first().show();
          $tabs.find("ul.tabs li:first").addClass("active").show();
  
          $tabs.find("ul.tabs li").click(function() {
              
              //Remove any "active" class          
              $(this).addClass("active");
              $(this).siblings().removeClass("active");
                          
              //Find the href attribute value to identify the active tab + content
              var activeTab = '#' + $(this).attr("data-Id");
              $(activeTab).css("display", "block");
              $(activeTab).siblings().css("display", "none");
              //Fade in the active ID content
              $(activeTab).fadeIn();
          
              return false;
          });
      });
    
 };

 })(jQuery);    


