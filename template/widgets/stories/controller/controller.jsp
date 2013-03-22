<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/controller/controller.jsp#1 $
 * Last edited by : $Author: robyn.backhouse $ $Date: 2013-02-01 17:01:24 +0000 (Fri, 01 Feb 2013) $
 * Version        : $Revision: 8229 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="view" uri="http://www.escenic.com/taglib/escenic-view" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>


<%--create the map that will contain relevant field values --%>
<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="widgetId" value="${widgetContent.id}" />
<c:set target="${stories}" property="title" value="${fn:trim(element.fields.title.value)}"/>
<c:set target="${stories}" property="view" value="${fn:trim(widgetContent.fields.view.value)}"/>
<c:set target="${stories}" property="linkBehaviour" value="${fn:trim(widgetContent.fields.linkBehaviour)}"/>
<c:set target="${stories}" property="styleId" value="${fn:trim(widgetContent.fields.styleId.value)}"/>
<c:set target="${stories}" property="customStyleClass" value="${fn:trim(widgetContent.fields.customStyleClass)}"/>
<c:set target="${stories}" property="lastItemStyleClass" value="${fn:trim(widgetContent.fields.lastItemStyleClass)}"/>
<c:set target="${stories}" property="showFacebookShare" value="${widgetContent.fields.showFacebookShare.value}"/>

<c:set target="${stories}" property="contentType" value="${fn:trim(widgetContent.fields.contentType.value)}"/>

<c:set target="${stories}" property="displayByline" value="${widgetContent.fields.displayByline.value}"/>

<c:if test="${empty stories.displayByline}">
  <c:set target="${stories}" property="displayByline" value="false"/>  
</c:if>

<c:set target="${stories}" property="listBy" value="${fn:trim(widgetContent.fields.listBy.value)}"/>
<c:if test="${empty stories.listBy}">
  <c:set target="${stories}" property="listBy" value="section"/>  
</c:if>

<c:set target="${stories}" property="includeTagsSearchType"
       value="${fn:trim(widgetContent.fields.includeTagsSearchType.value)}"/>
<c:if test="${empty stories.includeTagsSearchType}">
  <c:set target="${stories}" property="includeTagsSearchType" value="OR"/>  
</c:if>

<c:set target="${stories}" property="excludeTagsSearchType"
       value="${fn:trim(widgetContent.fields.excludeTagsSearchType.value)}"/>
<c:if test="${empty stories.excludeTagsSearchType}">
  <c:set target="${stories}" property="excludeTagsSearchType" value="OR"/>  
</c:if>

<c:set var="sectionUniqueName" value="${fn:trim(widgetContent.fields.sectionUniqueName.value)}"/>
<c:if test="${empty sectionUniqueName}">
  <c:set var="setChannelAsDefault" value="${fn:trim(widgetContent.fields.setChannelAsDefault.value)}"/>
  <c:choose>
    <c:when test="${section.uniqueName == 'ece_frontpage'}">
      <c:set var="sectionUniqueName" value="${section.uniqueName}"/>
    </c:when>
    <c:when test="${setChannelAsDefault}">
      <section:ancestorView section="${section}" id="sectionsView" includeRoot="true"/>
      <view:iterate id="sec" view="${sectionsView}">
        <c:if test="${sec.parent.uniqueName == 'ece_frontpage'}">
          <c:set var="sectionUniqueName" value="${sec.uniqueName}"/>
        </c:if>
      </view:iterate>
      <c:remove var="sectionsView" scope="page"/>
    </c:when>
    
    <c:otherwise>
      <c:set var="sectionUniqueName" value="${section.uniqueName}"/>
    </c:otherwise>
  </c:choose>
</c:if>
<c:set target="${stories}" property="sectionUniqueName" value="${sectionUniqueName}"/>

<c:set target="${stories}" property="excludeSectionUniqueName"
       value="${fn:trim(requestScope.widgetContent.fields.excludeSectionUniqueName.value)}"/>

<c:set target="${stories}" property="homeSectionOnly"
       value="${fn:trim(widgetContent.fields.homeSectionOnly.value)}"/>
<c:set target="${stories}" property="groupName" value="${fn:trim(widgetContent.fields.groupName.value)}"/>

<section:use uniqueName="${stories.sectionUniqueName}">
  <c:set target="${stories}" property="sectionId" value="${section.id}"/>
  <c:set target="${stories}" property="sectionName" value="${section.name}"/>
  <c:set target="${stories}" property="sectionUrl" value="${section.url}"/>
