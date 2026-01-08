<?php
include('../../includes/db.php');
include('./controller.php'); // Make sure getAssignedBranchId() is available

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
    $vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
    $vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// --- Check if a vehicle is pre-selected (from URL) ---
$vehicle_selected = null;
if (!empty($_GET['vehicle_no'])) {
    $vehicle_id_from_get = (int) $_GET['vehicle_no'];
    foreach ($vehicles as $v) {
        if ($v['id'] == $vehicle_id_from_get) {
            $vehicle_selected = $v;
            break;
        }
    }
}
?>
<style>
    .bold-select {
        font-weight: bold;
    }
</style>

<!-- Content Header -->
<section class="content-header">
    <h1>Vehicle <small>Control Panel</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Add Vehicle</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Inspection Form</h3>
                </div>
                <div class="box-body">
                    <form method="POST" action="controller.php" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="saveInspection">

                        <div class="row">
                            <!-- Vehicle No -->
                            <div class="form-group col-md-6">
                                <label>Vehicle No.<span style="color:red">*</span></label>
                                <?php if ($vehicle_selected): ?>
                                    <input type="hidden" name="vehicle_id" value="<?= $vehicle_selected['id'] ?>">
                                    <input type="text" class="form-control bold-select"
                                        value="<?= htmlspecialchars($vehicle_selected['vehicle_no']) ?>" readonly>
                                <?php else: ?>
                                    <select class="form-control bold-select" name="vehicle_id" id="vehicleSelect" required>
                                        <option class="bold-select" value="">Select Vehicle</option>
                                        <?php foreach ($vehicles as $v): ?>
                                            <option value="<?= $v['id'] ?>" data-branch="<?= htmlspecialchars($v['short_name']) ?>" class="bold-select">
                                                <?= htmlspecialchars($v['vehicle_no']) ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                <?php endif; ?>
                            </div>

                            <!-- Branch -->
                            <div class="form-group col-md-6">
                                <label>Branch</label>
                                <input type="text" id="branchField" class="form-control bold-select"
                                    value="<?= $vehicle_selected ? 'Branch: ' . $vehicle_selected['short_name'] : '' ?>" readonly>
                            </div>
                        </div>

                        <hr>

                        <!-- Tyres -->
                        <div class="form-group">
                            <label><strong>Tyres:</strong></label><br>
                            <label><input type="radio" name="tyres" value="Good" >Good</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Close">Close</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Illegal">Illegal</label>
                        </div>

                        <!-- Driver's Cabin -->
                        <div class="form-group">
                            <label><strong>Driver's Cabin:</strong></label><br>
                            <label><input type="radio" name="drivers_cabin" value="Very Clean" > Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Clean"> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Soiled/Dirty"> Soiled/Dirty</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Driver's Cabin):</label>
                                <input type="file" class="form-control" name="photo_drivers_cabin" accept="image/*" capture="camera" id="photo_drivers_cabin">
                                <div class="preview mt-2" id="preview_drivers_cabin"></div>
                            </div>
                        </div>

                        <!-- Loading Area -->
                        <div class="form-group">
                            <label><strong>Loading Area:</strong></label><br>
                            <label><input type="radio" name="loading_area" value="Very Clean"> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Clean"> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Dirty"> Dirty</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Loading Area):</label>
                                <input type="file" class="form-control" name="photo_loading_area" accept="image/*" capture="camera" id="photo_loading_area">
                                <div class="preview mt-2" id="preview_loading_area"></div>
                            </div>
                        </div>

                        <!-- Exterior -->
                        <div class="form-group">
                            <label><strong>Exterior:</strong></label><br>
                            <label><input type="radio" name="exterior" value="Ready to sell" required> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Polish"> Polish</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Body shop"> Body shop</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Missing body parts"> Missing body parts</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Exterior):</label>
                                <input type="file" class="form-control" name="photo_exterior" accept="image/*" capture="camera" id="photo_exterior">
                                <div class="preview mt-2" id="preview_exterior"></div>
                            </div>
                        </div>
                        <!-- Engine compartmen -->
                        <div class="form-group">
                            <label><strong>Engine Compartment:</strong></label><br>
                            <label><input type="radio" name="engine_compartment" value="Very Clean" required> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="engine_compartment" value="Clean"> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="engine_compartment" value="Dirty"> Dirty</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Engine Compartment):</label>
                                <input type="file" class="form-control" name="photo_engine_compartment" accept="image/*" capture="camera" id="photo_engine_compartment">
                                <div class="preview mt-2" id="preview_exterior"></div>
                            </div>
                        </div>

                        <!-- Mechanical -->
                        <div class="form-group">
                            <label><strong>Mechanical:</strong></label><br>
                            <label><input type="radio" name="mechanical" value="Ready to sell" required> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Warning lights"> Warning lights</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Workshop"> Workshop</label>
                        </div>

                        <!-- Comments -->
                        <div class="form-group">
                            <label><strong>Comments:</strong></label>
                            <textarea name="comments" class="form-control" rows="3" placeholder="Enter inspection comments..."></textarea>
                        </div>

                        <!-- Test Driven Status -->
                        <div class="form-group">
                            <label><strong>Is Test Driven?</strong></label><br>
                            <label><input type="radio" name="test_driven" value="Yes" required> Yes</label>&nbsp;&nbsp;
                            <label><input type="radio" name="test_driven" value="No"> No</label>
                        </div>

                        <!-- Test Drive Comments -->
                        <div class="form-group">
                            <label><strong>Test Drive Comments:</strong></label>
                            <textarea name="test_drive_comments" class="form-control" rows="2" placeholder="Capture any feedback or comments..."></textarea>
                        </div>

                        <!-- Submit -->
                        <div class="form-group text-end">
                            <button type="submit" class="btn btn-success">Save Inspection</button>
                            <a href="<?php echo WEB_ROOT; ?>index.php" class="btn btn-danger"><i class="fa fa-times"></i> Cancel</a>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</section>

