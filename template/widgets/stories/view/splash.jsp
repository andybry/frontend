<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the splash view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<%-- header --%>
<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<%-- articles --%>
<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <%-- save the header markup, to be positioned later based on image position --%>
  <c:set var="headerMarkup" scope="page">
    <h1 <c:if test="${not empty stories.titleStyleClass}">class='${stories.titleStyleClass}'</c:if> >
      <a href="${articleMap.url}">${articleMap.title}</a>
    </h1>
  </c:set>

  <%-- save the picture markup, to be positioned later based on image position --%>
  <c:set var="imageMarkup" scope="page">
    <a href="${articleMap.url}">
      <img src="${articleMap.imageMap.url}"
        class="${stories.imagePosition}"
        alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
        title="<c:out value='${aritcleMap.imageMap.caption}' escapeXml='true'/>"
        width="${articleMap.imageMap.width}"
        height="${articleMap.imageMap.height}"
      />
    </a>
  </c:set>

  <%-- save the intro and page tools markup, to be positioned later based on image position --%>
  <c:set var="introMarkup" scope="page">
    <jsp:include page="helpers/tools.jsp">
      <jsp:param name="showComments" value="${articleMap.showComments}"/>
      <jsp:param name="pluckArticleId" value="${articleMap.pluckArticleId}"/>
      <jsp:param name="imageHeavy" value="${articleMap.imageHeavy}"/>
      <jsp:param name="video" value="${articleMap.video}"/>
      <jsp:param name="topicName" value="${articleMap.topicMap.title}"/>
      <jsp:param name="topicUrl" value="${articleMap.TopicMap.url}"/>
      <jsp:param name="articleUrl" value="${articleMap.url}"/>
    </jsp:include>
  
    <c:if test="${not empty articleMap.intro}">
      <p><c:out value="${articleMap.intro}"/></p>
    </c:if>

  </c:set>
  <%-- save the intro markup, to be positioned later based on image position --%>

  <div class="${stories.wrapperStyleClass} ${status.last ? stories.lastItemStyleClass : ''}">
    <%-- switch based on image position --%>
    <c:choose>

      <%-- if image is positioned at top --%>
      <c:when test="${stories.imagePosition == 'top'}">
        <c:if test="${articleMap.showImage}">
          <figure class="clearfix">
            <%-- header --%>
            ${headerMarkup}

            <%-- image --%>
            ${imageMarkup}

            <%-- flag (updated etc.) --%>
            <c:if test="${not empty articleMap.flag}">
              <span class="label ${fn:toLowerCase(articleMap.flag)}">
                <a class="ir span-8-5" href="${articleMap.url}">${fn:toLowerCase(articleMap.flag)}</a>
              </span>
            </c:if>
          </figure>
        </c:if>

        <%-- intro (including tools)--%>
        ${introMarkup}
      </c:when>

      <%-- if image is NOT positioned at top --%>
      <c:otherwise>
        <div class="splash-inner">
 
          <%-- flag (updated etc.) --%>
          <c:if test="${not empty articleMap.flag}">
            <span class="label ${fn:toLowerCase(articleMap.flag)}">
              <a class="ir" href="${articleMap.url}">${fn:toLowerCase(articleMap.flag)}</a>
            </span>
          </c:if>

          <%-- header --%>
          ${headerMarkup}

          <%-- intro (including tools)--%>
          ${introMarkup}
        </div>

        <%-- image --%>
        <figure class="clearfix">
          ${imageMarkup}
        </figure>

      </c:otherwise>

    </c:choose>
  </div>

  <c:remove var="headerMarkup" scope="page"/>
  <c:remove var="imageMarkup" scope="page"/>
  <c:remove var="introMarkup" scope="page"/>
</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
