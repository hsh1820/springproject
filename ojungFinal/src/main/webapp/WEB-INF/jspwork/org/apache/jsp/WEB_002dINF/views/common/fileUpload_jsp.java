/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-03-15 08:17:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class fileUpload_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1583419384000L));
    _jspx_dependants.put("jar:file:/C:/workspace/RealFinal/ojungFinal/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, false, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Test</title>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"http://code.jquery.com/jquery-1.11.3.js\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("            .dragAndDropDiv {\r\n");
      out.write("                border: 2px dashed #92AAB0;\r\n");
      out.write("                width: 650px;\r\n");
      out.write("                height: 200px;\r\n");
      out.write("                color: #92AAB0;\r\n");
      out.write("                text-align: center;\r\n");
      out.write("                vertical-align: middle;\r\n");
      out.write("                padding: 10px 0px 10px 10px;\r\n");
      out.write("                font-size:200%;\r\n");
      out.write("                display: table-cell;\r\n");
      out.write("            }\r\n");
      out.write("            .progressBar {\r\n");
      out.write("                width: 200px;\r\n");
      out.write("                height: 22px;\r\n");
      out.write("                border: 1px solid #ddd;\r\n");
      out.write("                border-radius: 5px; \r\n");
      out.write("                overflow: hidden;\r\n");
      out.write("                display:inline-block;\r\n");
      out.write("                margin:0px 10px 5px 5px;\r\n");
      out.write("                vertical-align:top;\r\n");
      out.write("            }\r\n");
      out.write("             \r\n");
      out.write("            .progressBar div {\r\n");
      out.write("                height: 100%;\r\n");
      out.write("                color: #fff;\r\n");
      out.write("                text-align: right;\r\n");
      out.write("                line-height: 22px; /* same as #progressBar height if we want text middle aligned */\r\n");
      out.write("                width: 0;\r\n");
      out.write("                background-color: #0ba1b5; border-radius: 3px; \r\n");
      out.write("            }\r\n");
      out.write("            .statusbar{\r\n");
      out.write("                border-top:1px solid #A9CCD1;\r\n");
      out.write("                min-height:25px;\r\n");
      out.write("                width:99%;\r\n");
      out.write("                padding:10px 10px 0px 10px;\r\n");
      out.write("                vertical-align:top;\r\n");
      out.write("            }\r\n");
      out.write("            .statusbar:nth-child(odd){\r\n");
      out.write("                background:#EBEFF0;\r\n");
      out.write("            }\r\n");
      out.write("            .filename{\r\n");
      out.write("                display:inline-block;\r\n");
      out.write("                vertical-align:top;\r\n");
      out.write("                width:250px;\r\n");
      out.write("            }\r\n");
      out.write("            .filesize{\r\n");
      out.write("                display:inline-block;\r\n");
      out.write("                vertical-align:top;\r\n");
      out.write("                color:#30693D;\r\n");
      out.write("                width:100px;\r\n");
      out.write("                margin-left:10px;\r\n");
      out.write("                margin-right:5px;\r\n");
      out.write("            }\r\n");
      out.write("            .abort{\r\n");
      out.write("                background-color:#A8352F;\r\n");
      out.write("                -moz-border-radius:4px;\r\n");
      out.write("                -webkit-border-radius:4px;\r\n");
      out.write("                border-radius:4px;display:inline-block;\r\n");
      out.write("                color:#fff;\r\n");
      out.write("                font-family:arial;font-size:13px;font-weight:normal;\r\n");
      out.write("                padding:4px 15px;\r\n");
      out.write("                cursor:pointer;\r\n");
      out.write("                vertical-align:top\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("            $(document).ready(function(){\r\n");
      out.write("                var objDragAndDrop = $(\".dragAndDropDiv\");\r\n");
      out.write("                \r\n");
      out.write("                $(document).on(\"dragenter\",\".dragAndDropDiv\",function(e){\r\n");
      out.write("                    e.stopPropagation();\r\n");
      out.write("                    e.preventDefault();\r\n");
      out.write("                    $(this).css('border', '2px solid #0B85A1');\r\n");
      out.write("                });\r\n");
      out.write("                $(document).on(\"dragover\",\".dragAndDropDiv\",function(e){\r\n");
      out.write("                    e.stopPropagation();\r\n");
      out.write("                    e.preventDefault();\r\n");
      out.write("                });\r\n");
      out.write("                $(document).on(\"drop\",\".dragAndDropDiv\",function(e){\r\n");
      out.write("                    \r\n");
      out.write("                    $(this).css('border', '2px dotted #0B85A1');\r\n");
      out.write("                    e.preventDefault();\r\n");
      out.write("                    var files = e.originalEvent.dataTransfer.files;\r\n");
      out.write("                \r\n");
      out.write("                    handleFileUpload(files,objDragAndDrop);\r\n");
      out.write("                });\r\n");
      out.write("                \r\n");
      out.write("                $(document).on('dragenter', function (e){\r\n");
      out.write("                    e.stopPropagation();\r\n");
      out.write("                    e.preventDefault();\r\n");
      out.write("                });\r\n");
      out.write("                $(document).on('dragover', function (e){\r\n");
      out.write("                  e.stopPropagation();\r\n");
      out.write("                  e.preventDefault();\r\n");
      out.write("                  objDragAndDrop.css('border', '2px dotted #0B85A1');\r\n");
      out.write("                });\r\n");
      out.write("                $(document).on('drop', function (e){\r\n");
      out.write("                    e.stopPropagation();\r\n");
      out.write("                    e.preventDefault();\r\n");
      out.write("                });\r\n");
      out.write("                //drag 영역 클릭시 파일 선택창\r\n");
      out.write("                objDragAndDrop.on('click',function (e){\r\n");
      out.write("                    $('input[type=file]').trigger('click');\r\n");
      out.write("                });\r\n");
      out.write(" \r\n");
      out.write("                $('input[type=file]').on('change', function(e) {\r\n");
      out.write("                    var files = e.originalEvent.target.files;\r\n");
      out.write("                    handleFileUpload(files,objDragAndDrop);\r\n");
      out.write("                });\r\n");
      out.write("                \r\n");
      out.write("                function handleFileUpload(files,obj)\r\n");
      out.write("                {\r\n");
      out.write("                   for (var i = 0; i < files.length; i++) \r\n");
      out.write("                   {\r\n");
      out.write("                        var fd = new FormData();\r\n");
      out.write("                        fd.append('file', files[i]);\r\n");
      out.write("                 \r\n");
      out.write("                        var status = new createStatusbar(obj); //Using this we can set progress.\r\n");
      out.write("                        status.setFileNameSize(files[i].name,files[i].size);\r\n");
      out.write("                        sendFileToServer(fd,status);\r\n");
      out.write("                 \r\n");
      out.write("                   }\r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("                var rowCount=0;\r\n");
      out.write("                function createStatusbar(obj){\r\n");
      out.write("                        \r\n");
      out.write("                    rowCount++;\r\n");
      out.write("                    var row=\"odd\";\r\n");
      out.write("                    if(rowCount %2 ==0) row =\"even\";\r\n");
      out.write("                    this.statusbar = $(\"<div class='statusbar \"+row+\"'></div>\");\r\n");
      out.write("                    this.filename = $(\"<div class='filename'></div>\").appendTo(this.statusbar);\r\n");
      out.write("                    this.size = $(\"<div class='filesize'></div>\").appendTo(this.statusbar);\r\n");
      out.write("                    this.progressBar = $(\"<div class='progressBar'><div></div></div>\").appendTo(this.statusbar);\r\n");
      out.write("                    this.abort = $(\"<div class='abort'>중지</div>\").appendTo(this.statusbar);\r\n");
      out.write("                    \r\n");
      out.write("                    obj.after(this.statusbar);\r\n");
      out.write("                 \r\n");
      out.write("                    this.setFileNameSize = function(name,size){\r\n");
      out.write("                        var sizeStr=\"\";\r\n");
      out.write("                        var sizeKB = size/1024;\r\n");
      out.write("                        if(parseInt(sizeKB) > 1024){\r\n");
      out.write("                            var sizeMB = sizeKB/1024;\r\n");
      out.write("                            sizeStr = sizeMB.toFixed(2)+\" MB\";\r\n");
      out.write("                        }else{\r\n");
      out.write("                            sizeStr = sizeKB.toFixed(2)+\" KB\";\r\n");
      out.write("                        }\r\n");
      out.write("                 \r\n");
      out.write("                        this.filename.html(name);\r\n");
      out.write("                        this.size.html(sizeStr);\r\n");
      out.write("                    }\r\n");
      out.write("                    \r\n");
      out.write("                    this.setProgress = function(progress){       \r\n");
      out.write("                        var progressBarWidth =progress*this.progressBar.width()/ 100;  \r\n");
      out.write("                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + \"% \");\r\n");
      out.write("                        if(parseInt(progress) >= 100)\r\n");
      out.write("                        {\r\n");
      out.write("                            this.abort.hide();\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                    \r\n");
      out.write("                    this.setAbort = function(jqxhr){\r\n");
      out.write("                        var sb = this.statusbar;\r\n");
      out.write("                        this.abort.click(function()\r\n");
      out.write("                        {\r\n");
      out.write("                            jqxhr.abort();\r\n");
      out.write("                            sb.hide();\r\n");
      out.write("                        });\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("                function sendFileToServer(formData,status)\r\n");
      out.write("                {\r\n");
      out.write("                    var uploadURL = \"fileUpload/post\"; //Upload URL\r\n");
      out.write("                    var extraData ={}; //Extra Data.\r\n");
      out.write("                    var jqXHR=$.ajax({\r\n");
      out.write("                            xhr: function() {\r\n");
      out.write("                            var xhrobj = $.ajaxSettings.xhr();\r\n");
      out.write("                            if (xhrobj.upload) {\r\n");
      out.write("                                    xhrobj.upload.addEventListener('progress', function(event) {\r\n");
      out.write("                                        var percent = 0;\r\n");
      out.write("                                        var position = event.loaded || event.position;\r\n");
      out.write("                                        var total = event.total;\r\n");
      out.write("                                        if (event.lengthComputable) {\r\n");
      out.write("                                            percent = Math.ceil(position / total * 100);\r\n");
      out.write("                                        }\r\n");
      out.write("                                        //Set progress\r\n");
      out.write("                                        status.setProgress(percent);\r\n");
      out.write("                                    }, false);\r\n");
      out.write("                                }\r\n");
      out.write("                            return xhrobj;\r\n");
      out.write("                        },\r\n");
      out.write("                        url: uploadURL,\r\n");
      out.write("                        type: \"POST\",\r\n");
      out.write("                        contentType:false,\r\n");
      out.write("                        processData: false,\r\n");
      out.write("                        cache: false,\r\n");
      out.write("                        data: formData,\r\n");
      out.write("                        success: function(data){\r\n");
      out.write("                            status.setProgress(100);\r\n");
      out.write("                 \t\t\t\r\n");
      out.write("                            //$(\"#status1\").append(\"File upload Done<br>\");           \r\n");
      out.write("                        }\r\n");
      out.write("                    }); \r\n");
      out.write("                 \r\n");
      out.write("                    status.setAbort(jqXHR);\r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"fileUpload\"  class=\"dragAndDropDiv\">Drag & Drop Files Here or Browse Files</div>\r\n");
      out.write("        <input type=\"file\" name=\"fileUpload\" id=\"fileUpload\" style=\"display:none;\" multiple/>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
