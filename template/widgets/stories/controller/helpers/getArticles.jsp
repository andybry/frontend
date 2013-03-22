<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/controller/helpers/getArticles.jsp#1 $
 * Last edited by : $Author: robyn.backhouse $ $Date: 2013-02-19 14:09:56 +0000 (Tue, 19 Feb 2013) $
 * Version        : $Revision: 8808 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-section" prefix="section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shared" uri="/WEB-INF/jsp/shared-taglib.tld" %>


<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>
<%-- if passed, any article with this id will be removed from the list of articles returned --%>
<c:choose>
  <c:when test="${not empty param.excludeArticleId}">
    <c:set var="excludeArticleId" value="${param.excludeArticleId}"/>
  </c:when>
  <c:otherwise>
    <c:set var="excludeArticleId" value=""/>
  </c:otherwise>
</c:choose>


<c:if test="${not empty section.parameters['language.code']}">
  <c:set var="locale">
    ${section.parameters['language.code']}
  </c:set>
  <c:set var="dateFormat" value="yyyy-MM-dd HH:mm"/>
  <fmt:parseDate var="articleListDate" value="${requestScope.articleListDateString}" parseLocale="${locale}"
                 pattern="${dateFormat}" type="DATE" scope="page"/>
</c:if>

<c:if test="${not empty  param.calculateStartDate && param.calculateStartDate eq '1' && empty section.parameters['language.code']}">
  <fmt:parseDate var="articleListDate" value="${requestScope.articleListDateString}" pattern="${dateFormat}" type="DATE" scope="page"/>  
</c:if>

