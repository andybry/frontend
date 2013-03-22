<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the largeTeaser view of stories widget
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
      <figure>
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
 
        <%-- flag (exclusive etc.) --%>
        <c:if test="${not empty articleMap.flag}">
          <span class="ir label ${articleMap.flag}">
            ${articleMap.flag}
          </span>
        </c:if>

      </figure>
    </c:if>
  </c:set>

  <%-- output the article --%>
  <div class="article lg-teaser type-${articleMap.articleTypeName} ${articleMap.inpageDnDSummaryClass} ${stories.customStyleClass} ${stories.video or stories.imageGallery ? 'vp-teaser' : ''}">

    <c:if test="${articleMap.showImage and stories.imagePosition eq 'aboveHeadline'}">
      <c:out value="${imageMarkup}" escapeXml="false"/>
    </c:if>

    <%-- authors --%>
    <c:if test="${stories.displayByline eq true}">        

      <c:forEach var="authorMap" items="${articleMap.authorMaps}">
        <h4>
          <c:if test="${not authorMap.isAdministrator}">
            <c:if test="${not empty authorMap.url}">
              <a href="${authorMap.url}">
            </c:if>
            ${authorMap.name}
            <c:if test="${not empty authorMap.url}">
              </a>
            </c:if>
          </c:if>
        </h4>
      </c:forEach>

    </c:if>
 
    <%-- title --%>
    <h${stories.headingSize}>
      <a href="${articleMap.url}" class="${articleMap.inpageTitleClass}">
        ${articleMap.title}
      </a>
    </h${stories.headingSize}>
    
    <c:if test="${articleMap.showImage and stories.imagePosition eq 'belowHeadline'}">
      <c:out value="${imageMarkup}" escapeXml="false"/>
    </c:if>

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
      <p>${articleMap.intro}</p>
    </c:if>

    <c:if test="${articleMap.showImage and stories.imagePosition eq 'belowIntro'}">
      <c:out value="${imageMarkup}" escapeXml="false"/>
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
