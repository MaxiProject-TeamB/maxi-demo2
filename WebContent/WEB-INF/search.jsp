
<!DOCTYPE HTML><html lang="en"><head>
<meta charset="UTF-8">
<%@ page import="org.apache.lucene.document.*,
                 org.apache.lucene.search.*,
                 org.apache.lucene.search.IndexSearcher,
                 org.apache.lucene.analysis.Analyzer,
                 org.apache.lucene.analysis.standard.StandardAnalyzer,
                 java.io.*,
                 java.util.*,
                 java.io.InputStreamReader,
                 org.apache.lucene.search.Query,
                 org.apache.lucene.queryparser.classic.QueryParser,
                 org.apache.lucene.util.Version,
                 org.apache.lucene.store.*,
                 org.apache.lucene.index.*"%>
<body>
<form name="form1" method="get" action = "search.jsp">
   Input key words <input type="text" name="query" placeholder = "enter keyword here!">
  <input type="submit" name="Submit" value="submit">
</form>


	<%
        if (request.getParameter("query") != null && request.getParameter("query").length() > 1) {
    %>
    
    <h3>Results for '<%=request.getParameter("query")%>':</h3>
    
    <%
            try {
            	Directory dir = FSDirectory.open(new File("/Users/apple/Documents/workspace/myjava/helloLucene/index01"));
        		IndexReader reader = IndexReader.open(dir);
            	IndexSearcher searcher = new IndexSearcher(reader);
                Analyzer analyzer = new StandardAnalyzer();
                
                QueryParser parser =new QueryParser("content",new StandardAnalyzer());
                Query query = parser.parse(request.getParameter("query"));
                out.print(request.getParameter("query"));
                //out.println("Searching for: " + query.toString("contents"));

                TopDocs docs = searcher.search(query,10);
                ScoreDoc[] sd = docs.scoreDocs;
                //out.print(sd.length);
                out.print("<h3>Number of matching documents = " + sd.length + "</h3>");

                for(int i=0;i<sd.length;i++){
        			//out.print(sd);
        			Document d = searcher.doc(sd[i].doc);
        			out.print(d.get("filename") + d.get("path") +"\n");
        		}
                //out.print("0v0");
                
            } catch (Exception ee) {
                out.println("<b><p>Error: " + ee + "</p></b>");
            }
        }
    %>
</body>
</html>