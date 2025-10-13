<!-- Content Header -->
  <section class="content-header">
    <h1>
      Add New Branch
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Add Branch</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Branch Information Form</h3>
          </div><!-- /.box-header -->

          <form method="POST" action="controller.php?action=add_branch" enctype="multipart/form-data">
            <div class="box-body">

              <div class="col-sm-8">
                <table class="table table-bordered table-striped">
                  <tbody>
                    <tr>
                      <th>Short Name <span style="color:red">*</span></th>
                      <td><input type="text" name="short_name" class="form-control" placeholder="Enter short name" required></td>
                    </tr>
                    <tr>
                      <th>Full Name <span style="color:red">*</span></th>
                      <td><input type="text" name="full_name" class="form-control" placeholder="Enter full branch name" required></td>
                    </tr>
                    <tr>
                      <th>Address <span style="color:red">*</span></th>
                      <td><input type="text" name="address" class="form-control" placeholder="Enter address" required></td>
                    </tr>
                    <tr>
                      <th>Pin Code</th>
                      <td><input type="text" name="pincode" maxlength="6" class="form-control" placeholder="Enter pin code"></td>
                    </tr>
                    <tr>
                      <th>Code</th>
                      <td><input type="text" name="code" class="form-control" placeholder="Enter short code"></td>
                    </tr>
                    <tr>
                      <th>Year Established</th>
                      <td><input type="number" name="year" class="form-control" placeholder="Enter year (e.g., 2005)"></td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="col-sm-4">
                <h4>Branch Logo</h4>
                <input type="file" name="branch_logo" class="form-control">
                <span class="help-block">Upload PNG/JPG (Max 2MB)</span>
                <img src="upload/default_branch.png" class="img-responsive" style="max-height:300px; margin-top:10px;" alt="Branch Logo Preview" />
              </div>

            </div><!-- /.box-body -->

            <div class="box-footer">
              <div class="pull-right">
                <button type="submit" name="save" class="btn btn-success">
                  <i class="glyphicon glyphicon-floppy-disk"></i> Save
                </button>
                <button type="reset" class="btn btn-warning">
                  <i class="glyphicon glyphicon-refresh"></i> Reset
                </button>
                <a href="index.php" class="btn btn-danger">
                  <i class="fa fa-times"></i> Cancel
                </a>
              </div>
            </div><!-- /.box-footer -->
          </form>

        </div><!-- /.box -->
      </div><!-- /.col -->
    </div><!-- /.row -->
  </section><!-- /.content -->
