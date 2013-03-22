<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the tablet7rankedListTeaser view of stories widget
 * States described in MIR-1319
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="bean" uri="http://jakarta.apache.org/struts/tags-bean" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>
<jsp:useBean id="rankedController" class="uk.co.trinitymirror.widgets.stories.Tablet7RankedListController" scope="page"/>

<%--Identify whether the URL is ESI ---%>
<c:set var="esiUrl" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<c:set var="isInESI" value="${fn:containsIgnoreCase(esiUrl, '/esi/')}"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceTablet7RankedList.value)}"/>
<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginTablet7RankedList.value) - 1}"/> 
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsTablet7RankedList.value)}"/>
<c:set target="${stories}" property="useShortHeadline" value="${fn:trim(widgetContent.fields.useTablet7ShortHeadline.value)}" />
<c:set target="${stories}" property="displayStoriesOnly" value="false"/>

<tm:evalField id="title" inputFieldValue="${fn:trim(widgetContent.fields.title.value)}"/>
<c:set target="${stories}" property="title" value="${title}" />
<c:remove var="title" scope="request"/>

<section:use uniqueName="${fn:trim(widgetContent.fields.helpTablet7SectionUniqueName.value)}">
  <c:set var="helpSectionLink" value="${section.url}" />
</section:use>
<c:set target="${stories}" property="helpSectionLink" value="${helpSectionLink}"/>
<c:set var="useShortHeadline" value="${stories.useShortHeadline}" />
<c:set target="${stories}" property="useShortHeadline" value="${stories.useShortHeadline}" />
<c:set var="isAjaxCallback" value="${not empty param['service'] and param['service'] eq 'ajax'}" />
<c:if test="${isAjaxCallback or isInESI}">
  <c:set var="numberToOutput" value="${stories.numberOfItems}" />
  <%-- RL would like around 30 stories in the list to them
  unfortunately getArticles needs this value in numberOfItems. Sorry if it is confusing. --%>
  <c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsForRummbleTablet7RankedList.value)}" />
</c:if>
<c:choose>
  <c:when test="${requestScope['com.escenic.context']=='art'}">
    <jsp:useBean id="article" type="neo.xredsys.presentation.PresentationArticle" scope="request"/>
    <c:set var="curArticleId" value="${article.id}"/>
  </c:when>
  <c:otherwise>
    <c:set var="curArticleId" value=""/>
  </c:otherwise>
</c:choose>

<%--
   on the esi request we set the rlUserId properly and then get the ordered list of articles
   on the ajax request we make the call to RL and get the ordered list of articles
   on the 'normal' request we just output the default list of articles
--%>

<c:set target="${stories}" property="needArticlesOnly" value="${true}"/>
<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${stories.widgetId}"/>
  <jsp:param name="needArticlesOnly" value="${stories.needArticlesOnly}"/>
</jsp:include>

<%-- manually exclude the current article from the list
note that we do this here as we are overfetching for RL already and the solr query is more cacheable if we
strip the current article post query --%>
<collection:createList id="filteredArticleList" type="java.util.ArrayList"/>
<c:forEach items="${stories.articles}" var="item">
  <c:if test="${item.id != curArticleId}">
    <collection:add collection="filteredArticleList" value="${item}"/>
  </c:if>
</c:forEach>
<c:set target="${stories}" property="articles" value="${filteredArticleList}"/>
<c:remove var="filteredArticleList"/>

