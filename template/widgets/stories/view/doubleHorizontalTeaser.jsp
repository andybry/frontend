<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the doubleHorizontalTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="template" uri="http://www.escenic.com/taglib/escenic-template" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>


<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<%-- header --%>
<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<%-- stories --%>
<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <div class="article ${stories.customStyleClass}">

    <%-- authors --%>
    <c:if test="${stories.displayByline eq true}">
      <c:forEach var="authorMap" items="${articleMap.authorMaps}">
        <c:if test="${not authorMap.isAdministrator}">
          <h4>
            <c:if test="${not empty authorMap.url}">
              <a href="${authorMap.url}">
            </c:if>
            ${authorMap.name}
            <c:if test="${not empty authorMap.url}">
              </a>
            </c:if>
          </h4>
        </c:if>
      </c:forEach>
    </c:if>

    <%-- image --%>
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

        <%-- flag (updated, exclusive etc) --%>
        <c:if test="${not empty articleMap.flag}">
          <span class="ir label ${articleMap.flag}">
            ${articleMap.flag}
          </span>
        </c:if>

      </figure>
    </c:if>

    <%-- title --%> 
    <h${stories.headingSize}>
      <a href="${articleMap.url}" class="${articleMap.inpageTitleClass}">
        ${articleMap.title}
      </a>
    </h${stories.headingSize}>

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
      <jsp:param name="toolsClass" value="clearfix"/>
    </jsp:include>

    <%-- leadtext --%>
    <c:if test="${not empty articleMap.intro}">
      <p>${articleMap.intro}</p>
    </c:if>

    <%-- related items --%>
    <c:if test="${articleMap.useRelatedItems}">
      <ul class="headline-teaser see-also">
        <c:forEach var="relatedItemMap" items="${articleMap.relatedItemMaps}" varStatus="status">
          <li class="${relatedItemMap.imageHeavy ? 'gal' : ''} ${relatedItemMap.video ? 'vid' : ''} ${status.last ? 'last' : ''}">
            <a href="${relatedItemMap.url}">${relatedItemMap.title}</a>
          </li>
        </c:forEach>
      </ul>
    </c:if>

  </div>

</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
