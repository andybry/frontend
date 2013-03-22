<%-- 
  This helper transforms the articles that have been put into the request scope by the 
  'getArticles' helper into a simplified map that can be serialised more easily and more
  consistently

  Because it uses the articles list that is put in the request scope by getArticles it 
  needs to be called after that. Typically it would be called immediately after that,
  but needs to be called before the articles object is removed from the request scope
  (in the event that it is)
--%>
<c:set target="${stories}" property="hasArticles" value="${not empty stories.articles}"/>
<c:set target="${stories}" property="articleSummariesPresent" value="${not (stories.source eq 'automatic' or stories.source eq 'taggedArticles' or empty stories.source) and not stories.needArticlesOnly}" />

<%-- calculate the fields required by each article --%>
<jsp:useBean id="articleMaps" class="java.util.ArrayList" scope="page" />
<%-- loop over the articles. These can be PresentationArticles or summaries --%>
<c:forEach var="article" items="${stories.articles}" varStatus="status">
  <jsp:useBean id="articleMap" class="java.util.HashMap" scope="page" />

  <%-- calculate the presentation article (unecapsulating the summary if necessary) --%>
  <c:set scope="page" var="presentationArticle" value="${article}" />
  <c:if test="${stories.articleSummariesPresent}">
    <c:set scope="page" var="presentationArticle" value="${presentationArticle.content}" />
  </c:if>

  <%-- a few fields need to be handled differently if we are dealing with summaries --%>
  <c:choose>
    <c:when test="${not stories.articleSummariesPresent}">
      <tm:getTeaserImageMap var="teaserImageMap" articleId="${article.id}" 
        imageVersion="${stories.imageVersion}"
      />
      <c:if test="${stories.maxCharacters != 0}">
        <tm:getArticleIntro maxCharacters="${stories.maxCharacters}" id="intro" articleObject="${presentationArticle}"/>
      </c:if>
    </c:when>
    <c:otherwise>
      <tm:getTeaserImageMap var="teaserImageMap" articleSummary="${article}"
        imageVersion="${stories.imageVersion}"/>
      <c:set target="${articleMap}" property="inpageDnDSummaryClass" value="${articleSummary.options.inpageClasses}"/>
      <tm:getArticleIntro maxCharacters="${stories.maxCharacters}" id="intro" articleSummary="${article}"/>
    </c:otherwise>
  </c:choose>
 
  <%-- the article fields that can be calculated independent of whether we are using a summary or not --%>
  <c:set target="${articleMap}" property="url">
    <c:choose>
      <c:when test="${stories.linkBehaviour eq 'sectionPage'}">
        <c:out value="${presentationArticle.homeSection.url}" escapeXml="true"/>
      </c:when>
      <c:otherwise>
        <tm:getContentUrl var="cUrl" articleObject="${presentationArticle}"/>
        <c:out value="${cUrl}" escapeXml="true"/>
      </c:otherwise>
    </c:choose>
  </c:set>
  <c:set target="${articleMap}" property="id" value="${presentationArticle.id}"/>
  <wf-core:handleLineBreaks var="modifiedTitle" value="${article.fields.title.value}"/>
  <c:set target="${articleMap}" property="title" value="${modifiedTitle}"/>
  <wf-core:getCurtailedText var="curtailedTitle" inputText="${modifiedTitle}" maxLength="${stories.maxCharacters}"
    ellipsis="..."/>
  <c:set target="${articleMap}" property="curtailedTitle" value="${curtailedTitle}"/>
  <c:set target="${articleMap}" property="intro" value="${intro}"/>
  <c:set target="${articleMap}" property="inpageTitleClass" value="${article.fields.title.options.inpageClasses}"/>
  <c:set target="${articleMap}" property="showImage" value="${not empty requestScope.teaserImageMap.imageArticle}" />
  <c:set target="${articleMap}" property="flag" value="${fn:toLowerCase(presentationArticle.fields.flag.value)}" />
  <c:set target="${articleMap}" property="articleTypeName" value="${presentationArticle.articleTypeName}" />
  <c:set target="${articleMap}" property="showComments" value="${stories.showComments && elfn:isPluckEnabled(presentationArticle)}" />
  <c:set target="${articleMap}" property="pluckArticleId" value="${elfn:getPluckArticleId(presentationArticle)}" />
  <tm:getArticleDateTime dateTimeVar="dateTime"
    dateStringForTimeElementVar="dateStringForTimeElement"
    dateTimeInMsVar="dateTimeInMs"
    article="${presentationArticle}"
    dateType="${stories.dateTypeTimeStamp}"
    dateFormat="${stories.dateFormatTimeStamp}"/>
  <c:set target="${articleMap}" property="dateTime" value="${dateTime}" />
  <c:set target="${articleMap}" property="dateStringForTimeElement" value="${dateStringForTimeElement}" />
  <c:set target="${articleMap}" property="dateTimeInMs" value="${dateTimeInMs}" />
  <c:remove var="dateTime" scope="page"/>
  <c:remove var="dateStringForTimeElement" scope="page"/>
  <c:remove var="dateTimeInMs" scope="page"/>
  <c:set target="${articleMap}" property="imageHeavy" value="${presentationArticle.fields.image_heavy.value}" />
  <c:set target="${articleMap}" property="video" value="${presentationArticle.fields.video.value}" />
  <c:set target="${articleMap}" property="useRelatedItems" 
    value="${presentationArticle.owner and stories.relatedItem and fn:length(presentationArticle.relatedElements.storyRel.items) > 0}" />
  <c:set target="${articleMap}" property="rating" value="${presentationArticle.fields.rating.value}"/>
  <c:set target="${articleMap}" property="publishingDate" value="${presentationArticle.publishedDateAsDate}"/>
  <c:set target="${articleMap}" property="homeSectionName" value="${presentationArticle.homeSection.name}"/>
  <c:set target="${articleMap}" property="homeSectionUrl" value="${presentationArticle.homeSection.url}"/>
  <c:set target="${articleMap}" property="headlineStyle" value="${article.fields.headlineStylePictureNavigator.value}"/>
  <c:set target="${articleMap}" property="shortHeadline" value="${article.fields.shortHeadline.value}"/>

  <%-- construct the (sub) fields relating to the image if we have one--%>
  <c:if test="${articleMap.showImage}">
    <jsp:useBean id="imageMap" class="java.util.HashMap" scope="page" />
    <c:set target="${imageMap}" property="id" value="${teaserImageMap.imageArticleId}" />
    <c:set target="${imageMap}" property="inpageStyleClass" value="${teaserImageMap.inpageStyleClass}" />
    <c:set target="${imageMap}" property="url" value="${teaserImageMap.url}" />
    <c:set target="${imageMap}" property="alttext" value="${teaserImageMap.alttext}" />
    <c:set target="${imageMap}" property="width" value="${teaserImageMap.width}" />
    <c:set target="${imageMap}" property="height" value="${teaserImageMap.height}" />
    <c:set target="${imageMap}" property="showPictureCaption" value="${stories.showCaption!='hide' and not empty teaserImageMap.caption}"/>
    <c:set target="${imageMap}" property="captionDivId" value="widget${widgetContent.id}-story${storyArticle.id}-picture${teaserImageMap.imageArticleId}-info"/>
    <c:set target="${articleMap}" property="imageMap" value="${imageMap}" />
    <c:remove var="imageMap" scope="page"/>
    <c:remove var="teaserImageMap"/>
  </c:if>

  <%-- construct the (sub) fields relating to the topic if we have one--%>
  <tm:getArticleTopicMap article="${presentationArticle}" id="articleTopic"/>
  <jsp:useBean id="topicMap" class="java.util.HashMap" scope="page" />
  <c:set target="${topicMap}" property="name" value="${articleTopic.title}" />
  <c:set target="${topicMap}" property="url" value="${articleTopic.url}" />
  <c:set target="${articleMap}" property="topicMap" value="${topicMap}" />
  <c:remove var="topicMap" scope="page"/>
  <c:remove var="articleTopic"/>

  <%-- construct the (sub) fields relating to the author if we have one --%>
  <c:if test="${stories.displayByline}">
    <tm:getArticleListMap var="profileArticleListMap" 
      contentType="profile" 
      authorName="${presentationArticle.author.name}"                                                      
      maxItem="1"/>

    <jsp:useBean id="authorMaps" class="java.util.ArrayList" scope="page" />
    <c:set var="profileArticleList" value="${profileArticleListMap.items}"/>
    <c:set var="adminUserName" value="${publication.name}_admin"/>
    <c:forEach var="profileArticle" items="${profileArticleListMap.items}">
      <jsp:useBean id="authorMapA" class="java.util.HashMap" scope="page" />

      <c:if test="${presentationArticle.author.name eq profileArticle.author.name}">
        <section:use uniqueName="${presentationArticle.author.userName}">
          <c:set var="authorSection" value="${section}"/>
        </section:use>
        <c:set target="${authorMapA}" property="url" value="${authorSection.url}" />
        <c:set target="${authorMapA}" property="name" value="${presentationArticle.author.name}" />
        <c:set target="${authorMapA}" property="isAdministrator" value="${presentationArticle.author.userName eq adminUserName}" />
        <c:remove var="authorSection" />
      </c:if>

      <collection:add collection="${authorMaps}" value="${authorMapA}" />
      <c:remove var="authorMapA" scope="page" />
    </c:forEach>
    <c:if test="${empty authorMaps}">
      <jsp:useBean id="authorMapB" class="java.util.HashMap" scope="page" />
      <c:set target="${authorMapB}" property="name" value="${presentationArticle.author.name}" />
      <c:set target="${authorMapB}" property="isAdministrator" value="${presentationArticle.author.userName eq adminUserName}" />
      <collection:add collection="${authorMaps}" value="${authorMapB}" />
      <c:remove var="authorMapB" scope="page" />
    </c:if>
    <c:remove var="profileArticleListMap" />
    <c:remove var="adminUserName" />
    <c:set target="${articleMap}" property="authorMaps" value="${authorMaps}" />
    <c:remove var="authorMaps" scope="page" />
  </c:if>

  <%-- construct the (sub) fields relating to the related items if we have any and are using them --%>
  <c:if test="${articleMap.useRelatedItems}">
    <jsp:useBean id="relatedItemMaps" class="java.util.ArrayList" scope="page" />
    <c:forEach items="${presentationArticle.relatedElements.storyRel.items}" var="relatedStory" varStatus="status"
      end="${stories.numberOfRelatedItems}">
        <jsp:useBean id="relatedItemMap" class="java.util.HashMap" scope="page" />
        <c:set target="${relatedItemMap}" property="url" value="${relatedStory.content.url}" />
        <wf-core:handleLineBreaks var="relatedTitle" value="${relatedStory.fields.title}"/>
        <c:set target="${relatedItemMap}" property="title" value="${relatedTitle}" />
        <c:set target="${relatedItemMap}" property="imageHeavy" value="${relatedStory.content.fields.image_heavy.value}" />
        <c:set target="${relatedItemMap}" property="video" value="${relatedStory.content.fields.video.value}" />
        <collection:add collection="${relatedItemMaps}" value="${relatedItemMap}" />
        <c:remove var="relatedItemMap" scope="page" />
    </c:forEach>
    <c:set target="${articleMap}" property="relatedItemMaps" value="${relatedItemMaps}" />
    <c:remove var="relatedItemMaps" scope="page" />
  </c:if>

  <%-- if it exists (for Just Sayin), calculate the URL of the video main image --%>
  <c:if test="${not empty stories.videoUrlMap}">
    <c:set var="articleId" scope="page">${articleMap.id}</c:set>
    <c:set target="${articleMap}" property="videoMainImageUrl" value="${stories.videoUrlMap[articleId]}" />           
  </c:if>

  <collection:add collection="${articleMaps}" value="${articleMap}" />
  <c:remove var="articleMap" scope="page"/>
</c:forEach>

<c:set target="${stories}" property="articleMaps" value="${articleMaps}" />

<%-- remove fields that aren't serialisable --%>
<c:set target="${stories}" property="articles" value="" />
