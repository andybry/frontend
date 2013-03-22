<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/mediumTeaser.jsp#1 $
 * Last edited by : $Author: asm $ $Date: 2011/09/08 $
 * Version        : $Revision: #2 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.hasArticles}">
  <div class="features-teaser clearfix">
    <h2 class="section-title">${section.name}</h2>
    <div class="${section.name}-wrapper">
      <div id="${section.name}-slider">
        <%-- flick gallery images --%>
        <div class="${section.name}-slider-wrapper">
          <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status" end="2">
            <div class="slide-item" style="display: block;">
              <figure>
                <a href="${articleMap.url}">
                  <img src="${articleMap.imageMap.url}" alt="${articleMap.title}" title="${articleMap.title}"/>
                </a>
              </figure>
              <h2>${articleMap.title}</h2>
            </div>
          </c:forEach>
        </div>
        <div id="slide-prev" class="slide-nav"></div>
        <div id="slide-next" class="slide-nav"></div>
	  </div>
  
      <%-- navigation --%>
      <div id="${section.name}-slider-nav">
	    <ul id="${section.name}-slider-nav-position">
		  <li class="${section.name}-slider-nav-on"></li>
		  <li></li>
		  <li></li>    
	    </ul>
      </div>
      
	  <script>    
        $LAB.script("${publication.url}resources/js/lib/swipejs.js").wait(function(){
          var bullets = $('#${section.name}-slider-nav-position li');
          var swipe = new Swipe(document.getElementById('${section.name}-slider'), {
            speed: 400,
            auto: 3000,
            callback: function(event, index, elem) {
              var i = bullets.length;
		      while (i--) {
                bullets[i].className = ' ';
              }
              bullets[index].className = '${section.name}-slider-nav-on'; 
              }
          });
          $('#slide-prev').click(function(){
            swipe.prev();
          });
          $('#slide-next').click(function(){
            swipe.next();
          });
        });     
      </script>

    </div>
  </div> 
</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
