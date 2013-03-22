<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the tablet7largeTeaser view of stories widget
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

<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<c:if test="${not empty stories.headerLinksList}">
  <jsp:include page="helpers/headerLinks.jsp"/>
</c:if>

<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <%-- store the image markup so that it can be output in the correct location --%>
  <c:set var="imageMarkup" scope="page">
    <c:if test="${articleMap.showImage}">
      <figure class="inline-image clearfix">
        <a href="${articleUrl}">
          <img 
            src="${articleMap.imageMap.url}"
            class="${stories.imagePosition} ${articleMap.inpageTitleClass}"
            alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
            title="<c:out value='${articleMap.imageMap.caption}' escapeXml='true'/>"
            width="${articleMap.imageMap.width}"
            height="${articleMap.imageMap.height}"
          />
        </a>
		<figcaption>
          <h3 class="teaser-title">
            <a href="${articleMap.url}">${articleMap.title}</a>
          </h3>
        </figcaption>
      </figure>
    </c:if>
  </c:set>

  <%-- output the article --%>
  <div class="primary-topic">

    <c:if test="${articleMap.showImage}">
      <c:out value="${imageMarkup}" escapeXml="false"/>
    </c:if>

    <div class="primary-topic-content">
	
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
        <jsp:param name="rating" value="${articleMap.rating}"/>
      </jsp:include>

      <%-- leadtext --%>
      <c:if test="${not empty articleMap.intro}">
        <p class="lead-text">
          <a href="${articleMap.url}">${articleMap.intro}</a>
        </p>
      </c:if>

      <%-- related items --%>
      <c:if test="${articleMap.useRelatedItems}">
        <ul class="related-text">
          <c:forEach var="relatedItemMap" items="${articleMap.relatedItemMaps}" varStatus="status">
            <li>
              <span class="right-arrow">&rsaquo;</span>
              <a href="${relatedItemMap.url}"><span>${relatedItemMap.title}</span></a>
            </li>
          </c:forEach>
        </ul>
      </c:if>
    </div>

  </div>

</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
