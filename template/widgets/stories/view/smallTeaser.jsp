<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the smallTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <div class="article sa-teaser type-${articleMap.articleTypeName} ${articleMap.inpageDnDSummaryClass}">

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

    <%-- switch between two outputs depending on whether we have an image --%>
    <c:choose>
      <c:when test="${articleMap.showImage}">
        <%-- image --%>
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

          <%-- flag (exclusive, updated etc.) --%>
          <c:if test="${not empty articleMap.flag}">
            <span class="ir label ${articleMap.flag}">
              ${articleMap.flag}
            </span>
          </c:if>

        </figure>

        <%-- title --%>
        <c:if test="${not empty articleMap.title}">
          <figcaption>
            <a href="${articleMap.url}" class="${articleMap.inpageTitleClass}">
              ${articleMap.title}
            </a>
          </figcaption>
        </c:if>

      </c:when>
      <c:otherwise>
        <c:if test="${not empty articleMap.title}">
          <%-- title --%>
          <p>
            ${articleMap.title}
          </p>
        </c:if>
      </c:otherwise>
    </c:choose>

  </div>
</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