<c:if test="${(stories.source eq 'desked') or (stories.source eq 'fallback')}">
  <%-- first fetch the target group --%>
  <c:choose>
    <c:when test="${stories.sectionUniqueName == section.uniqueName}">
      <wf-core:getGroupByName var="myGroup"
                              groupName="${stories.groupName}"
                              areaName="${requestScope.contentAreaName}"/>
    </c:when>
    <c:otherwise>
      <section:use uniqueName="${stories.sectionUniqueName}">
        <wf-core:getPresentationPool var="myPool" section="${section}"/>
      </section:use>

      <wf-core:getGroupByName var="myGroup"
                              groupName="${stories.groupName}"
                              areaName="${requestScope.contentAreaName}"
                              pool="${myPool}"/>
      <c:remove var="myPool" scope="request"/>
    </c:otherwise>
  </c:choose>
  <%--then fetch articles from the target group --%>
  <c:choose>
    <c:when test="${not empty requestScope.myGroup}">
      <wf-core:getArticleSummariesInGroup var="articleSummaries" group="${requestScope.myGroup}"
                                          contentType="${stories.contentType}"/>
      <c:set var="areaName" value="${requestScope.myGroup.type}-area"/>
      <c:set target="${stories}" property="inpageDnDAreaClass"
             value="${requestScope.myGroup.areas[areaName].options.inpageClasses}"/>
      <c:if test="${not empty stories.goodImagesOnly and stories.goodImagesOnly}">
        <%-- Keep the articles  which has image_heavy field turned on --%>
        <collection:createList id="filteredArticleListForPicNav" type="java.util.ArrayList"/>
        <c:forEach items="${requestScope.articleSummaries}" var="item">
          <c:if test="${not empty item.content.fields.image_heavy and item.content.fields.image_heavy.value}">
            <collection:add collection="filteredArticleListForPicNav" value="${item}"/>
          </c:if>
        </c:forEach>
        <c:set var="articleSummaries" value="${filteredArticleListForPicNav}" scope="request"/>
        <c:remove var="filteredArticleListForPicNav"/>
      </c:if>
      
      <c:if test="${(not empty stories.imageGallery and stories.imageGallery) or (not empty stories.video and stories.video)}">
        <%-- Keep the articles which have either video and/or image gallery flag turned on --%>
        <collection:createList id="filteredArticleListForCustomStoryList" type="java.util.ArrayList"/>
        <c:set var="bothGalleryVideoSearch" value="${(not empty stories.imageGallery and stories.imageGallery) and
                                                     (not empty stories.video and stories.video)}" scope="request"/>
        <c:set var="articleStyleSearchType" value="${stories.articleStyleSearchType == 'AND' ? 'AND' : 'OR'}" scope="request"/> 
        <c:forEach items="${requestScope.articleSummaries}" var="item">
          <c:choose>
            <c:when test="${not bothGalleryVideoSearch}">
               <c:choose>
                 <c:when test="${not empty stories.imageGallery and stories.imageGallery}">
                   <c:if test="${(not empty item.content.fields.image_gallery and item.content.fields.image_gallery.value)}">
                     <collection:add collection="filteredArticleListForCustomStoryList" value="${item}"/>
                   </c:if>
                 </c:when>
                 <c:otherwise>
                   <c:if test="${(not empty item.content.fields.video and item.content.fields.video.value)}">
                     <collection:add collection="filteredArticleListForCustomStoryList" value="${item}"/>
                   </c:if>
                 </c:otherwise>
               </c:choose>         
             </c:when>
             <c:otherwise>
               <c:choose>
                 <c:when test="${articleStyleSearchType == 'AND'}"> 
                   <c:if test="${(not empty item.content.fields.image_gallery and item.content.fields.image_gallery.value) and
                                (not empty item.content.fields.video and item.content.fields.video.value)}">
                     <collection:add collection="filteredArticleListForCustomStoryList" value="${item}"/>
                   </c:if>
                 </c:when>
                 <c:otherwise>
                   <c:if test="${(not empty item.content.fields.image_gallery and item.content.fields.image_gallery.value) or 
                                (not empty item.content.fields.video and item.content.fields.video.value)}">
                     <collection:add collection="filteredArticleListForCustomStoryList" value="${item}"/>
                   </c:if>
                 </c:otherwise>
               </c:choose>
             </c:otherwise>
           </c:choose>
         </c:forEach>
         <c:set var="articleSummaries" value="${filteredArticleListForCustomStoryList}" scope="request"/>
         <c:remove var="bothGalleryVideoSearch"/>
         <c:remove var="articleStyleSearchType"/>
         <c:remove var="filteredArticleListForCustomStoryList"/>
       </c:if>
      
      <c:choose>
        <c:when
            test="${(empty requestScope.articleSummaries or fn:length(requestScope.articleSummaries) == 0) and stories.source eq 'fallback'}">
          <c:set target="${stories}" property="source" value="automatic"/>
        </c:when>
        <c:otherwise>
          <c:if test="${not empty param.excludeArticleId}">
            <collection:createList id="filteredArticleList" type="java.util.ArrayList"/>
            <c:forEach var="item" items="${requestScope.articleSummaries}">
              <c:if test="${item.content.id != param.excludeArticleId}">
                <collection:add collection="filteredArticleList" value="${item}"/>
              </c:if>
            </c:forEach>
            <c:set var="articleSummaries" value="${filteredArticleList}" scope="request"/>
            <c:remove var="filteredArticleList" scope="request"/>
          </c:if>
          <wf-core:getSubList id="resultList" sourceList="${requestScope.articleSummaries}"
                              startIndex="${stories.begin}"
                              numberOfItems="${stories.numberOfItems}"/>
          <c:choose>
            <c:when test="${not empty param.needArticlesOnly and param.needArticlesOnly}">
              <collection:createList id="articleList" type="java.util.ArrayList"/>
              <c:forEach var="item" items="${requestScope.resultList}">
                <article:use articleId="${item.content.id}">
                  <collection:add collection="articleList" value="${article}"/>
                </article:use>
              </c:forEach>
              <c:set target="${stories}" property="articles" value="${articleList}"/>
              <c:remove var="articleList" scope="request"/>
            </c:when>
            <c:otherwise>
              <c:set target="${stories}" property="articles" value="${requestScope.resultList}"/>
            </c:otherwise>
          </c:choose>
          <c:set target="${stories}" property="resultCount" value="${fn:length(requestScope.articleSummaries)}"/>
          <c:remove var="resultList" scope="request"/>
        </c:otherwise>
      </c:choose>

      <c:remove var="articleSummaries" scope="request"/>
    </c:when>
    <c:otherwise>
      <c:if test="${stories.source eq 'fallback'}">
        <c:set target="${stories}" property="source" value="automatic"/>
      </c:if>
    </c:otherwise>
  </c:choose>

  <c:remove var="myGroup" scope="request"/>
