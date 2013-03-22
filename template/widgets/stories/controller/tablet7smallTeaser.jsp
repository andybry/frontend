<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the tablet7smallTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<c:set var="template" value="/template/handlebars/widgets/stories/tablet7smallTeaser.tmpl"/>

<%-- ************** --%>
<%--  OUTPUT JSON   --%>


<c:set var="json" scope="page">
  {
    "url": "http://www.mirror.co.uk/news/uk-news/reading-crocodile-cyclist-claims-saw-1720391",
    "title": "Is there a crocodile in the River Thames? Cyclist claims he saw 4ft long predator swimming in water",
    "pubDate": "20 Feb 2013 15:59",
    "imageUrl": "http://i3.mirror.co.uk/incoming/article1553410.ece/ALTERNATES/s338b/A+large+saltwater+crocodile+shows+aggression+as+a+boat+passes+by+on+the+Adelaide+river",
    "imageAltText": "Scary: It's claimed the 4ft long crocodile was spotted in the River Thames in Reading",
    "topicUrl": "http://www.mirror.co.uk/all-about/crocodiles",
    "topicName": "Crocodiles",
    "intro": "The 64-year-old says he got the shock of his life when he saw the large reptile swimming along the waterway at Reading",
     "hasRelatedStories": false
  }
</c:set>

<shared:handlebars template="${template}" json="${json}" />
