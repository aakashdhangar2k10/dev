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
  </style>
</head>

<body>

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

            <form method="POST" action="controller.php" enctype="multipart/form-data">
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
                        <input type="hidden" name="vehicle_id" value="<?= $vehicle_selected['id'] ?>">
                        <input type="text" class="form-control" value="<?= htmlspecialchars($vehicle_selected['vehicle_no']) ?>" readonly>
                      <?php else: ?>
                        <!-- Vehicle not found, show dropdown -->
                        <select class="form-control" name="vehicle_id" id="vehicleSelect" required>
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
                      <select class="form-control" name="vehicle_id" id="vehicleSelect" required>
                        <option value="">Select Vehicle</option>
                        <?php foreach ($vehicles as $v): ?>
                          <option value="<?= $v['id'] ?>" data-branch="<?= htmlspecialchars($v['short_name']) ?>">
                              <?= htmlspecialchars($v['vehicle_no']) ?>
                            </option>
                        <?php endforeach; ?>
                      </select>
                    <?php endif; ?>
                  </div>

                  <div class="form-group col-md-6">
                    <label>Branch</label>
                    <input type="text" id="branchField" class="form-control" value="<?= isset($vehicle_selected) && $vehicle_selected ? 'Branch: ' . $vehicle_selected['branch_id'] : '' ?>" readonly>

                  </div>

                  <hr>
                  <!-- Upload Images -->
                  <h5><b><i class="fa fa-images"></i> Upload Vehicle Images</b></h5>
                  <p class="text-muted">Upload one or more vehicle-related images with labels and descriptions.</p>

                  <div id="imageUploadContainer">
                    <!-- One Row by Default -->
                    <div class="image-row row">
                      <div class="col-md-3">
                        <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*" required>
                      </div>
                      <div class="col-md-2">
                        <select name="image_label[]" class="form-control image-label" required>
                          <option value="">-- Select Label --</option>
                          <option value="front">Front View</option>
                          <option value="back">Back View</option>
                          <option value="left">Left Side</option>
                          <option value="right">Right Side</option>
                          <option value="interior">Interior</option>
                          <option value="Loading area">Loading area</option>
                          <option value="rc">RC Book</option>
                          <option value="insurance">Insurance</option>
                          <option value="other">Other</option>
                        </select>
                      </div>
                      <div class="col-md-3">
                        <input type="text" name="image_description[]" class="form-control image-desc" placeholder="Enter custom description">
                      </div>
                      <div class="col-md-2">
                        <button type="button" class="btn btn-primary uploadImageBtn"><i class="fa fa-upload"></i> Upload</button>
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
                  <button type="submit" name="inspection" class="btn btn-success"><i class="fa  fa-plus"></i> Save & Do Inspection</button>
                  <button type="submit" class="btn btn-info" value="submit"><i class="fa fa-save"></i> Save Photo</button>
                  <button type="reset" class="btn btn-secondary"><i class="fa fa-refresh"></i> Reset</button>
                  <a href="#" class="btn btn-danger"><i class="fa fa-times"></i> Cancel</a>
                </div>
            </form>
          </div>
        </div>
      </div>
    </section>
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

        let newRow = `
      <div class="image-row row">
        <div class="col-md-3">
          <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*" required>
        </div>
        <div class="col-md-2">
          <select name="image_label[]" class="form-control image-label" required>
            <option value="">-- Select Label --</option>
            <option value="front">Front View</option>
            <option value="back">Back View</option>
            <option value="left">Left Side</option>
            <option value="right">Right Side</option>
            <option value="interior">Interior</option>
            <option value="Loading area">Loading area</option>
            <option value="rc">RC Book</option>
            <option value="insurance">Insurance</option>
            <option value="other">Other</option>
          </select>
        </div>
        <div class="col-md-3">
          <input type="text" name="image_description[]" class="form-control image-desc" placeholder="Enter custom description">
        </div>
        <div class="col-md-2">
          <button type="button" class="btn btn-primary uploadImageBtn"><i class="fa fa-upload"></i> Upload</button>
        </div>
        <div class="col-md-2">
          <button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button>
        </div>
        <div class="col-md-12">
          <span class="upload-status"></span>
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

      // Fake Upload Preview
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

</body>

</html>