</c:if>
<c:if test="${stories.source eq 'automatic'}">
  <article:use articleId="${param.widgetContentId}">
    <tm:getRelatedTagIds var="includeTagList" presentationArticle="${requestScope.article}"
                         relationTypeName="includeTagCollection"/>

    <tm:getRelatedTagIds var="excludeTagList" presentationArticle="${requestScope.article}"
                         relationTypeName="excludeTagCollection"/>
  </article:use>

  <c:choose>
    <c:when test="${not empty stories.sectionUniqueName and not empty stories.excludeSectionUniqueName}">
      <section:use uniqueName="${stories.sectionUniqueName}">
        <c:set var="sectionId" value="${requestScope.section.id}"/>
      </section:use>
      <section:use uniqueName="${stories.excludeSectionUniqueName}">
        <c:set var="excludeSectionQuery"
          value="(section:${sectionId}) AND -(section:${requestScope.section.id} OR home_section:${requestScope.section.id})"/>
      </section:use>
    </c:when>
    <c:otherwise>
      <c:set var="excludeSectionQuery" value=""/>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${stories.listBy == 'section'}">
      <c:choose>
        <c:when test="${not empty excludeSectionQuery}">
          <tm:getArticleListMap var="resultMap"
                                contentType="${stories.contentType}"
                                fromDate="${articleListDate}"
                                filterQuery="${stories.weights}${stories.subTypeQuery} ${stories.articleStyleFilter} ${excludeSectionQuery} ${stories.filterQuery}"
                                sortBy="${stories.sortBy} ${stories.sortOrder}"
                                startIndex="${stories.begin}"
                                maxItem="${stories.numberOfItems}"
                                includeTags="${includeTagList}"
                                excludeTags="${excludeTagList}"
                                homeSectionOnly="${stories.homeSectionOnly}"
                                includeTagsSearchType="${stories.includeTagsSearchType}"
                                excludeTagsSearchType="${stories.excludeTagsSearchType}"
                                excludeArticleIds="${excludeArticleId}"
                                enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
        </c:when>
        <c:otherwise>
          <c:set var="sectionUniqueName" value="${fn:trim(widgetContent.fields.sectionUniqueName.value)}"/>
          <c:choose>
            <c:when test="${not empty includeTagList or not empty excludeTagList}">
              <c:choose>
                <c:when test="${empty sectionUniqueName}">
                  <c:set var="listFromSection" value=""/>
                </c:when>
                <c:when test="${not empty sectionUniqueName}">
                  <c:set var="listFromSection" value="${sectionUniqueName}"/>
                </c:when>
              </c:choose>
            </c:when>
            <c:otherwise>
              <c:set var="listFromSection" value="${stories.sectionUniqueName}"/>
            </c:otherwise>
          </c:choose>

          <tm:getArticleListMap var="resultMap"
                                sectionName="${listFromSection}"
                                contentType="${stories.contentType}"
                                fromDate="${articleListDate}"
                                filterQuery="${stories.weights} ${stories.articleStyleFilter} ${stories.subTypeQuery} ${stories.filterQuery}"
                                sortBy="${stories.sortBy} ${stories.sortOrder}"
                                startIndex="${stories.begin}"
                                maxItem="${stories.numberOfItems}"
                                includeTags="${includeTagList}"
                                excludeTags="${excludeTagList}"
                                homeSectionOnly="${stories.homeSectionOnly}"
                                includeTagsSearchType="${stories.includeTagsSearchType}"
                                excludeTagsSearchType="${stories.excludeTagsSearchType}"
                                excludeArticleIds="${excludeArticleId}"
                                enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:when test="${stories.listBy == 'creator'}">
			<tm:getArticleListMap var="resultMap"
				creatorUserName="${requestScope.section.uniqueName}"
				contentType="${stories.contentType}" fromDate="${articleListDate}"
				filterQuery="${stories.weights}${stories.subTypeQuery} ${stories.articleStyleFilter} ${excludeSectionQuery} ${stories.filterQuery}"
				sortBy="${stories.sortBy} ${stories.sortOrder}"
				startIndex="${stories.begin}" maxItem="${stories.numberOfItems}"
				includeTags="${includeTagList}" excludeTags="${excludeTagList}"
				homeSectionOnly="${stories.homeSectionOnly}"
				includeTagsSearchType="${stories.includeTagsSearchType}"
				excludeTagsSearchType="${stories.excludeTagsSearchType}"
				excludeArticleIds="${excludeArticleId}"
				enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
		</c:when>
    <c:otherwise>
      <shared:getUser var="authorName" userName="${requestScope.section.uniqueName}"/>
      <c:if test="${not empty authorName}">
        <tm:getArticleListMap var="resultMap"
                              authorName="${authorName.name}"
                              contentType="${stories.contentType}"
                              fromDate="${articleListDate}"
                              filterQuery="${stories.weights}${stories.subTypeQuery} ${stories.articleStyleFilter} ${excludeSectionQuery} ${stories.filterQuery}"
                              sortBy="${stories.sortBy} ${stories.sortOrder}"
                              startIndex="${stories.begin}"
                              maxItem="${stories.numberOfItems}"
                              includeTags="${includeTagList}"
                              excludeTags="${excludeTagList}"
                              homeSectionOnly="${stories.homeSectionOnly}"
                              includeTagsSearchType="${stories.includeTagsSearchType}"
                              excludeTagsSearchType="${stories.excludeTagsSearchType}"
                              excludeArticleIds="${excludeArticleId}"
                              enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
      </c:if>

    </c:otherwise>
  </c:choose>


  <c:set target="${stories}" property="articles" value="${resultMap.items}"/>
  <c:set target="${stories}" property="resultCount" value="${resultMap.count}"/>
