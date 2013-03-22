<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the paginated view of stories widget
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<%-- header --%>
<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<%-- story list --%>
<c:if test="${stories.hasArticles}">
  
  <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
    <div class="article clearfix ma-teaser sa-teaser ${status.last ? stories.lastItemStyleClass : ''}">
      
      <%-- image (if present) --%>
      <c:if test="${articleMap.showImage}">

        <figure class="clearfix">
          <a href="${articleMap.url}">
            <img src="${articleMap.imageMap.url}"
                 width"${articleMap.imageMap.width}"
                 height="${articleMap.imageMap.height}"
                 alt="${articleMap.imageMap.alttext}"
                 title="${articleMap.imageMap.title}"
            />
          </a>

          <%-- flag (updated etc.) --%>
          <c:if test="${not empty articleMap.flag}">
            <span class="ir label ${articleMap.flag}">
              <c:out value="${articleMap.flag}" />
            </span>
          </c:if>

        </figure>

      </c:if>

      <%-- article info --%>
      <div ${articleMap.showImage ? 'class="teaser-info"' : ''}>
     
        <%-- title --%>
        <h2>
          <a href="${articleMap.url}">${fn:trim(articleMap.title)}</a>
        </h2>

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

        <%-- leadtext --%>
        <c:if test="${not empty articleMap.intro and stories.showLeadText}">
          <p>
            <c:out value="${articleMap.intro}" escapeXml="false" />
          </p>

        </c:if>
      </div>

    </div>
     
  </c:forEach>
  
  <%-- pagination --%>
  <c:if test="${stories.showPagination}">
    <div class="pagination clearfix">
      <ul class="clearfix pagination-controls">
       
        <%-- left pagination button if present --%>
        <c:if test="${stories.showLeftPaginationButton}">
          <li>
            <a href="${stories.leftPaginationHref}" class="ir btn-left" rel="prev">
              <c:out value="${fn:trim(stories.leftPageLinkText)}" escapeXml="false"/>
            </a>
          </li>
        </c:if>

        <%-- numbered pages --%>
        <c:forEach var="pageNumber" begin="${stories.beginPageNumber}" end="${stories.endPageNumber}" step="1">

          <c:choose>
            <c:when test="${pageNumber == stories.currentPageNumber+1}">
               <c:set var="rel" value="next" scope="page"/>
            </c:when>
            <c:when test="${pageNumber == stories.currentPageNumber-1}">
              <c:set var="rel" value="prev" scope="page"/>
            </c:when>
            <c:otherwise>
              <c:set var="rel" value=""  scope="page"/>
            </c:otherwise>
          </c:choose>

          <%-- switch between the two cases, current page and not current page --%>
          <c:choose>
            <c:when test="${pageNumber == stories.currentPageNumber}">
              <li class="selected">${pageNumber}</li>
            </c:when>
            <c:otherwise>
              <li>
                 <a href="?pageNumber=${pageNumber}" <c:if test="${not empty rel}">rel="${rel}"</c:if>>${pageNumber}</a>
              </li>
            </c:otherwise>
          </c:choose>

        </c:forEach>
        
        <%-- right pagination button if present --%>
        <c:if test="${stories.showRightPaginationButton}">
          <li>
            <a href="${stories.rightPaginationHref}" class="ir btn-right" rel="prev">
              <c:out value="${fn:trim(stories.rightPageLinkText)}" escapeXml="false"/>
            </a>
          </li>
        </c:if>
        
 
      </ul>
    </div>
  </c:if>

</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
