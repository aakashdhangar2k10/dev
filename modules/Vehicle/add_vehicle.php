<?php
$vehicleNo = isset($_GET['vehicle_no']) ? trim($_GET['vehicle_no']) : '';

// session_start();
include('../../includes/db.php');

// Assuming user's branch is stored in session or can be fetched from the database
$user_id = $_SESSION['acct_id'] ?? 0;
$user_type = $_SESSION['type'] ?? '';

$assigned_branch_id = 0;
$assigned_branch_name = '';

if ($user_type == 'Non-Administrator') {
  $stmt = $conn->prepare("SELECT branch_id FROM accounts WHERE acct_id = ?");
  $stmt->execute([$user_id]);
  $result = $stmt->fetch(PDO::FETCH_ASSOC);
  if ($result) {
    $assigned_branch_id = $result['branch_id'];

    // Get branch name
    $stmt2 = $conn->prepare("SELECT full_name FROM branches_tbl WHERE id = ?");
    $stmt2->execute([$assigned_branch_id]);
    $branch = $stmt2->fetch(PDO::FETCH_ASSOC);
    if ($branch) {
      $assigned_branch_name = $branch['full_name'];
    }
  }
}
?>

<!-- Content Header -->
<section class="content-header">
  <h1>Vehicle <small>Control Panel</small></h1>
  <ol class="breadcrumb">
    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
    <li class="active">Add Vehicle</li>
  </ol>
</section>