</c:if>

<c:if test="${stories.source == 'taggedArticles' and (not empty requestScope['com.escenic.framework.ece.tag'] or not empty stories.primaryTagQuery)}">
  <c:choose>
    <c:when test="${not empty stories.excludeSectionUniqueName}">
      <section:use uniqueName="${stories.excludeSectionUniqueName}">
        <c:set var="excludeSectionQuery"
               value="-(section:${requestScope.section.id} OR home_section:${requestScope.section.id})"/>
      </section:use>
    </c:when>
    <c:otherwise>
      <c:set var="excludeSectionQuery" value=""/>
    </c:otherwise>
  </c:choose>
  <tm:getArticleListMap var="resultMap"
                        contentType="${stories.contentType}"
                        includeTags="${requestScope['com.escenic.framework.ece.tag'].id}"
                        excludeTags="${excludeTagList}"
                        filterQuery="${stories.weights} ${stories.subTypeQuery} ${stories.primaryTagQuery} ${stories.articleStyleFilter} ${excludeSectionQuery} ${stories.filterQuery}"
                        sortBy="${stories.sortBy} ${stories.sortOrder}"
                        startIndex="${stories.begin}"
                        maxItem="${stories.numberOfItems}"
                        includeTagsSearchType="${stories.includeTagsSearchType}"
                        excludeTagsSearchType="${stories.excludeTagsSearchType}"/>
  <c:set target="${stories}" property="articles" value="${resultMap.items}"/>
  <c:set target="${stories}" property="resultCount" value="${resultMap.count}"/>
</c:if>