</section:use>


<c:set target="${stories}" property="sortBy" value="${widgetContent.fields.listSort.value}"/>
<c:set target="${stories}" property="sortOrder" value="${widgetContent.fields.sortOrder.value}"/>
<c:set target="${stories}" property="weights" value="${widgetContent.fields.storyWeight.value}"/>

<c:set var="flag" value="false"/>
<c:forEach var="item" items="${stories.weights}" varStatus="status">
  <c:choose>
    <c:when test="${item eq 'all'}">
      <c:set var="listWeight" value=""/>
      <c:set var="flag" value="true"/>
    </c:when>
    <c:otherwise>
      <c:if test="${not flag}">
        <c:choose>
          <c:when test="${status.first}">
            <c:set var="listWeight" value="weight_text:${item}"/>
          </c:when>
          <c:otherwise>
            <c:set var="listWeight" value="${listWeight},weight_text:${item}"/>
          </c:otherwise>
        </c:choose>
      </c:if>
    </c:otherwise>
  </c:choose>
</c:forEach>


<c:if test="${not empty listWeight}">
  <c:set var="listWeight" value="(${listWeight})"/>
</c:if>

<c:set target="${stories}" property="weights" value="${listWeight}"/>

<c:set target="${stories}" property="subType" value="${fn:trim(widgetContent.fields.subType.value)}"/>
<c:choose>
  <c:when test="${not empty stories.subType and stories.subType != 'all_sub_types'}">
    <c:set var="subType" value="${stories.subType}"/>
  </c:when>
  <c:otherwise>
    <c:set var="subType" value=""/>
  </c:otherwise>
</c:choose>

<c:choose>
  <c:when test="${not empty stories.weights and not empty subType}">
    <c:set target="${stories}" property="subTypeQuery" value=" (sub-type_text:${subType})" />
  </c:when>
  <c:when test="${empty stories.weights and not empty subType}">
    <c:set target="${stories}" property="subTypeQuery" value="sub-type_text:${subType}"/>
  </c:when>
  <c:otherwise>
    <c:set target="${stories}" property="subTypeQuery" value="" />
  </c:otherwise>
</c:choose>

<c:set target="${stories}" property="showWidgetTitle" value="${widgetContent.fields.showWidgetTitleAdvanced.value}"/>
<c:set target="${stories}" property="widgetTitleSize" value="${widgetContent.fields.widgetTitleSize.value}"/>
<c:set target="${stories}" property="widgetTitleStyleClass" value="${widgetContent.fields.widgetTitleStyleClass.value}"/>
<c:set target="${stories}" property="widgetTitleBehaviour" value="${widgetContent.fields.widgetTitleBehaviour.value}"/>
<c:set target="${stories}" property="widgetTitleSectionUniqueName"
       value="${fn:trim(widgetContent.fields.widgetTitleSectionUniqueName.value)}"/>
<c:set target="${stories}" property="widgetTitleExternalUrl"
       value="${fn:trim(widgetContent.fields.widgetTitleExternalUrl.value)}"/>

<c:set var="relatedImages" value="${widgetContent.relatedElements.imageRel.items}"/>


<c:if test="${stories.showWidgetTitle == 'true' or not empty relatedImages}">

  <c:set var="widgetTitleUrl" value=""/>

  <c:choose>
    <c:when test="${stories.widgetTitleBehaviour == 'section'}">
      <c:if test="${not empty stories.widgetTitleSectionUniqueName}">
        <section:use uniqueName="${stories.widgetTitleSectionUniqueName}">
          <c:set var="widgetTitleUrl" value="${section.url}"/>
        </section:use>
      </c:if>
    </c:when>
    <c:when test="${stories.widgetTitleBehaviour  == 'topic'}">
      <c:if test="${not empty widgetContent.relatedElements.widgettitletopic.items}">
        <c:set var="relatedTopic" value="${widgetContent.relatedElements.widgettitletopic.items[0]}"/>
        <c:if test="${not empty relatedTopic.content.tags and 
          (relatedTopic.content.articleTypeName == 'topic' or relatedTopic.content.articleTypeName == 'tagCollection')}">
          <tm:getTagUrl id="tagUrl" tag="${relatedTopic.content.tags[0]}"/>
          <c:set var="widgetTitleUrl" value="${tagUrl}"/>
        </c:if>
      </c:if>
    </c:when>
    <c:when test="${stories.widgetTitleBehaviour  == 'externalUrl'}">
      <c:if test="${not empty stories.widgetTitleExternalUrl}">
        <c:set var="widgetTitleUrl" value="${stories.widgetTitleExternalUrl}"/>
      </c:if>
    </c:when>
  </c:choose>

  <c:set target="${stories}" property="widgetTitleUrl" value="${widgetTitleUrl}"/>
