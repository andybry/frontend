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

<c:if test="${stories.hasArticles}">

  <%-- header --%>
  <c:if test="${stories.showSectionTitle}">
    <div class="header">
      <h5>
        <c:out value="${stories.sectionName}" escapeXml="true" />
      </h5>
    </div>
  </c:if>

  <%-- story list --%>
  <ul class="list">
    <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
      <li class="${status.first ? 'first-' : ''}item">
 
        <%-- image if present and we are showing this many images --%>
        <c:if test="${articleMap.showImage and status.index < stories.numberOfPicsDisplayed}">
          <a href="${articleMap.url}" class="thumb-transcode-x-link">
            <img src="${articleMap.imageMap.url}"
                 class="thumb-transcode topListImg"
                 alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
                 title="<c:out value='${articleMap.imageMap.title}' escapeXml='true'/>"/>
          </a>
        </c:if>

        <%-- story link --%>
        <a class="link" href="${articleMap.url}">${fn:trim(articleMap.title)}</a>
        
      </li>
    </c:forEach>
  </ul>

  <div style="clear: bloth"></div>

  <%-- pagination --%>
  <c:if test="${stories.showPagination}">
    <div class="pagination clearfix">
 
      <%-- left pagination button if present --%>
      <c:if test="${stories.showLeftPaginationButton}">
        <a href="${stories.leftPaginationHref}" class="ir btn-left" rel="prev">
          <c:out value="${fn:trim(stories.leftPageLinkText)}" escapeXml="false"/>
        </a>
      </c:if>

      <%-- numbered pages --%>
      <ul class="clearfix pagination-controls">
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
 
      </ul>
  
      <%-- right pagination button if present --%>
      <c:if test="${stories.showRightPaginationButton}">
        <a href="${stories.rightPaginationHref}" class="ir btn-right" rel="prev">
          <c:out value="${fn:trim(stories.rightPageLinkText)}" escapeXml="false"/>
        </a>
      </c:if>
       
    </div>
  </c:if>


</c:if>

<c:remove var="stories" scope="request"/>
