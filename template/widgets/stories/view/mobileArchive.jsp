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

    <%-- heading --%>
    <h2>
      <c:out value="${stories.heading}"/> <em>${stories.forDate}</em>
    </h2>

    <%-- articles --%>
    <ul class="list">
      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status"> 
      <li class="item">

        <%-- story link --%>
        <a class="link" href="${articleMap.url}">${fn:trim(articleMap.title)}</a>
        
      </li>

      </c:forEach>
    </ul>
  
    <div style="clear: both"></div>

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

<c:remove var="stories" scope="request"/>