</c:if>

<c:if test="${not empty widgetContent.relatedElements.headerlink.items}">
  <collection:createList id="linksList" type="java.util.ArrayList" toScope="page"/>
  <c:forEach var="link" items="${widgetContent.relatedElements.headerlink.items}">
    <jsp:useBean id="linkMap" class="java.util.HashMap" scope="page"/>
    <c:choose>
      <c:when test="${link.content.articleTypeName == 'link'}">
	      <c:set target="${linkMap}" property="linkTitle" value="${link.fields.title}"/>
	
	      <c:set var="linkBehaviour" value="${link.content.fields.linkBehaviour}"/>
	      <c:choose>
	        <c:when test="${linkBehaviour == 'section'}">
	          <c:if test="${not empty link.content.fields.sectionUniqueName}">
	            <section:use uniqueName="${link.content.fields.sectionUniqueName}">
	              <c:set target="${linkMap}" property="linkUrl" value="${section.url}"/>
	            </section:use>
	          </c:if>
	        </c:when>
	        <c:when test="${linkBehaviour  == 'topic'}">
	          <c:if test="${not empty link.content.relatedElements.linktopic.items}">
	            <c:set var="relatedTopic" value="${link.content.relatedElements.linktopic.items[0]}"/>
	            <c:if test="${relatedTopic.content.articleTypeName == 'topic' && not empty relatedTopic.content.tags}">
	              <tm:getTagUrl id="tagUrl" tag="${relatedTopic.content.tags[0]}"/>
	              <c:set target="${linkMap}" property="linkUrl" value="${tagUrl}"/>
	            </c:if>
	          </c:if>
	        </c:when>
	        <c:when test="${linkBehaviour  == 'externalUrl'}">
	          <c:if test="${not empty fn:trim(link.content.fields.url)}">
	            <c:set target="${linkMap}" property="linkUrl" value="${fn:trim(link.content.fields.url)}"/>
	          </c:if>
	        </c:when>
	      </c:choose>
	      <collection:add collection="${linksList}" value="${linkMap}"/>
	      <c:remove scope="page" var="linkMap"/>
      </c:when>
      <c:when test="${link.content.articleTypeName == 'tagCollection'}">
        <c:if test= "${not empty link.content.tags and not empty link.content.tags[0]}">
          <tm:getTagUrl id="tagUrl" tag="${link.content.tags[0]}"/>
          <c:set target="${linkMap}" property="linkUrl" value="${tagUrl}"/>
          <collection:add collection="${linksList}" value="${linkMap}"/>
          <c:remove scope="page" var="linkMap"/>  
        </c:if>
      </c:when>
    </c:choose>
  </c:forEach>
  <c:set target="${stories}" property="headerLinksList" value="${linksList}"/>
</c:if>

<c:if test="${stories.showWidgetTitle == 'true' and stories.widgetTitleUrl == '' and not empty stories.headerLinksList}">
  <c:set target="${stories}" property="widgetTitleUrl" value="${stories.headerLinksList[0].linkUrl}"/>
</c:if>

<c:set target="${stories}" property="imageVersion" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>

<c:set target="${stories}" property="softCrop" value="${fn:trim(widgetContent.fields.softCrop)}"/>
<c:set target="${stories}" property="showCaption" value="default"/>

<c:set var="widgetHeaderImageVerison" value="${fn:trim(widgetContent.fields.widgetHeaderImageVersion.value)}"/>
<c:if test="${empty widgetHeaderImageVerison}">
  <c:set var="widgetHeaderImageVerison" value="s338c"/>
</c:if>
<c:if test="${not empty relatedImages and relatedImages[0].content.articleTypeName eq 'picture'}">
  <c:set var="imageVersion" value="${widgetHeaderImageVerison}"/>
  <collection:createMap id="relatedImageMap" type="java.util.HashMap" toScope="page"/>
  <article:use articleId="${relatedImages[0].content.id}">
    <c:set target="${relatedImageMap}" property="url" value="${article.fields.alternates.value[imageVersion].href}"/>
    <c:set target="${relatedImageMap}" property="inpageStyleClass"
           value="${article.fields.alternates.options.inpageClasses[imageVersion]}"/>
    <c:set target="${relatedImageMap}" property="alttext" value="${article.fields.alttext.value}"/>
    <c:set target="${relatedImageMap}" property="caption" value="${article.fields.caption.value}"/>
    <c:set target="${relatedImageMap}" property="width" value="${article.fields.alternates.value[imageVersion].width}"/>
    <c:set target="${relatedImageMap}" property="height" value="${article.fields.alternates.value[imageVersion].height}"/>
  </article:use>
  <c:set target="${stories}" property="widgetRelatedImageMap" value="${relatedImageMap}"/>
  <c:remove var="relatedImageMap" scope="page"/>
