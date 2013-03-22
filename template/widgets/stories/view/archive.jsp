<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the largeTeaser view of stories widget
--%>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="ELFunctionTagLibrary" prefix="elfn" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.hasArticles}">
  <div class="search-results">
    
    <%-- heading --%>
    <h2>
      <c:out value="${stories.heading}" /> <em>${stories.forDate}</em>
    </h2>

    <%-- story list --%>
    <c:forEach items="${stories.articleMaps}" var="articleMap" varStatus="status">

      <div class="article ma-teaser clearfix ${status.last ? stories.lastItemStyleClass : ''}">

        <%-- title --%>
        <h3>
          <a href="${articleMap.url}">${fn:trim(articleMap.title)}</a>
        </h3>

        <%-- page tools --%>
        <jsp:include page="helpers/tools.jsp">
          <jsp:param name="showComments" value="${articleMap.showComments}"/>
          <jsp:param name="pluckArticleId" value="${articleMap.pluckArticleId}"/>
          <jsp:param name="dateTime" value="${articleMap.dateTime}"/>
          <jsp:param name="dateStringForTimeElement" value="${articleMap.dateStringForTimeElement}"/>
          <jsp:param name="imageHeavy" value="${articleMap.imageHeavy}"/>
          <jsp:param name="video" value="${articleMap.video}"/>
          <jsp:param name="topicName" value="${articleMap.topicMap.name}"/>
          <jsp:param name="topicUrl" value="${articleMap.topicMap.url}"/>
          <jsp:param name="articleUrl" value="${articleMap.url}"/>
        </jsp:include>
         
        <%-- leadtext --%>
        <p>
          <c:out value="${articleMap.intro}" escapeXml="false"/>
        </p>
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



  </div>
</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" />
