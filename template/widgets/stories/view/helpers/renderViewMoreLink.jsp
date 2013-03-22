<%--
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${not empty stories.articles and not empty stories.moreStoriesLinkText}">
  <div class="see-all">
    <a class="more" href="${stories.moreStoriesLinkSectionUrl}">${stories.moreStoriesLinkText}</a>
  </div>
</c:if>