<!-- Vehicle Form -->
<section class="content">
  <div class="row">
    <div class="col-md-1"></div>

    <div class="col-md-10">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">Add Vehicle</h3>
        </div>

        <form method="POST" action="controller.php">
          <input type="hidden" name="action" value="save_vehicle">
          <div class="box-body">
            <div class="row">

              <!-- Vehicle No -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Vehicle No. <span style="color:red">*</span></label>
                  <div class="input-group">
                    <input type="text" id="vehicle_no" name="vehicle_no" class="form-control text-uppercase" placeholder="Enter Vehicle No" value="<?php echo htmlspecialchars($vehicleNo); ?>" required />

                    <span class="input-group-btn">
                      <button type="button" id="getDetailsBtn" class="btn btn-primary">
                        <i class="fa fa-download"></i> Get Details
                      </button>
                    </span>
                  </div>
                </div>
              </div>

              <!-- Branch -->
              <?php if ($_SESSION['type'] == 'Administrator') { ?>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Branch <span style="color:red">*</span></label>
                    <select class="form-control" name="branch_no" required>
                      <option value="">Select Branch</option>
                      <?php
                      $stmt = $conn->prepare("SELECT id, full_name FROM branches_tbl ORDER BY id ASC");
                      $stmt->execute();
                      $branches = $stmt->fetchAll(PDO::FETCH_ASSOC);
                      foreach ($branches as $branch) {
                        echo '<option value="' . $branch['id'] . '">' . htmlspecialchars($branch['full_name']) . '</option>';
                      }
                      ?>
                    </select>
                  </div>
                </div>
              <?php } else { ?>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Branch <span style="color:red">*</span></label>
                    <input type="text" class="form-control" value="<?php echo htmlspecialchars($assigned_branch_name); ?>" readonly>
                    <input type="hidden" name="branch_no" value="<?php echo htmlspecialchars($assigned_branch_id); ?>">
                  </div>
                </div>
              <?php } ?>


              <!-- Registration No -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Registration No. <span style="color:red">*</span></label>
                  <input type="text" id="registrationNumber" name="registrationNumber" class="form-control" readonly />
                </div>
              </div>

              <!-- Make -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Make</label>
                  <input type="text" id="make" name="make" class="form-control" readonly />
                </div>
              </div>

              <!-- Model -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Model</label>
                  <input type="text" id="model" name="model" class="form-control" readonly />
                </div>
              </div>

              <!-- Vehicle Color -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Vehicle Color</label>
                  <input type="text" id="colour" name="colour" class="form-control" readonly />
                </div>
              </div>

              <!-- Fuel Type -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Fuel Type</label>
                  <input type="text" id="fuelType" name="fuelType" class="form-control" readonly />
                </div>
              </div>

              <!-- Engine Capacity -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Engine Capacity (CC)</label>
                  <input type="text" id="engineCapacity" name="engineCapacity" class="form-control" readonly />
                </div>
              </div>

              <!-- Year of Manufacture -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Year of Manufacture</label>
                  <input type="text" id="yearOfManufacture" name="yearOfManufacture" class="form-control" readonly />
                </div>
              </div>

              <!-- Vehicle Age -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Vehicle Age</label>
                  <input type="text" id="vehicleAge" name="vehicleAge" class="form-control" readonly />
                </div>
              </div>

              <!-- Wheel Plan -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Wheel Plan</label>
                  <input type="text" id="wheelplan" name="wheelplan" class="form-control" readonly />
                </div>
              </div>

              <!-- Date of Last V5C Issued -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Last V5C Issued</label>
                  <input type="text" id="dateOfLastV5CIssued" name="dateOfLastV5CIssued" class="form-control" readonly />
                </div>
              </div>

              <!-- Type Approval -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Type Approval</label>
                  <input type="text" id="typeApproval" name="typeApproval" class="form-control" readonly />
                </div>
              </div>

              <!-- CO2 Emissions -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>CO₂ Emissions</label>
                  <input type="text" id="co2Emissions" name="co2Emissions" class="form-control" readonly />
                </div>
              </div>

              <!-- Registration Place -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Registration Place</label>
                  <input type="text" id="registrationPlace" name="registrationPlace" class="form-control" readonly />
                </div>
              </div>

              <!-- Tax Status -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Tax Status</label>
                  <input type="text" id="taxStatus" name="taxStatus" class="form-control" readonly />
                </div>
              </div>

              <!-- Tax Due Date -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Tax Due Date</label>
                  <input type="text" id="taxDueDate" name="taxDueDate" class="form-control" readonly />
                </div>
              </div>

              <!-- MOT Status -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>MOT Status</label>
                  <input type="text" id="motStatus" name="motStatus" class="form-control" readonly />
                </div>
              </div>

              <!-- MOT Due Date -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>MOT Due Date</label>
                  <input type="text" id="motDueDate" name="motDueDate" class="form-control" readonly />
                </div>
              </div>

              <!-- MOT Due Days -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>MOT Due Days</label>
                  <input type="text" id="days" name="days" class="form-control" readonly />
                </div>
              </div>

              <!-- Assign Staff -->
              <?php if ($_SESSION['type'] == 'Administrator') { ?>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Assign Staff <span style="color:red">*</span></label>
                    <select class="form-control input-sm" name="assigned_staff" required>
                      <option value="">Select Mechanics</option>
                      <?php
                      $stmt = $conn->prepare("SELECT acct_id, username FROM accounts WHERE type = 'Non-Administrator' ORDER BY username ASC");
                      $stmt->execute();
                      $staffList = $stmt->fetchAll(PDO::FETCH_ASSOC);
                      foreach ($staffList as $staff) {
                        echo '<option value="' . htmlspecialchars($staff['acct_id']) . '">' . htmlspecialchars($staff['username']) . '</option>';
                      }
                      ?>
                    </select>
                  </div>
                </div>
              <?php } else {
                // For non-admins, use session's acct_id and username
                $assigned_staff_id = $_SESSION['acct_id'];
                $assigned_staff_name = $_SESSION['username']; // assuming you store this
              ?>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Assign Staff <span style="color:red">*</span></label>
                    <input type="text" class="form-control" value="<?php echo htmlspecialchars($assigned_staff_name); ?>" readonly>
                    <input type="hidden" name="assigned_staff" value="<?php echo htmlspecialchars($assigned_staff_id); ?>">
                  </div>
                </div>
              <?php } ?>

            </div>
          </div><!-- /.box-body -->

          <div class="box-footer">
            <div class="pull-right">
              <button type="submit" name="add_photo" class="btn btn-success"><i class="fa  fa-plus"></i> Save & Add Photo</button>
              <button type="submit" name="save_only" class="btn btn-info"> <i class="fa fa-save"></i> Save Vehicle</button>
              <button type="reset" class="btn btn-refresh"><i class="fa fa-refresh"></i> Reset</button>
              <a href="<?php echo WEB_ROOT; ?>index.php" class="btn btn-danger"><i class="fa fa-times"></i> Cancel</a>
            </div>
          </div>
          <!-- /.box-footer -->
        </form>

      </div>
    </div>

    <div class="col-md-1"></div>
  </div>
