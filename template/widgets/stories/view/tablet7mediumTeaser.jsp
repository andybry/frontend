<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the mediumTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="template" uri="http://www.escenic.com/taglib/escenic-template" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %> 
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<div class="medium-teaser clearfix">
<%-- article list --%>
<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">

  <%-- switch between two outputs depending on whether we have an image --%>
  <c:choose>
    <c:when test="${articleMap.showImage}">
      <%-- image --%>
      <figure class="inline-image">
        <a href="${articleMap.url}">
          <img 
            src="${articleMap.imageMap.url}"
            class="${stories.imagePosition} ${articleMap.inpageTitleClass}"
            alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
            title="<c:out value='${articleMap.imageMap.caption}' escapeXml='true'/>"
            width="${articleMap.imageMap.width}"
            height="${articleMap.imageMap.height}"
          />
        </a>
      </figure>
	  
      <div class="teaser-content">
        <%-- page tools --%>
        <jsp:include page="helpers/tools.jsp">
          <jsp:param name="showComments" value="${articleMap.showComments}"/>
          <jsp:param name="pluckArticleId" value="${articleMap.pluckArticleId}"/>
          <jsp:param name="dateTime" value="${articleMap.dateTime}"/>
          <jsp:param name="dateStringForTimeElement" value="${articleMap.dateStringForTimeElement}"/>
          <jsp:param name="dateTimeInMs" value="${articleMap.dateTimeInMs}"/>
          <jsp:param name="imageHeavy" value="${articleMap.imageHeavy}"/>
          <jsp:param name="video" value="${articleMap.video}"/>
          <jsp:param name="topicName" value="${articleMap.topicMap.name}"/>
          <jsp:param name="topicUrl" value="${articleMap.topicMap.url}"/>
          <jsp:param name="articleUrl" value="${articleMap.url}"/>
        </jsp:include>
		
        <h3 class="teaser-title">
          <a href="${articleMap.url}">${articleMap.title}</a>
        </h3>
		  
        <%-- intro (leadtext) --%>
        <c:if test="${not empty articleMap.intro}">
          <p class="lead-text">
            <a href="${articleMap.url}">${articleMap.intro}</a>
          </p>
		</c:if>
	  </div>
    </c:when>
    
    <c:otherwise>
      <div class="teaser-content">
      <c:if test="${not empty articleMap.intro}">
        <%-- intro (leadtext) --%>
        <p class="lead-text">
		  <a href="${articleMap.url}">
			<c:out value="${articleMap.intro}"/>
		  </a>
        </p>
      </c:if>
      </div>
    </c:otherwise>
  </c:choose> 
  
</c:forEach>

</div>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