</c:if>
<c:remove var="relatedImages" scope="page"/>


<c:set var="noPrint" value="${fn:trim(widgetContent.fields.noPrint.value)}"/>
<c:set target="${stories}"
       property="wrapperStyleClass">widget stories ${stories.view} widget-editable viziwyg-section-${widgetContent.homeSection.id} inpage-widget-${widgetContent.id}
  <c:if test="${noPrint=='true'}"> noPrint</c:if>
  <c:if test="${not empty stories.customStyleClass}">${stories.customStyleClass}</c:if>
</c:set>


<%--
  Article Style filter
  If any of the checkboxes for feature, commercial, good images, infographic, interactive, video, podcast or poll 
  are ticked in the advanced tab in the stories widget, then only articles also with these ticked 
  should be visible. The following logic adds a filter to the solr query for this.
--%>
<collection:createList id="articleStyleFilterList" type="java.util.ArrayList"/>
<c:if test="${not empty widgetContent.fields.feature and widgetContent.fields.feature.value}">
  <collection:add collection="${articleStyleFilterList}" value="feature_b:true"/>
</c:if>
<c:if test="${not empty widgetContent.fields.commercial and widgetContent.fields.commercial.value}">
  <collection:add collection="${articleStyleFilterList}" value="commercial_b:true"/>
</c:if>
<c:if test="${not empty widgetContent.fields.goodImagesOnly and widgetContent.fields.goodImagesOnly.value}">
  <collection:add collection="${articleStyleFilterList}" value="image_heavy_b:true"/>
  <c:set target="${stories}" property="goodImagesOnly" value="${widgetContent.fields.goodImagesOnly.value}"/>
</c:if>
<c:if test="${not empty widgetContent.fields.imageGallery and widgetContent.fields.imageGallery.value}">
  <collection:add collection="${articleStyleFilterList}" value="image_gallery_b:true"/>
  <c:set target="${stories}" property="imageGallery" value="${widgetContent.fields.imageGallery.value}"/>
</c:if>
<c:if test="${not empty widgetContent.fields.infographic and widgetContent.fields.infographic.value}">
  <collection:add collection="${articleStyleFilterList}" value="infographic_b:true"/>
  <c:set target="${stories}" property="infographic" value="${widgetContent.fields.infographic.value}"/>
</c:if>
<c:if test="${not empty widgetContent.fields.interactive and widgetContent.fields.interactive.value}">
  <collection:add collection="${articleStyleFilterList}" value="interactive_b:true"/>
</c:if>
<c:if test="${not empty widgetContent.fields.video and widgetContent.fields.video.value}">
  <collection:add collection="${articleStyleFilterList}" value="video_b:true"/>
  <c:set target="${stories}" property="video" value="${widgetContent.fields.video.value}"/>
</c:if>
<c:if test="${not empty widgetContent.fields.podcast and widgetContent.fields.podcast.value}">
  <collection:add collection="${articleStyleFilterList}" value="podcast_b:true"/>
</c:if>
<c:if test="${not empty widgetContent.fields.poll and widgetContent.fields.poll.value}">
  <collection:add collection="${articleStyleFilterList}" value="poll_b:true"/>
</c:if>

<c:choose>
  <c:when test="${empty widgetContent.fields.articleStyleSearchType}">
    <c:set var="articleStyleSearchType" value="AND"/>
  </c:when>
  <c:otherwise>
    <c:set var="articleStyleSearchType" value="${fn:trim(widgetContent.fields.articleStyleSearchType)}"/>
  </c:otherwise>
</c:choose>
<c:set target="${stories}" property="articleStyleSearchType" value="${articleStyleSearchType}"/>
<c:set var="articleStyleFilter" value="${fn:replace(fn:replace(articleStyleFilterList,',', ' , '),',',articleStyleSearchType)}"/>

