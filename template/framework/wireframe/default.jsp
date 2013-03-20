<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-framework-core/src/main/webapp/template/framework/wireframe/default.jsp#1 $
 * Last edited by : $Author: michael.smith $ $Date: 2011-08-16 16:42:45 +0100 (Tue, 16 Aug 2011) $
 * Version        : $Revision: 41 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="http://www.escenic.com/taglib/escenic-util" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<c:set var="resourceUrl" value="${requestScope['resourceUrl']}"/>
<c:set var="templateUrl" value="${requestScope['templateUrl']}"/>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

  <head>
    <title>${publication.name}</title>
  </head>

  <body>
    <div class="explanation">
      <h1>Revision 10: Widget Framework</h1>
      <p>
        Demonstrates adding a filter to the Escenic Standard Filter Chain
      </p>
      <p>
        Changes:
        <ul>
          <li>
            META-INF/escenic/publication-resources/escenic (resource files)
            <ul>
              <li>
                layout-group - added configuration groups
              </li>
              <li>
                content-type - added a widget type
              </li>
            </ul>
          </li>
          <li>
            WEB-INF/lib (java libraries)
            <ul>
              <li>
                struts-1.2.9.jar - Struts libraries (used by the Widget Framework)
              </li>
              <li>
                widget-framework-core-tags-1.10.0.0.jar - Widget Framework tag library
              </li>
            </ul>
          </li>
          <li>
            template (contains all JSP files)
            <ul>
              <li>
                common.jsp - deterimines which configuration section to use and which wireframe to use
              </li>
              <li>
                widgets (contains all widget templates)
                <ul>
                  <li>
                    code (a widget type for outputting html)
                    <ul>
                      <li>
                        index.jsp - controls the logic within the widget
                      </li>
                      <li>
                        controller (directory for templates which assemble data for the views)
                        <ul>
                          <li>
                            controller.jsp - controller used for all views
                          </li>
                          <li>
                            html.jsp - controller used for a specific view
                          </li>
                        </ul>
                      </li>
                      <li>
                        view (directory containing the output templates for the widget)
                        <ul>
                          <li>html.jsp - view</li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li>
                framework (contains layout output logic)
                <ul>
                  <li>
                    wireframe (templates for top level structure)
                    <ul>
                      <li>
                        default.jsp - outputs html, head, title, and body HTML elements
                      </li>
                    </ul>
                  </li>
                  <li>
                    element (template for outputting a widget)
                    <ul>
                      <li>
                        ats.jsp - article type selector, calls the index.jsp of a given widget
                      </li>
                    </ul>
                  </li>
                  <li>
                    group (templates for outputting Escenic groups)
                    <ul>
                      <li>
                        getitems.jsp - retrieves widgets for the current config section, for a given area
                      </li>
                      <li>
                        getparentitems.jsp - retrieve widgets from a parent config section, for a given area (if the area of the current configuration section is empty)
                      </li>
                      <li>
                        showitems.jsp - shows the items in an area
                      </li>
                      <li>
                        configGroup.jsp - outputs the root group configGroup (see layout-group file for definition)
                      </li>
                      <li>
                        childGroup.jsp - output for the childGroup (see layout-group file for definition)
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </p>
      <p>
        The webapp demonstrates the core of the Widget Framework by outputting the widgets in the given configuration section below (configuration section is determined by the URL):
      </p>
    </div><!-- end of explanation div (start of the Widget Framework code proper) -->

    <wf-core:renderContext />
  </body>
  
</html>
