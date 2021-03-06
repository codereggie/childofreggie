<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hackduke.codereggie.actions.SortEvents" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <head>
    <title>
      POSTUP
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/main.css" rel="stylesheet">
    <!-- Jasny Bootstrap Extensions -->
    <link href="extend/css/jasny-bootstrap.min.css" rel="stylesheet">
    <!-- Datepicker Bootstrap Extension-->
    <link href="datepicker/css/datepicker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  
  <% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>
  

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dist/js/bootstrap.min.js"></script>

    <!-- Header Row -->
    <div class="row">

    <!-- Site Title -->
          <div class="col-xs-12 col-sm-6 col-md-6">
                  <h1 style="margin-top:0px;">
        POSTUP
      </h1>
          </div>

    <!-- Upload Poster Button -->
          <div class="col-xs-12 col-sm-6 col-md-6" style="margin-top:10px;">
                  <button id="upload_button" type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" style="margin-left:20px; padding-left:12px; padding-right:12px;">
                          <span class="glyphicon glyphicon-plus">
                          </span>
                  </button>
          </div>

    <!-- MODAL: Upload Poster Form -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">

                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Upload an Event Poster</h4>
                      </div>

                      <div class="modal-body">
                        <form class="form-horizontal" role="form" action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
                          <script src="extend/js/jasny-bootstrap.min.js"></script>
                            <div class="fileinput fileinput-new" data-provides="fileinput" style="display:block; width:100%;">
                                          <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:100%; max-height:900px;">    
                  </div>
                                          <div>
                                            <span class="btn btn-primary btn-file">
                      <span class="fileinput-new">
                        Select image
                      </span>
                      <span class="fileinput-exists">
                        Change
                      </span>
                      <input type="file" name="myFile">
                    </span>
                                            <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                          </div>

              <div class="form-group">
                <label for="inputEventTitle" class="col-sm-3 control-label">
                  Event Title
                </label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="inputEventtitle" placeholder="Event Title" name="title">
                </div>
              </div>
              
              <div class="form-group">
                <label for="inputAddress" class="col-sm-3 control-label">
                  Address
                </label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="inputAddress" placeholder="Address" name="address">
                </div>
              </div>

              <div class="form-group">
                <script src="datepicker/js/bootstrap-datepicker.js">
                </script>
                <script type="text/javascript" src="scripts/js/date-picker.js">
                </script>
                      <label for="inputEventTitle" class="col-sm-3 control-label">
                  Date
                </label>
                      <div class="dropdown col-sm-9">
                              <input type="text" class="datepicker" placeholder="Click me!" style="border-width:1px;" name="date">
                      </div>
              </div>

              <div class="form-group">
                <label for="inputAdditionalInfo" class="col-sm-3 control-label">Additional Info</label>
                <div class="col-sm-9">
                  <textarea class="form-control" rows="5" name="additionalInfo"></textarea>
                </div>
              </div>

              <div class="form-group">
                <label for="inputTags" class="col-sm-3 control-label">
                  Tags
                </label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="inputTags" placeholder="music, food, art, etc" name="tags">
                </div>
              </div>

              <div class="form-group">
                <label for="inputVenues" class="col-sm-3 control-label">
                  Places
                </label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="inputVenues" placeholder="Where are you hanging this in real life?" name="venues">
                </div>
              </div>
              
              <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                      <button type="submit" class="btn btn-success">Submit</button>
                      </div>
            </form>                        
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
    </div>
    
    <div class="col-md-12">
            <!-- MASONRY START -->
            <script src="/masonry/js/masonry.pkgd.min.js"></script>
            <script type="text/javascript">
         	// initialize Masonry
            var msnry = new Masonry( container );
            // layout Masonry again after all images have loaded
            imagesLoaded( container, function() {
              msnry.layout();
            });
            </script>
                <div id="container" class="js-masonry" data-masonry-options='{ "columnWidth": 310, "itemSelector": ".item", "isFitWidth": true, "gutter": 10}' style="float:none;margin-left:auto;margin-right:auto;">
                        <!-- <div class="grid-sizer"></div> -->
                        
                        <% 
                        SortEvents sorter = new SortEvents();
                        ArrayList<String> imageUrls = new ArrayList<String>();
                        imageUrls = sorter.sortBySoonest();
                        for (int i = 0; i < imageUrls.size(); i++) {
                        %>        
                        <div class="item">
                                <img src="<%= imageUrls.get(i) %>"></img>
                        </div>
                        <%
                        }
                        %>
                        
                </div>
        </div>
        
  </body>
</html>