<c:set target="${stories}" property="articleStyleFilter" value="${fn:replace(fn:replace(articleStyleFilter,'[',''),']','')}" />
<c:remove var="articleStyleSearchType" scope="page"/>
<%-- 
  Business logic to display more link at the bottom of Storylist Widget
 --%>
<c:if test="${not empty widgetContent.fields.viewMoreStoriesLink.value}">
  <c:if test="${not empty widgetContent.fields.viewMoreStoriesLink.value.moreStoriesLinkText}">
    <c:set target="${stories}" property="moreStoriesLinkText" value="${widgetContent.fields.viewMoreStoriesLink.value.moreStoriesLinkText}"/>
    <%-- 
      If widgettitletopic item populted by tagCollection or topic then add more link to tag page.
      Otherwise add more link to section.
    --%>
    <c:choose>
      <c:when test="${not empty widgetContent.relatedElements.widgettitletopic.items}">
        <c:set var="moreStoriesLinkTag" value="${widgetContent.relatedElements.widgettitletopic.items[0]}" scope="page" />
        <c:if test="${not empty moreStoriesLinkTag.content.tags and 
          (moreStoriesLinkTag.content.articleTypeName == 'topic' or moreStoriesLinkTag.content.articleTypeName == 'tagCollection')}">
          <tm:getTagUrl id="moreStoriesTagUrl" tag="${moreStoriesLinkTag.content.tags[0]}"/>
          <c:set target="${stories}" property="moreStoriesLinkSectionUrl" value="${moreStoriesTagUrl}"/>
        </c:if>
        <c:remove scope="page" var="moreStoriesLinkTag"/>
      </c:when>
      <c:otherwise>
        <c:set var="moreStoriesLinkSection" value="${widgetContent.fields.viewMoreStoriesLink.value.moreStoriesLinkSection}" scope="page" />
        <c:if test="${empty moreStoriesLinkSection}">
          <c:set var="moreStoriesLinkSection" value="${stories.sectionUniqueName}"/>
        </c:if>
        <section:use uniqueName="${moreStoriesLinkSection}">
          <c:set target="${stories}" property="moreStoriesLinkSectionUrl" value="${section.url}"/>
       </section:use>
       <c:remove var="moreStoriesLinkSection" scope="page" />
      </c:otherwise>
    </c:choose>
  </c:if>
</c:if>
<c:set target="${stories}" property="toolOrder" value="${widgetContent.fields['toolOrder'].value}"/>
<c:if test="${empty stories.toolOrder}">
  <c:set target="${stories}" property="toolOrder" value="comments,gallery,video,topic,dateTime,rating"/>
</c:if>
<c:set var="showTimeStamp" value="${fn:trim(widgetContent.fields['showTimeStamp'].value)}"/>
<c:set target="${stories}" property="showTimeStamp"
       value="${not empty showTimeStamp and showTimeStamp ? 'true' : 'false'}"/>
<c:set var="dateTypeTimeStamp" value="${fn:trim(widgetContent.fields['dateTypeAdvanced'].value)}"/>
<c:set target="${stories}" property="dateTypeTimeStamp"
       value="${not empty dateTypeTimeStamp ? dateTypeTimeStamp : 'publishdate'}"/>
<c:set var="dateFormatTimeStamp" value="${fn:trim(widgetContent.fields['dateFormatAdvanced'].value)}"/>
<c:set target="${stories}" property="dateFormatTimeStamp"
       value="${not empty dateFormatTimeStamp ? dateFormatTimeStamp : 'dd MMM yyyy'}"/>

<c:set var="enableRummbleLabs" value="${fn:trim(widgetContent.fields.enableRummbleLabs.value)}"/>
<c:set target="${stories}" property="enableRummbleLabs" 
       value="${not empty enableRummbleLabs and enableRummbleLabs ? 'true' : 'false'}"/>

<c:if test="${stories.enableRummbleLabs}">
  <c:set var="rummbleLabsEnabled" value="${fn:trim(section.parameters['rummblelabs.enabled'])}"/>
  <c:if test="${not empty rummbleLabsEnabled and not rummbleLabsEnabled}">
    <c:set target="${stories}" property="enableRummbleLabs" value="false"/>  
  </c:if>
</c:if>

<c:set var="enableMultisitePublishedArticles" value="${fn:trim(widgetContent.fields.enableMultisitePublishedArticles.value)}"/>
<c:set target="${stories}" property="enableMultisitePublishedArticles" 
       value="${not empty enableMultisitePublishedArticles and enableMultisitePublishedArticles ? 'true' : 'false'}"/>

