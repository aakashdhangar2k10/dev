<?php
// Fetch vehicles with branch name
include('../../includes/db.php');
include('./controller.php');
// --- Logged-in user info ---
$user_id = $_SESSION['acct_id'] ?? 0;
$user_type = $_SESSION['type'] ?? '';

// --- Fetch vehicles based on user type ---
if ($user_type === 'Administrator') {
  // Admin sees all vehicles
  $stmt = $conn->query("
        SELECT v.id, v.vehicle_no, v.branch_id, b.short_name
        FROM vehicle_details_tbl v
        LEFT JOIN branches_tbl b ON v.branch_id = b.id
        ORDER BY v.vehicle_no ASC
    ");
} else {
  // Non-admin sees only assigned vehicles
  $assigned_branch_id = getAssignedBranchId($conn, $user_id); // function should return branch_id for user
  $stmt = $conn->prepare("
        SELECT v.id, v.vehicle_no, v.branch_id, b.short_name
        FROM vehicle_details_tbl v
        LEFT JOIN branches_tbl b ON v.branch_id = b.id
        WHERE v.branch_id = :branch_id AND v.assigned_staff = :user_id
        ORDER BY v.vehicle_no ASC
    ");
  $stmt->execute([
    ':branch_id' => $assigned_branch_id,
    ':user_id' => $user_id
  ]);
}

$vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Vehicle - Upload Images</title>
  <style>
    .box {
      background: #fff;
      box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
      padding: 20px;
      /* margin-top: 20px; */
    }

    .image-row {
      background: #fafafa;
      padding: 12px;
      border-radius: 6px;
      border: 1px solid #ddd;
      margin-bottom: 10px;
    }

    .upload-status {
      font-size: 14px;
      display: block;
      margin-top: 6px;
    }

    .bold-select {
      font-weight: bold;
    }
    
    /* Loading spinner */
    .loading-spinner {
      border: 4px solid #f3f3f3;
      border-top: 4px solid #28a745;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      animation: spin 1s linear infinite;
      margin: 0 auto 15px;
    }
    
    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    
    .modal-loader {
      text-align: center;
      padding: 20px;
    }
    
    /* Prevent multiple form submissions */
    .form-submitting {
      opacity: 0.6;
      pointer-events: none;
    }
    
    /* Browser loading overlay */
    .browser-loading-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.9);
      z-index: 9999;
      display: none;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
    
    .browser-loading-overlay.active {
      display: flex;
    }
    
    .browser-loading-spinner {
      border: 5px solid #f3f3f3;
      border-top: 5px solid #28a745;
      border-radius: 50%;
      width: 60px;
      height: 60px;
      animation: spin 1s linear infinite;
      margin-bottom: 20px;
    }
    
    .browser-loading-text {
      font-size: 18px;
      color: #333;
      font-weight: bold;
    }
    
    .browser-loading-subtext {
      font-size: 14px;
      color: #666;
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <!-- Browser Loading Overlay -->
  <div class="browser-loading-overlay" id="browserLoading">
    <div class="browser-loading-spinner"></div>
    <div class="browser-loading-text">Redirecting...</div>
    <div class="browser-loading-subtext">Please wait while we load the vehicle list</div>
  </div>

  <div class="container-header">
    <!-- Header -->
    <section class="content-header">
      <h3><i class="fa fa-car"></i> Vehicle <small class="text-muted">Control Panel</small></h3>
      <ol class="breadcrumb bg-white px-3 py-2 ">
        <li class="breadcrumb-item"><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="breadcrumb-item active">Add Vehicle Photos</li>
      </ol>
    </section>

    <!-- Vehicle Form -->
    <section class="content">
      <div class="row ">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="box box-info">
            <div class="box-header with-border ">
              <h4 class="box-title">Add Vehicle & Upload Images</h4>
            </div>

            <form method="POST" action="controller.php" enctype="multipart/form-data" id="vehicleForm">
              <input type="hidden" name="action" value="upload_vehicle_images">
              <div class="box-body">
                <!-- Example fields -->
                <div class="form-row">

                  <div class="form-group col-md-6">
                    <label>Vehicle No.<span style="color:red">*</span></label>
                    <?php if (!empty($_GET['vehicle_no'])): ?>
                      <?php
                      // Find the vehicle from the $vehicles array using ID
                      $vehicle_id_from_get = (int) $_GET['vehicle_no'];
                      $vehicle_selected = null;
                      foreach ($vehicles as $v) {
                        if ($v['id'] == $vehicle_id_from_get) {
                          $vehicle_selected = $v;
                          break;
                        }
                      }
                      ?>
                      <?php if ($vehicle_selected): ?>
                        <!-- Show fixed readonly field -->
                        <input class="bold-select" type="hidden" name="vehicle_id" value="<?= $vehicle_selected['id'] ?>">
                        <input type="text" class="form-control bold-select" value="<?= htmlspecialchars($vehicle_selected['vehicle_no']) ?>" readonly>
                      <?php else: ?>
                        <!-- Vehicle not found, show dropdown -->
                        <select class="form-control bold-select" name="vehicle_id" id="vehicleSelect" required>
                          <option value="">Select Vehicle</option>
                          <?php foreach ($vehicles as $v): ?>
                            <option value="<?= $v['id'] ?>" data-branch="<?= htmlspecialchars($v['short_name']) ?>">
                              <?= htmlspecialchars($v['vehicle_no']) ?>
                            </option>
                          <?php endforeach; ?>
                        </select>
                      <?php endif; ?>
                    <?php else: ?>

                      <!-- No vehicle ID from previous page, show dropdown -->
                      <select class="form-control bold-select" name="vehicle_id" id="vehicleSelect" required>
                        <option value="">Select Vehicle</option>
                        <?php foreach ($vehicles as $v): ?>
                          <option value="<?= $v['id'] ?>" data-branch="<?= htmlspecialchars($v['short_name']) ?>" class="bold-select">
                            <?= htmlspecialchars($v['vehicle_no']) ?>
                          </option>
                        <?php endforeach; ?>
                      </select>
                    <?php endif; ?>
                  </div>

                  <div class="form-group col-md-6">
                    <label>Branch</label>
                    <input type="text" id="branchField" class="form-control bold-select" value="<?= isset($vehicle_selected) && $vehicle_selected ? 'Branch: ' . $vehicle_selected['short_name'] : '' ?>" readonly>
                  </div>

                  <hr>
                  <!-- Upload Images -->
                  <h5><b><i class="fa fa-images"></i> Upload Vehicle Images</b></h5>
                  <p class="text-muted">Upload one or more vehicle-related images with labels and descriptions.</p>

                  <div id="imageUploadContainer">
                    <!-- One Row by Default -->
                    <div class="image-row row">
                      <div class="col-md-3">
                        
                        <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*" capture="camera" required>
                      </div>
                      <div class="col-md-2">
                        <button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button>
                      </div>
                      <div class="col-md-12">
                        <span class="upload-status"></span>
                      </div>
                    </div>
                  </div>

                  <!-- Add More Button -->
                  <button type="button" id="addImageRow" class="btn btn-success mt-2">
                    <i class="fa fa-plus"></i> Add More
                  </button>
                </div>

                <!-- Form Footer -->
                <div class="box-footer text-right mt-3">
                  <button type="submit" name="inspection" class="btn btn-success" id="saveBtn"><i class="fa  fa-plus"></i> Save & Do Inspection</button>
                  <!-- <button type="submit" class="btn btn-info" value="submit"><i class="fa fa-save"></i> Save Photo</button> -->
                  <button type="reset" class="btn btn-secondary"><i class="fa fa-refresh"></i> Reset</button>
                  <a href="<?php echo WEB_ROOT; ?>index.php" class="btn btn-danger" id="cancelBtn"><i class="fa fa-times"></i> Cancel</a>
                </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- Loading/Status Modal -->
  <div class="modal fade" id="statusModal" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content text-center">
        <div class="modal-body">
          <!-- Loading State -->
          <div id="loadingState" class="modal-loader">
            <div class="loading-spinner"></div>
            <h4>Processing your request...</h4>
            <p class="text-muted">Please wait while we upload the images.</p>
          </div>
          
          <!-- Success/Error State (initially hidden) -->
          <div id="resultState" style="display: none;">
            <i id="statusIcon" class="fa" style="font-size: 70px; margin-bottom: 15px;"></i>
            <h4 id="statusText" class="mb-3"></h4>
          </div>
        </div>
        <div class="modal-footer" id="modalFooter" style="display: none;">
          <button type="button" id="modalOkBtn" class="btn btn-success w-100">
            OK
          </button>
        </div>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    let vehicleSelect = document.getElementById('vehicleSelect');
    if (vehicleSelect) {
      vehicleSelect.addEventListener('change', function() {
        let branch = this.options[this.selectedIndex].getAttribute('data-branch');
        // document.getElementById('branchField').value = branch ? branch : '';
        document.getElementById('branchField').value = branch ? 'Branch: ' + branch : '';

      });
    }

    $(function() {
      const maxImages = 10; // Change this limit
      const addBtn = $("#addImageRow");
      let formSubmitted = false;

      // Check if we should enable/disable Add button
      function toggleAddButton() {
        let totalRows = $("#imageUploadContainer .image-row").length;
        if (totalRows >= maxImages) {
          addBtn.prop("disabled", true).text("Limit Reached (" + maxImages + ")");
        } else {
          addBtn.prop("disabled", false).html('<i class="fa fa-plus"></i> Add More');
        }
      }

      // Initial check
      toggleAddButton();

      // Add More Row
      addBtn.on("click", function() {
        let totalRows = $("#imageUploadContainer .image-row").length;

        if (totalRows >= maxImages) {
          return; // Button should already be disabled
        }

        const newRow = `<div class="image-row row">
          <div class="col-md-3">
              <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*" capture="camera">
          </div>
          <div class="col-md-2">
              <button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button>
          </div>
        </div>`;

        $("#imageUploadContainer").append(newRow);

        toggleAddButton();
      });

      // Remove Row
      $(document).on("click", ".removeImageRow", function() {
        $(this).closest(".image-row").remove();
        toggleAddButton(); // Re-check after removing
      });

      // Handle form submission with modal loading
      $("#vehicleForm").on("submit", function(e) {
        e.preventDefault();
        
        // Validate at least one file is selected
        let hasFile = false;
        $(".image-file").each(function() {
          if (this.files.length > 0) {
            hasFile = true;
            return false;
          }
        });
        
        if (!hasFile) {
          alert("Please select at least one image to upload.");
          return;
        }
        
        // Validate vehicle is selected
        if ($("#vehicleSelect").length && !$("#vehicleSelect").val()) {
          alert("Please select a vehicle.");
          return;
        }
        
        // Prevent double submission
        if (formSubmitted) return;
        
        const form = this;
        const formData = new FormData(form);
        
        // Show loading modal
        $("#loadingState").show();
        $("#resultState").hide();
        $("#modalFooter").hide();
        $("#statusModal").modal("show");
        
        // Mark as submitted
        formSubmitted = true;
        $("#saveBtn").prop("disabled", true);
        $("body").addClass("form-submitting");
        
        // Submit form via AJAX
        $.ajax({
          url: "controller.php",
          type: "POST",
          data: formData,
          processData: false,
          contentType: false,
          timeout: 30000, // 30 second timeout
          success: function(response) {
            // Handle success response
            $("#loadingState").hide();
            $("#resultState").show();
            $("#modalFooter").show();
            
            // Try to parse response if it's JSON
            try {
              const result = typeof response === 'string' ? JSON.parse(response) : response;
              if (result.status === "success") {
                $("#statusIcon")
                  .removeClass("fa-times-circle text-danger")
                  .addClass("fa-check-circle text-success");
                $("#statusText").text("Vehicle Images Added Successfully!");
              } else {
                $("#statusIcon")
                  .removeClass("fa-check-circle text-success")
                  .addClass("fa-times-circle text-danger");
                $("#statusText").text(result.message || "Failed to add vehicle images!");
              }
            } catch(e) {
              // If not JSON, check if response contains success/error keywords
              if (response.includes("success") || response.includes("Success")) {
                $("#statusIcon")
                  .removeClass("fa-times-circle text-danger")
                  .addClass("fa-check-circle text-success");
                $("#statusText").text("Vehicle Images Added Successfully!");
              } else {
                $("#statusIcon")
                  .removeClass("fa-check-circle text-success")
                  .addClass("fa-times-circle text-danger");
                $("#statusText").text("Failed to add vehicle images!");
              }
            }
          },
          error: function(xhr, status, error) {
            // Handle error
            $("#loadingState").hide();
            $("#resultState").show();
            $("#modalFooter").show();
            
            $("#statusIcon")
              .removeClass("fa-check-circle text-success")
              .addClass("fa-times-circle text-danger");
            
            if (status === "timeout") {
              $("#statusText").text("Request timed out. Please try again.");
            } else {
              $("#statusText").text("An error occurred: " + error);
            }
          },
          complete: function() {
            // Reset form submission flag but keep modal open
            formSubmitted = false;
            $("#saveBtn").prop("disabled", false);
            $("body").removeClass("form-submitting");
          }
        });
      });

      // Handle cancel button with browser loading
      $("#cancelBtn").on("click", function(e) {
        e.preventDefault();
        const href = $(this).attr("href");
        
        // Show browser loading overlay
        $("#browserLoading").addClass("active");
        
        // Redirect after a small delay to show loading
        setTimeout(function() {
          window.location.href = href;
        }, 300);
      });

      // Redirect on OK button click with browser loading
      $(document).on("click", "#modalOkBtn", function() {
        // Hide modal first
        $("#statusModal").modal("hide");
        
        // Show browser loading overlay
        $("#browserLoading").addClass("active");
        
        // Redirect after a small delay to show loading
        setTimeout(function() {
          window.location.href = "index.php?view=view_van_list";
        }, 500);
      });

      // Handle modal close event
      $("#statusModal").on("hidden.bs.modal", function() {
        // Reset modal states for next use
        $("#loadingState").show();
        $("#resultState").hide();
        $("#modalFooter").hide();
      });
      
      // Hide browser loading when page is fully loaded
      $(window).on("load", function() {
        $("#browserLoading").removeClass("active");
      });
      
      // Also hide on pageshow for bfcache handling
      $(window).on("pageshow", function() {
        $("#browserLoading").removeClass("active");
      });

      // Fake Upload Preview (keeping existing functionality)
      $(document).on("click", ".uploadImageBtn", function() {
        let row = $(this).closest(".image-row");
        let fileInput = row.find(".image-file")[0];
        let label = row.find(".image-label").val();
        let statusBox = row.find(".upload-status");

        if (fileInput.files.length === 0) {
          alert("Please select an image file");
          return;
        }
        if (!label) {
          alert("Please select a label");
          return;
        }

        statusBox.html("<span class='text-primary'><i class='fa fa-spinner fa-spin'></i> Uploading...</span>");
        setTimeout(() => {
          statusBox.html("<span class='text-success'>✔ Uploaded Successfully</span>");
        }, 1500);
      });
    });
  </script>
  
  <?php if (isset($_GET['status'])): ?>
    <script>
      $(document).ready(function() {
        // Hide loading and show result if we have status in URL
        $("#loadingState").hide();
        $("#resultState").show();
        $("#modalFooter").show();
        
        const status = "<?= $_GET['status'] ?>";
        
        if (status === "success") {
          $("#statusIcon")
            .removeClass("fa-times-circle text-danger")
            .addClass("fa-check-circle text-success");
          $("#statusText").text("Vehicle Images Added Successfully!");
        } else if (status === "error") {
          $("#statusIcon")
            .removeClass("fa-check-circle text-success")
            .addClass("fa-times-circle text-danger");
          $("#statusText").text("Failed to add vehicle images!");
        }
        
        $("#statusModal").modal("show");
        
        $("#modalOkBtn").on("click", function() {
          $("#statusModal").modal("hide");
          $("#browserLoading").addClass("active");
          setTimeout(function() {
            window.location = "index.php?view=view_van_list";
          }, 500);
        });
      });
    </script>
  <?php endif; ?>
</body>

</html>