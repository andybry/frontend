<%--
 * $Id:$
 * $URL:$
 *
 * This is the view of the columnTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<%-- header --%>
<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">

  <div class="${status.last ? stories.lastItemStyleClass : ''} ${stories.numberOfColumnColumnTeaser eq 'fiveColumn' and not status.last ? 'append-1' : ''} ${articleMap.inpageDnDSummaryClass} ${stories.numberOfColumnColumnTeaser eq 'fourColumn' ? 'four-col-teaser' : 'five-col-teaser span-4' } ${stories.customStyleClass}">

    <%-- image (if present) --%>
    <c:if test="${articleMap.showImage}">
      <figure class="clearfix">
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

    </c:if>

    <%-- topic if present --%>
    <c:if test="${stories.showPrimaryTagColumnTeaser and not empty articleMap.topicMap}">
      <c:if test="${not empty articleMap.topicMap.url}">
        <a class="more" href="${articleMap.topicMap.url}">
      </c:if>
      ${articleMap.topicMap.name}
      <c:if test="${not empty articleMap.topicMap.url}">
        </a>
      </c:if>
    </c:if>

    <h3>
      <a href="${articleMap.url}">
          ${articleMap.curtailedTitle}
      </a>
    </h3>
     
  </div>

</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
