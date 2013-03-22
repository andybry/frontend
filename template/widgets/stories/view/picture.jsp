<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the picture view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<div class="in-pictures ${stories.customStyleClass}">
  <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
    <c:if test="${articleMap.showImage}">
      <a href="${articleMap.url}">
        <img src="${articleMap.imageMap.url}"
          width="${articleMap.imageMap.width}"
          height="${articleMap.imageMap.height}"
          alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
          />           
      </a>
    </c:if>
  </c:forEach>
</div>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
