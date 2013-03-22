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

<%-- calculate the viewport and panel markup --%>
<c:if test="${stories.hasArticles}">

  <%-- viewport --%>
  <c:set var="viewportMarkup" scope="page">

      <%-- in the ajax case we want all the main images, in the non ajax case just the first one --%>
      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status" end="${stories.isAjax ? stories.articleMapEndIndex : 0}">
        <div class="viewport">
          <%-- image --%>
          <a href="${articleMap.url}">
            <img src="${articleMap.imageMap.url}"
              width="${articleMap.imageMap.width}"
              height="${articleMap.imageMap.height}"
              alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
              />           
          </a>
  
          <%-- header --%>
          <h2 class="viewport-heading ${articleMap.headlineStyle}">
            <a href="${articleMap.url}">
              ${articleMap.title}
            </a>
          </h2>

        </div>
      </c:forEach>
  
  </c:set>

  <%-- panel --%>
  <c:set var="panelMarkup" scope="page">
    <div class="panel">
  
      <ul class="pic-viewer-list">
        <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
          <li>
   
              <%-- flag (updated etc) --%>
              <c:if test="${not empty articleMap.flag}">
                <span class="label ${articleMap.flag}">
                  <a href="${articleMap.url}" class="ir">
                    ${articleMap.flag}
                  </a>
                </span>
              </c:if>
  
              <%-- image --%>
              <a href="${articleMap.url}">
                <img src="${articleMap.smallImageMap.url}"
                  width="${articleMap.smallImageMap.width}"
                  height="${articleMap.smallImageMap.height}"
                  alt="<c:out value='${articleMap.smallImageMap.alttext}' escapeXml='true'/>"
                  />           
              </a>
  
              <%-- title --%>
              <a href="${articleMap.url}">
                ${articleMap.title}
              </a>
  
          </li>

          <%-- we want to close and open the panels every <panelItemCount> articles --%>
          <c:if test="${status.index mod stories.panelItemCount eq stories.panelItemCount - 1 and not status.last}">

        </ul>
      </div>
      <div class='panel'>
        <ul class='pic-viewer-list'>

           </c:if>
        </c:forEach>
  
    </div>
  </c:set>

</c:if>

<%-- switch between ajax output and non ajax output --%>
<c:choose>

  <%-- ajax case --%>
  <c:when test="${stories.hasArticles and stories.isAjax}">
    <jsp:useBean id="jsonOutputArray" scope="page" class="java.util.ArrayList" />
    <jsp:useBean id="jsonOutputMap" scope="page" class="java.util.HashMap" />
    <c:set target="${jsonOutputMap}" property="viewport" value="${viewportMarkup}" />
    <c:set target="${jsonOutputMap}" property="panel" value="${panelMarkup}" />
    <collection:add collection="${jsonOutputArray}" value="${jsonOutputMap}" />
    ${elfn:toJson(jsonOutputArray)}
  </c:when>

  <%-- non ajax case --%>
  <c:when test="${stories.hasArticles}">
    <div id="pic-nav-${stories.widgetId}" class="carousel pic-nav ${stories.customStyleClass}">
  
      <%-- viewport --%>
      <div class="viewport-container">
        ${viewportMarkup}
      </div>
  
      <%-- thumbnails and controls --%>
      <div class="pic-viewer-thumbs clearfix">
  
        <%-- controls --%>
        <div class="carousel-controls">
          <a href="#" class="ir btn-left">Left</a>
          <a href="#" class="ir btn-right">Right</a>
        </div>
  
        <%-- thumbnails (for each article) --%>
        <div class="wrapper">
          <div class="panel-container">
            ${panelMarkup}
          </div>
        </div>
  
      </div>
  
    </div>
  
    <script type="text/javascript">//<![CDATA[
      $LAB.script("${publication.url}resources/js/tm.carousel.js?v=1").wait(function(){
        $("#pic-nav-${stories.widgetId}").picNav({
          "ajaxSrc" : "${stories.ajaxUrl}",
          "autoplay" : true
        });
      });
     //]]></script>
  
    <jsp:include page="helpers/renderViewMoreLink.jsp" />
  </c:when>
</c:choose>

<c:remove var="stories" scope="request"/>