<c:if test="${not empty stories.articles}">
 
  <c:choose>
    <c:when test="${isInESI}"> 
      <jsp:setProperty property="request" name="rankedController" value="${pageContext.request}"/>
      <jsp:setProperty property="viewContent" name="rankedController" value="${stories}"/>
      <jsp:setProperty property="response" name="rankedController" value="${pageContext.response}"/>
      <c:set var="stories" scope="request" value="${rankedController.viewContent}"/>
      <c:set var="userId" value="${stories.rlUserId}"/>
      <c:set var="loggedIn" value="${stories.loggedIn}"/> 
    </c:when>
    <c:when test="${isAjaxCallback}">
      <c:set var="userId" value="${fn:trim(param['userId'])}"/>
      <c:set var="loggedIn" value="${fn:trim(param['loggedIn'])}" />  
    </c:when>
  </c:choose>
  
  <c:choose>
    <c:when test="${(isInESI or isAjaxCallback) and (not empty stories.enableRummbleLabs and stories.enableRummbleLabs)}">
        <%--
	      *If ESI is enabled, use it instead of Ajax calls
	
	      *If using the ajax request we make the call to RL and get the ordered list of articles
	      *on the 'normal' request we just output the default list of articles
	    --%>

      <%@ page contentType="text/html; charset=UTF-8" %>
      <c:set target="${stories}" property="contentType" value="application/json; charset=UTF-8"/>
      <c:set target="${stories}" property="displayStoriesOnly" value="true"/>
      <jsp:useBean id="publication" scope="request" type="neo.xredsys.api.Publication"/>
      <c:choose>
        <c:when test="${loggedIn == 'true'}">
          <c:set var="loggedIn" value="true"/>
        </c:when>
        <c:otherwise>
          <c:set var="loggedIn" value="false"/>
        </c:otherwise>
      </c:choose>
      <c:if test="${not empty userId}">
        <c:set var="idList" value="" />
        <%-- This will hold the list of articles too old to send to RL --%>
        <collection:createList id="unorderedArticleList"/>
        <c:forEach var="item" items="${stories.articles}">
          <%-- only send articles to RL if they are younger than a given number of hours--%>
          <c:set var="maxAgeOfArticlesInHours" value="${fn:trim(widgetContent.fields.maxAgeTablet7RankedList.value)}" />
          <c:if test="${empty maxAgeOfArticlesInHours}">
            <c:set var="maxAgeOfArticlesInHours" value="5"/>
          </c:if>
          <c:choose>
            <c:when test="${elfn:isArticleYoungerThan(item.publishedDateAsDate,maxAgeOfArticlesInHours)}">
              <c:choose>
                <c:when test="${empty idList}">
                  <c:set var="idList" value="${elfn:getPluckArticleId(item)}" />
                </c:when>
                <c:otherwise>
                  <c:set var="idList" value="${idList},${elfn:getPluckArticleId(item)}" />
                </c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              <collection:add collection="unorderedArticleList" value="${item}"/>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        <c:choose>
          <%-- we have some 'new' articles to send to RL --%>
          <c:when test="${not empty idList}">
            <c:url var="rummbleUrl" value="${section.parameters['rummblelabs.apiUrl']}">
              <c:param name="event" value="action.rankedList"/>
              <c:param name="userId" value="${userId}"/>
              <c:param name="itemIds" value="${idList}"/>
            </c:url>
            <c:catch var="ex">
              <c:import url="${rummbleUrl}" var="xmldoc"/>
            </c:catch>
            <c:if test="${not empty ex}">
              <util:logMessage level="error" message="Error on retrieving URL from rummble webapp" />
              <util:logMessage level="error" message="${ex}"/>
              <c:set var="xmldoc" value="" />
              <c:set var="orderedArticleList" value="${unorderedArticleList}"/>
            </c:if>
          </c:when>
          <c:otherwise>
            <%-- nothing to send to RL so just default to the full list in the order returned by the controller --%>
            <c:set var="xmldoc" value="" />
            <c:set var="orderedArticleList" value="${unorderedArticleList}"/>
            <%-- nothing to recommend so don't show the box --%>
            <c:choose>
              <c:when test="${loggedIn}">
                <c:set var="recommendState" value="1" />
              </c:when>
              <c:otherwise>
                <c:set var="recommendState" value="3" />
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

        <c:choose>
          <c:when test="${not empty xmldoc}">
            <x:parse xml="${fn:trim(xmldoc)}" var="output"/>

            <c:set var="rankedArticles">
              <x:out select="$output/rankedArticles/orderedList" escapeXml="false" />
            </c:set>
            <collection:createList id="orderedArticleList"/>
            <c:choose>
              <c:when test="${empty rankedArticles}">
                <%-- RL couldn't recommend anything for them => just take the default order --%>
                <c:set target="${stories}" property="recommendedOrder" value="${false}" />
                <c:forEach var="item" items="${stories.articles}">
                  <collection:add collection="orderedArticleList" value="${item}" />
                </c:forEach>
                <c:choose>
                  <c:when test="${loggedIn == 'true'}">
                    <c:set var="recommendState" value="2" />
                  </c:when>
                  <c:otherwise>
                    <c:set var="recommendState" value="4" />
                  </c:otherwise>
                </c:choose>
              </c:when>
              <c:otherwise>
                <%-- Create order list of PresentationArticles from RL's recommendations,
                then pad list with older articles up to the original number --%>
                <c:set target="${stories}" property="recommendedOrder" value="${true}" />
                <bean:define id="presentationLoader" name="com.escenic.presentation.PresentationLoader"
                             type="neo.xredsys.presentation.PresentationLoader" />
                <x:forEach select="$output/rankedArticles/orderedList" var="id">
                  <c:set var="articleId">
                    <x:out select="$id" escapeXml="false"/>
                  </c:set>
                  <c:set var="item"
                         value="${elfn:getEscenicArticleFromPluckId(publication, presentationLoader, articleId)}"/>
                  <c:if test="${not empty item}">
                    <collection:add collection="orderedArticleList" value="${item}" />
                  </c:if>
                </x:forEach>
                <collection:addAll collection="orderedArticleList" add="${unorderedArticleList}"/>
                <c:choose>
                  <c:when test="${loggedIn == 'true'}">
                    <c:set var="recommendState" value="1" />
                  </c:when>
                  <c:otherwise>
                    <c:set var="recommendState" value="3" />
                  </c:otherwise>
                </c:choose>
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <%-- Shouldn't happen, but RL sent us an empty XML packet in reply--%>
            <c:set var="orderedArticleList" value="${stories.articles}"/>
          </c:otherwise>
        </c:choose>
      </c:if>

      <jsp:include page="helpers/calculateViewModel.jsp" />
      <%-- create the data structure for the view from the 'ordered' list of PresentationArticles --%>
      <c:set target="${stories}" property="recommendState" value="${recommendState}" />
      <c:set target="${stories}" property="contentType" value="text/html; charset=UTF-8"/>
    </c:when>
    <c:otherwise>
      <%-- in the non-ajax view of the widget. Construct ajax URL based on the current context - section, article ... --%>
      <c:choose>
        <c:when test="${requestScope['com.escenic.context']=='art'}">
          <tm:getContentUrl var="ajaxUrl" articleObject="${article}"/>
        </c:when>
        <c:when test="${not empty requestScope['com.escenic.framework.ece.tag']}">
          <c:set var="ajaxUrl"
                 value="${publication.url}${requestScope['com.escenic.framework.topic.pattern.uri']}/${requestScope['com.escenic.framework.topic.term']}"/>
        </c:when>        
        <c:otherwise>
          <c:set var="ajaxUrl" value="${section.url}"/>
        </c:otherwise>
      </c:choose>
      <c:set var="replaceDomainUrl" value="${section.parameters['rummblelabs.replaceDomainUrl']}" />
      <c:if test="${not empty replaceDomainUrl}">
        <c:set var="ajaxUrl" value="${fn:replace(ajaxUrl,publication.url,replaceDomainUrl)}" />
      </c:if>
      <c:set var="ajaxUrl" value="${ajaxUrl}?service=ajax&item=${fn:trim(widgetContent.fields.ajaxUrlParamTablet7RankedList.value)}"/>
      <jsp:include page="helpers/calculateViewModel.jsp" />
      <c:set target="${stories}" property="recommendState" value="5"/><%-- logged out/recommend off --%>      
      <c:set target="${stories}" property="ajaxUrl" value="${ajaxUrl}"/>
      <c:set target="${stories}" property="contentType" value="text/html; charset=UTF-8"/>
    </c:otherwise>
  </c:choose>
</c:if>

<c:set target="${stories}" property="personalisationJsUrl" value="${requestScope.resourceUrl}js/tm.personalisation.js?v=1" />
<c:set target="${stories}" property="uuidJsUrl" value="${resourceUrl}js/tm.uuid.js" />
<c:set target="${stories}" property="cookieJsUrl" value="${requestScope.resourceUrl}js/tm.cookie.js" />
