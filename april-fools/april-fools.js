 var _aprilfoolcontent = '<div class="april-fool-info">' +
 '<div class="info"><img src="menu-text.jpg" ></div> </div>' +
 '<div class="april-fool-menu"><div class="list"><ul>' +
 '<li data-id="ancient"><a href="#">Ancient</a></li>' +
 '<li data-id="ms-dos"><a href="#">MS Dos</a></li>' +
 '<li data-id="drunk"><a href="#">Drunk</a></li>' +
 '<li data-id="x-ray"><a href="#">X-Ray</a></li>' +
 '<li data-id="backwards"><a href="#">Backwards</a></li>' +
 '<li data-id="no-filter" class="last"><a href="#" class="btn-img">Clear Filter</a></li>' +
 '</ul></div></div>';
 
 $("body").prepend(_aprilfoolcontent);
 
 $("head").append('<link rel="stylesheet" type="text/css" href="http://s3.amazonaws.com/tm-frontend/frontend/april-fools/april-folls.js"/>');
  
 $(".april-fool-menu li").click(function(){
  $(this).addClass("active");
  $(this).siblings().removeClass("active");
  $("body").removeClass();
  var data = $(this).attr('data-id'); 
  
  $("body").addClass(data);
 
 return false;
 
 });
