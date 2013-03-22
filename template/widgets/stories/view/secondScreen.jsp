<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<!-- start of the new presentation logic -->
<c:if test="${stories.hasArticles}">
  <%-- header --%>
  <h3 class="container-title">Latest News</h3>

  <%-- stories --%>
  <div class="media-items-container">
    <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
      <div class="news-media-item">

        <%-- image (if present) --%>
        <c:if test="${articleMap.showImage}">
          <div class="news-picture">
            <a href="${articleMap.url}" target="_blank">
              <img src="${articleMap.imageMap.url}"
                 alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
                 title="<c:out value='${articleMap.imageMap.caption}' escapeXml='true'/>" />
            </a>
          </div>
        </c:if>

        <%-- comments, title and leadtext --%>
        <div class="news-info">
          
          <%-- title --%>
          <h3><a href="${articleMap.url}" target="_blank">${articleMap.title}</a></h3>

          <%-- comments --%>
          <c:if test="${stories.showCommentsSecondScreen}">
            <span class="hide">
              <div class="comments-baloon" data-pluckArticleId="${articleMap.pluckArticleId}"></div>
              <div class="comments-label"></div>
            </span>
          </c:if>

          <%-- leadtext --%>
          <div class="clearfix"></div>
          <p>${articleMap.intro}</p>
        </div>

      </div>
    </c:forEach>
  </div>
</c:if>

<c:remove var="stories"/>