<!-- Scripts -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script>
    // let vehicleSelect = document.getElementById('vehicleSelect');
    // if (vehicleSelect) {
    //     vehicleSelect.addEventListener('change', function() {
    //         let branch = this.options[this.selectedIndex].getAttribute('data-branch');
    //         document.getElementById('branchField').value = branch ? 'Branch: ' + branch : '';
    //     });
    // }
    let vehicleSelect = document.getElementById('vehicleSelect');
    let assignedStaff = document.getElementById('assignedStaff'); // hidden input or select
    let assignedStaffName = document.getElementById('assignedStaffName'); // for non-admin

    if (vehicleSelect) {
        vehicleSelect.addEventListener('change', function() {
            let branch = this.options[this.selectedIndex].getAttribute('data-branch');
            let staffId = this.options[this.selectedIndex].getAttribute('data-staff');

            document.getElementById('branchField').value = branch ? 'Branch: ' + branch : '';

            if (assignedStaff) assignedStaff.value = staffId || '';

            if (assignedStaffName) {
                // For non-admins, fetch staff name from options if needed
                let staffOption = document.querySelector(`#assignedStaff option[value='${staffId}']`);
                assignedStaffName.value = staffOption ? staffOption.text : '';
            } else if (assignedStaff) {
                // For admin, select the option
                let staffOption = document.querySelector(`#assignedStaff option[value='${staffId}']`);
                if (staffOption) staffOption.selected = true;
            }
        });

        // Trigger change on page load if vehicle is pre-selected
        if (vehicleSelect.value) vehicleSelect.dispatchEvent(new Event('change'));
    }

    function previewImage(inputId, previewId) {
        const input = document.getElementById(inputId);
        const preview = document.getElementById(previewId);

        if (!input || !preview) return;

        input.addEventListener('change', function() {
            preview.innerHTML = '';
            const file = this.files[0];
            if (file) {
                const img = document.createElement('img');
                img.src = URL.createObjectURL(file);
                img.classList.add('img-thumbnail');
                img.style.maxWidth = '200px';
                img.style.marginTop = '5px';
                preview.appendChild(img);
            }
        });
    }

    previewImage('photo_drivers_cabin', 'preview_drivers_cabin');
    previewImage('photo_loading_area', 'preview_loading_area');
    previewImage('photo_exterior', 'preview_exterior');
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<?php if (isset($_GET['status'])): ?>
    <script>
        $(document).ready(function() {

            const status = "<?= $_GET['status'] ?>";

            if (status === "success") {
                $("#statusIcon")
                    .removeClass("fa-times-circle text-danger")
                    .addClass("fa-check-circle text-success");

                $("#statusText").text("Inspection Added Successfully!");

            } else if (status === "error") {
                $("#statusIcon")
                    .removeClass("fa-check-circle text-success")
                    .addClass("fa-times-circle text-danger");

                $("#statusText").text("Failed to Added!");
            }

            $("#successModal").modal("show");

            // Redirect on OK
            $("#modalOkBtn").on("click", function() {
                window.location = "index.php?view=view_van_list";
            });
        });
    </script>
<?php endif; ?>
<div class="modal fade" id="successModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content text-center">
            <div class="modal-body">
                <!-- ICON -->
                <i id="statusIcon" class="fa" style="font-size: 70px; margin-bottom: 15px;"></i>
                <!-- MESSAGE -->
                <h4 id="statusText" class="mb-3"></h4>
            </div>
            <div class="modal-footer">
                <!-- GREEN BUTTON -->
                <button type="button" id="modalOkBtn" class="btn btn-success w-100">
                    OK
                </button>
            </div>
        </div>
    </div>
</div>