</section>
<script>
  // For Get Details 
  window.addEventListener('DOMContentLoaded', function() {
    const vehicleNo = "<?php echo htmlspecialchars($vehicleNo); ?>";
    if (vehicleNo) {
      document.getElementById('getDetailsBtn').click();
    }
  });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $("#getDetailsBtn").on("click", function() {
    let vrm = $("#vehicle_no").val().trim();

    if (vrm === "") {
      alert("Please enter Vehicle No.");
      return;
    }

    $.ajax({
      url: "controller.php",
      type: "POST",
      data: {
        action: "getVehicleDetails",
        vrm: vrm
      },
      dataType: "json",
      // success: function(response) {
      //   if (response.status === "success" && response.data) {
      //     let data = response.data;

      //     // Map fields from updated API
      //     $("#registrationNumber").val(data.registrationNumber || "");
      //     $("#make").val(data.make || "");
      //     $("#model").val(data.model || "");
      //     $("#colour").val(data.colour || "");
      //     $("#fuelType").val(data.fuelType || "");
      //     $("#engineCapacity").val(data.engineCapacity || "");
      //     $("#yearOfManufacture").val(data.yearOfManufacture || "");
      //     $("#vehicleAge").val(new Date().getFullYear() - (data.yearOfManufacture || 0));
      //     $("#wheelplan").val(data.wheelplan || "");
      //     $("#dateOfLastV5CIssued").val(data.dateOfLastV5CIssued || "");
      //     $("#typeApproval").val(data.typeApproval || "");
      //     $("#co2Emissions").val(data.co2Emissions || "");
      //     $("#registrationPlace").val(data.registrationPlace || "");

      //     // Tax & MOT
      //     $("#taxStatus").val(data.taxStatus || "");
      //     $("#taxDueDate").val(data.taxDueDate || "");
      //     $("#motStatus").val(data.motStatus || "");
      //     $("#motDueDate").val(data.motExpiryDate || "");

      //     // Calculate MOT days remaining
      //     if (data.motExpiryDate) {
      //       let today = new Date();
      //       let motDate = new Date(data.motExpiryDate);
      //       let diffDays = Math.ceil((motDate - today) / (1000 * 60 * 60 * 24));
      //       $("#days").val(diffDays);
      //     }

      //   } else {
      //     alert("Error: " + response.message);
      //   }
      // },
      // success: function(response) {
      //   if (response.status === "success" && response.data) {
      //     let data = response.data;

      //     // Vehicle Basic Info
      //     $("#registrationNumber").val(data.registrationNumber || "");
      //     $("#make").val(data.make || "");
      //     $("#model").val(data.model || "");
      //     $("#colour").val(data.colour || "");
      //     $("#fuelType").val(data.fuelType || "");
      //     $("#engineCapacity").val(data.engineCapacity || "");
      //     $("#yearOfManufacture").val(data.yearOfManufacture || "");
      //     $("#vehicleAge").val(data.vehicleAge || "");
      //     $("#wheelplan").val(data.wheelplan || "");
      //     $("#dateOfLastV5CIssued").val(data.dateOfLastV5CIssued || "");
      //     $("#typeApproval").val(data.typeApproval || "");
      //     $("#co2Emissions").val(data.co2Emissions || "");
      //     $("#registrationPlace").val(data.registrationPlace || "");

      //     // Tax Info
      //     if (data.tax) {
      //       $("#taxStatus").val(data.tax.taxStatus || "");
      //       $("#taxDueDate").val(data.tax.taxDueDate || "");
      //     }

      //     // MOT Info
      //     if (data.mot) {
      //       $("#motStatus").val(data.mot.motStatus || "");
      //       $("#motDueDate").val(data.mot.motDueDate || "");
      //       $("#days").val(data.mot.days || "");
      //     }
      //   } else {
      //     alert("Error: " + response.message);
      //   }
      // }
      success: function(response) {
        if (response.status === "success" && response.data) {
          let data = response.data;

          // Helper to set values safely (keeps 0, clears null/undefined)
          function setVal(id, value) {
            $("#" + id).val(value !== undefined && value !== null ? value : "");
          }

          // Vehicle Basic Info
          setVal("registrationNumber", data.registrationNumber);
          setVal("make", data.make);
          setVal("model", data.model);
          setVal("colour", data.colour);
          setVal("fuelType", data.fuelType);
          setVal("engineCapacity", data.engineCapacity);
          setVal("yearOfManufacture", data.yearOfManufacture);
          setVal("vehicleAge", data.vehicleAge);
          setVal("wheelplan", data.wheelplan);
          setVal("dateOfLastV5CIssued", data.dateOfLastV5CIssued);
          setVal("typeApproval", data.typeApproval);
          setVal("co2Emissions", data.co2Emissions); // ✅ now shows 0 correctly
          setVal("registrationPlace", data.registrationPlace);

          // Tax Info
          if (data.tax) {
            setVal("taxStatus", data.tax.taxStatus);
            setVal("taxDueDate", data.tax.taxDueDate);
          }

          // MOT Info
          if (data.mot) {
            setVal("motStatus", data.mot.motStatus);
            setVal("motDueDate", data.mot.motDueDate);
            setVal("days", data.mot.days);
          }
        } else {
          alert("Error: " + response.message);
        }
      }

      // error: function() {
      //   alert("API request failed.");
      // }
    });
  });
</script>