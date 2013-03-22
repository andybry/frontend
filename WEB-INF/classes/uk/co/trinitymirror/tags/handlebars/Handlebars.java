package uk.co.trinitymirror.tags.handlebars;

import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;
import java.io.InputStream;
import java.io.IOException;
import org.apache.commons.io.IOUtils;
import java.util.HashMap;


/**
  * Renders a handlebars template using Rhino
  */
public class Handlebars extends SimpleTagSupport {

  private String template;
  private String json;

  /**
    * the Handlebars template
    */
  public void setTemplate(String template) {
    this.template = template;
  }

  /**
    * the json string to use as the context
    */
  public void setJson(String json) {
    this.json = json;
  }

  /**
    * Renders a handlebars template
    */
  public void doTag() throws IOException {
    PageContext pageContext = (PageContext) getJspContext();
    ServletContext context = pageContext.getServletContext();
    InputStream handlebarsStream = context.getResourceAsStream("/resources/js/handlebars.js");
    String handlebarsCode = IOUtils.toString(handlebarsStream);
    InputStream handlebarsTemplateStream = context.getResourceAsStream(template);
    String handlebarsTemplateCode = IOUtils.toString(handlebarsTemplateStream);
    StringBuffer javascriptCode = new StringBuffer();
    javascriptCode.append(handlebarsCode);
    javascriptCode.append("var context = JSON.parse(contextAsString);");
    javascriptCode.append("var html = Handlebars.compile(template)(context);");
    Context cx = Context.enter();
    Scriptable scope = cx.initStandardObjects();
    ScriptableObject.putProperty(scope, "template", handlebarsTemplateCode);
    ScriptableObject.putProperty(scope, "contextAsString", json);
    Object result = cx.evaluateString(scope, javascriptCode.toString(), "<cmd>", 1, null);
    String html = scope.get("html", scope).toString();
    pageContext.getOut().print(html);
  }

}
