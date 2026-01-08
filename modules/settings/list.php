<?php if ($_SESSION['type'] == 'Administrator') { ?>
  <!-- Content Header -->
  <section class="content-header">
    <h1>
      General Settings
      <small>Control Panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
      <li class="active">General Settings</li>
    </ol>
  </section>
  <hr>

  <div class="row">
    <div class="col-md-4">
      <div class="form-group">
        <label>Settings Language</label>
        <select name="lang_id" class="form-control max-500">
          <option value="1">English</option>
          <option value="2">Spanish</option>
        </select>
      </div>
    </div>

    <div class="col-md-12">
      <form action="#" method="post" enctype="multipart/form-data">

        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_1" data-toggle="tab">General Settings</a></li>
            <li><a href="#tab_2" data-toggle="tab">Logo</a></li>
            <li><a href="#tab_3" data-toggle="tab">Contact Settings</a></li>
            <li><a href="#tab_4" data-toggle="tab">Social Media</a></li>
          </ul>

          <div class="tab-content settings-tab-content">
            <div class="tab-pane active" id="tab_1">
              <div class="form-group">
                <label>Timezone</label>
                <select class="form-control max-600">
                  <option value="Asia/Kolkata">Asia/Kolkata</option>
                  <option value="America/New_York">America/New_York</option>
                </select>
              </div>

              <div class="form-group">
                <label>Application Name</label>
                <input type="text" class="form-control" name="application_name" placeholder="App Name">
              </div>

              <div class="form-group">
                <label>Footer About Section</label>
                <textarea class="form-control text-area" style="min-height: 140px;"></textarea>
              </div>

              <div class="form-group">
                <label>Optional URL Name</label>
                <input type="text" class="form-control" name="optional_url_button_name">
              </div>

              <div class="form-group">
                <label>Copyright</label>
                <input type="text" class="form-control" name="copyright">
              </div>
            </div>

            <!------------------------  Tab2 for Logo ----------------------->
            <div class="tab-pane" id="tab_2">
              <style>
                .logo-section {
                  display: flex;
                  flex-wrap: wrap;
                  gap: 40px;
                  margin-bottom: 40px;
                }

                .logo-block {
                  flex: 1;
                  min-width: 250px;
                }

                .logo-label {
                  font-weight: bold;
                  margin-bottom: 10px;
                  display: block;
                }

                .logo-box {
                  border: 1px solid #eee;
                  padding: 10px;
                  display: inline-block;
                  margin-bottom: 10px;
                  background: #fff;
                }

                .logo-box img {
                  max-width: 250px;
                  max-height: 120px;
                  object-fit: contain;
                }

                .logo-upload-btn {
                  background-color: #00b29e;
                  color: white;
                  padding: 6px 12px;
                  font-size: 13px;
                  border-radius: 4px;
                  display: inline-block;
                  position: relative;
                  overflow: hidden;
                  cursor: pointer;
                  margin-right: 5px;
                }

                .logo-upload-btn input[type="file"] {
                  position: absolute;
                  left: 0;
                  top: 0;
                  opacity: 0;
                  height: 100%;
                  width: 100%;
                  cursor: pointer;
                }

                .file-types {
                  font-size: 12px;
                  color: #555;
                  margin-top: 5px;
                }
              </style>

              <div class="logo-section">
                <!-- Logo -->
                <div class="logo-block">
                  <label class="logo-label">Logo</label>
                  <div class="logo-box">
                    <img src="logo.png" alt="Logo">
                  </div><br>
                  <label class="logo-upload-btn">
                    Change logo
                    <input type="file" name="logo" accept=".png, .jpg, .jpeg, .gif, .svg">
                  </label>
                  <span class="file-types">(.png, .jpg, .jpeg, .gif, .svg)</span>
                </div>

                <!-- Logo Footer -->
                <div class="logo-block">
                  <label class="logo-label">Logo Footer</label>
                  <div class="logo-box">
                    <img src="logo-footer.png" alt="Logo Footer">
                  </div><br>
                  <label class="logo-upload-btn">
                    Change logo
                    <input type="file" name="logo_footer" accept=".png, .jpg, .jpeg, .gif, .svg">
                  </label>
                  <span class="file-types">(.png, .jpg, .jpeg, .gif, .svg)</span>
                </div>
              </div>

              <!-- Email Logo -->
              <div class="logo-block">
                <label class="logo-label">Logo Email</label>
                <div class="logo-box">
                  <img src="logo-email.png" alt="Logo Email">
                </div><br>
                <label class="logo-upload-btn">
                  Change logo
                  <input type="file" name="logo_email" accept=".png, .jpg, .jpeg">
                </label>
                <span class="file-types">(.png, .jpg, .jpeg)</span>
              </div>

              <!-- Favicon -->
              <div class="logo-block" style="margin-top: 20px;">
                <label class="logo-label">Favicon (16x16px)</label>
                <div class="logo-box">
                  <img src="favicon.png" alt="Favicon" style="max-width: 70px;">
                </div><br>
                <label class="logo-upload-btn">
                  Change favicon
                  <input type="file" name="favicon" accept=".png">
                </label>
                <span class="file-types">(.png)</span>
              </div>

            </div>

            <!-- Tab3 For Contact us -->

            <div class="tab-pane" id="tab_3">
              <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" name="contact_address">
              </div>

              <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" name="contact_email">
              </div>

              <div class="form-group">
                <label>Phone</label>
                <input type="text" class="form-control" name="contact_phone">
              </div>

              <div class="form-group">
                <label>Contact Text</label>
                <textarea class="form-control"></textarea>
              </div>
            </div>

            <div class="tab-pane" id="tab_4">
              <div class="form-group">
                <label>Facebook URL</label>
                <input type="text" class="form-control" name="facebook_url">
              </div>
              <div class="form-group">
                <label>Twitter URL</label>
                <input type="text" class="form-control" name="twitter_url">
              </div>
              <div class="form-group">
                <label>Instagram URL</label>
                <input type="text" class="form-control" name="instagram_url">
              </div>
              <div class="form-group">
                <label>Youtube URL</label>
                <input type="text" class="form-control" name="youtube_url">
              </div>
            </div>
          </div>

          <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">Save Changes</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <style>
    .tox-tinymce {
      height: 340px !important;
    }
  </style>





<?php
} else {

  redirect('../../errorpage/page_404.html');
}
?>