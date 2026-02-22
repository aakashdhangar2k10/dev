<?php
include('../../includes/db.php');

$vehicle_id = $_GET['vehicle_no'] ?? 0;
$inspection = null;

// Fetch vehicles + branch
$stmt = $conn->query("
    SELECT v.id, v.vehicle_no, v.branch_id, b.short_name
    FROM vehicle_details_tbl v
    LEFT JOIN branches_tbl b ON v.branch_id = b.id
");
$vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch existing inspection record
if ($vehicle_id) {
    $stmt = $conn->prepare("
        SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :vehicle_id LIMIT 1
    ");
    $stmt->execute([':vehicle_id' => $vehicle_id]);
    $inspection = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>
<style>
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

<!-- Browser Loading Overlay -->
<div class="browser-loading-overlay" id="browserLoading">
    <div class="browser-loading-spinner"></div>
    <div class="browser-loading-text">Redirecting...</div>
    <div class="browser-loading-subtext">Please wait while we load the vehicle list</div>
</div>

<!-- Content Header -->
<section class="content-header">
    <h1>Vehicle <small>Control Panel</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Update Inspection</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Update Inspection Form</h3>
                </div>

                <div class="box-body">
                    <?php if (isset($_GET['status']) && $_GET['status'] === 'updated'): ?>
                        <div class="alert alert-success">Inspection updated successfully!</div>
                    <?php endif; ?>

                    <form method="POST" action="controller.php" enctype="multipart/form-data" id="inspectionForm">
                        <input type="hidden" name="action" value="updateInspection">
                        <input type="hidden" name="vehicle_id" value="<?= htmlspecialchars($vehicle_id) ?>">

                        <div class="row">
                            <!-- Vehicle No -->
                            <div class="form-group col-md-6">
                                <label>Vehicle No.</label>
                                <?php
                                $vehicle_selected = null;
                                foreach ($vehicles as $v) {
                                    if ($v['id'] == $vehicle_id) {
                                        $vehicle_selected = $v;
                                        break;
                                    }
                                }
                                ?>
                                <input type="text" class="form-control bold-select"
                                    value="<?= $vehicle_selected ? htmlspecialchars($vehicle_selected['vehicle_no']) : '' ?>"
                                    readonly>
                            </div>

                            <!-- Branch -->
                            <div class="form-group col-md-6">
                                <label>Branch</label>
                                <input type="text" id="branchField" class="form-control bold-select"
                                    value="<?= $vehicle_selected ? htmlspecialchars($vehicle_selected['short_name']) : '' ?>"
                                    readonly>
                            </div>
                        </div>

                        <hr>

                        <!-- Tyres -->
                        <div class="form-group">
                            <label><strong>Tyres:</strong></label><br>
                            <?php $tyres = $inspection['tyres'] ?? ''; ?>
                            <label><input type="radio" name="tyres" value="Good" <?= ($tyres == 'Good') ? 'checked' : '' ?>> Good</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Close" <?= ($tyres == 'Close') ? 'checked' : '' ?>> Close</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Illegal" <?= ($tyres == 'Illegal') ? 'checked' : '' ?>> Illegal</label>
                        </div>

                        <!-- Driver's Cabin -->
                        <div class="form-group">
                            <label><strong>Driver's Cabin:</strong></label><br>
                            <?php $drivers_cabin = $inspection['drivers_cabin'] ?? ''; ?>
                            <label><input type="radio" name="drivers_cabin" value="Very Clean" <?= ($drivers_cabin == 'Very Clean') ? 'checked' : '' ?>> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Clean" <?= ($drivers_cabin == 'Clean') ? 'checked' : '' ?>> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Soiled/Dirty" <?= ($drivers_cabin == 'Soiled/Dirty') ? 'checked' : '' ?>> Soiled/Dirty</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Driver's Cabin):</label>
                                <input type="file" class="form-control" name="photo_drivers_cabin" accept="image/*" capture="camera" id="photo_drivers_cabin">

                                <!-- Existing photo -->
                                <?php if (!empty($inspection['photo_drivers_cabin'])): ?>
                                    <div class="mt-2">
                                        <img src="../../uploads/inspection_photos/<?= htmlspecialchars($inspection['photo_drivers_cabin']) ?>" width="150" class="img-thumbnail">
                                        <p class="text-muted small">Current photo</p>
                                    </div>
                                <?php endif; ?>

                                <!-- New preview -->
                                <div id="preview_drivers_cabin" class="mt-2"></div>
                            </div>
                        </div>

                        <!-- Loading Area -->
                        <div class="form-group">
                            <label><strong>Loading Area:</strong></label><br>
                            <?php $loading_area = $inspection['loading_area'] ?? ''; ?>
                            <label><input type="radio" name="loading_area" value="Very Clean" <?= ($loading_area == 'Very Clean') ? 'checked' : '' ?>> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Clean" <?= ($loading_area == 'Clean') ? 'checked' : '' ?>> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Dirty" <?= ($loading_area == 'Dirty') ? 'checked' : '' ?>> Dirty</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Loading Area):</label>
                                <input type="file" class="form-control" name="photo_loading_area" accept="image/*" capture="camera" id="photo_loading_area">

                                <?php if (!empty($inspection['photo_loading_area'])): ?>
                                    <div class="mt-2">
                                        <img src="../../uploads/inspection_photos/<?= htmlspecialchars($inspection['photo_loading_area']) ?>" width="150" class="img-thumbnail">
                                        <p class="text-muted small">Current photo</p>
                                    </div>
                                <?php endif; ?>

                                <div id="preview_loading_area" class="mt-2"></div>
                            </div>
                        </div>

                        <!-- Exterior -->
                        <div class="form-group">
                            <label><strong>Exterior:</strong></label><br>
                            <?php $exterior = $inspection['exterior'] ?? ''; ?>
                            <label><input type="radio" name="exterior" value="Ready to sell" <?= ($exterior == 'Ready to sell') ? 'checked' : '' ?>> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Polish" <?= ($exterior == 'Polish') ? 'checked' : '' ?>> Polish</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Body shop" <?= ($exterior == 'Body shop') ? 'checked' : '' ?>> Body shop</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Missing body parts" <?= ($exterior == 'Missing body parts') ? 'checked' : '' ?>> Missing body parts</label>

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Exterior):</label>
                                <input type="file" class="form-control" name="photo_exterior" accept="image/*" capture="camera" id="photo_exterior">

                                <?php if (!empty($inspection['photo_exterior'])): ?>
                                    <div class="mt-2">
                                        <img src="../../uploads/inspection_photos/<?= htmlspecialchars($inspection['photo_exterior']) ?>" width="150" class="img-thumbnail">
                                        <p class="text-muted small">Current photo</p>
                                    </div>
                                <?php endif; ?>

                                <div id="preview_exterior" class="mt-2"></div>
                            </div>
                        </div>

                        <!-- Engine Compartment: -->
                        <div class="form-group">
                            <label><strong>Engine Compartment:</strong></label><br>
                            <?php $engine_compartment = $inspection['engine_compartment'] ?? ''; ?>
                            <label><input type="radio" name="engine_compartment" value="Very Clean" <?= ($engine_compartment == 'Very Clean') ? 'checked' : '' ?>> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="engine_compartment" value="Clean" <?= ($engine_compartment == 'Clean') ? 'checked' : '' ?>> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="engine_compartment" value="Dirty" <?= ($engine_compartment == 'Dirty') ? 'checked' : '' ?>> Dirty</label>&nbsp;&nbsp;

                            <div class="mt-2">
                                <label class="text-muted">Upload Photo (Exterior):</label>
                                <input type="file" class="form-control" name="photo_engine_compartment" accept="image/*" capture="camera" id="photo_engine_compartment">

                                <?php if (!empty($inspection['photo_engine_compartment'])): ?>
                                    <div class="mt-2">
                                        <img src="../../uploads/inspection_photos/<?= htmlspecialchars($inspection['photo_engine_compartment']) ?>" width="150" class="img-thumbnail">
                                        <p class="text-muted small">Current photo</p>
                                    </div>
                                <?php endif; ?>

                                <div id="preview_engine_compartment" class="mt-2"></div>
                            </div>
                        </div>

                        <!-- Mechanical -->
                        <div class="form-group">
                            <label><strong>Mechanical:</strong></label><br>
                            <?php $mechanical = $inspection['mechanical'] ?? ''; ?>
                            <label><input type="radio" name="mechanical" value="Ready to sell" <?= ($mechanical == 'Ready to sell') ? 'checked' : '' ?>> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Warning lights" <?= ($mechanical == 'Warning lights') ? 'checked' : '' ?>> Warning lights</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Workshop" <?= ($mechanical == 'Workshop') ? 'checked' : '' ?>> Workshop</label>
                        </div>

                        <!-- Comments -->
                        <div class="form-group">
                            <label><strong>Comments:</strong></label>
                            <textarea name="comments" class="form-control" rows="3"><?= htmlspecialchars($inspection['comments'] ?? '') ?></textarea>
                        </div>

                        <!-- Test Driven -->
                        <div class="form-group">
                            <label><strong>Is Test Driven?</strong></label><br>
                            <?php $test_driven = $inspection['test_driven'] ?? ''; ?>
                            <label><input type="radio" name="test_driven" value="Yes" <?= ($test_driven == 'Yes') ? 'checked' : '' ?>> Yes</label>&nbsp;&nbsp;
                            <label><input type="radio" name="test_driven" value="No" <?= ($test_driven == 'No') ? 'checked' : '' ?>> No</label>
                        </div>

                        <!-- Test Drive Comments -->
                        <div class="form-group">
                            <label><strong>Test Drive Comments:</strong></label>
                            <textarea name="test_drive_comments" class="form-control" rows="2"><?= htmlspecialchars($inspection['test_drive_comments'] ?? '') ?></textarea>
                        </div>

                        <!-- Submit -->
                        <div class="form-group text-end">
                            <button type="submit" class="btn btn-primary" id="updateBtn">Update Inspection</button>
                            <a href="<?php echo WEB_ROOT; ?>index.php" class="btn btn-danger" id="cancelBtn"><i class="fa fa-times"></i> Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Loading/Status Modal -->
<div class="modal fade" id="statusModal" tabindex="-1" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content text-center">
            <div class="modal-body">
                <!-- Loading State -->
                <div id="loadingState" class="modal-loader">
                    <div class="loading-spinner"></div>
                    <h4>Processing your request...</h4>
                    <p class="text-muted">Please wait while we update the inspection.</p>
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

<!-- Live Image Preview Script -->
<script>
    function previewImage(inputId, previewId) {
        const input = document.getElementById(inputId);
        const preview = document.getElementById(previewId);

        input.addEventListener('change', function() {
            preview.innerHTML = '';
            const file = this.files[0];
            if (file) {
                const img = document.createElement('img');
                img.src = URL.createObjectURL(file);
                img.classList.add('img-thumbnail');
                img.style.width = '150px';
                preview.appendChild(img);
            }
        });
    }

    previewImage('photo_drivers_cabin', 'preview_drivers_cabin');
    previewImage('photo_loading_area', 'preview_loading_area');
    previewImage('photo_exterior', 'preview_exterior');
    previewImage('photo_engine_compartment', 'preview_engine_compartment');
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function() {
        let formSubmitted = false;
        
        // Handle form submission with modal loading
        $("#inspectionForm").on("submit", function(e) {
            e.preventDefault();
            
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
            $("#updateBtn").prop("disabled", true);
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
                            $("#statusText").text("Inspection updated successfully!");
                        } else {
                            $("#statusIcon")
                                .removeClass("fa-check-circle text-success")
                                .addClass("fa-times-circle text-danger");
                            $("#statusText").text(result.message || "Failed to update inspection!");
                        }
                    } catch(e) {
                        // If not JSON, check if response contains success/error keywords
                        if (response.includes("success") || response.includes("Success")) {
                            $("#statusIcon")
                                .removeClass("fa-times-circle text-danger")
                                .addClass("fa-check-circle text-success");
                            $("#statusText").text("Inspection updated successfully!");
                        } else {
                            $("#statusIcon")
                                .removeClass("fa-check-circle text-success")
                                .addClass("fa-times-circle text-danger");
                            $("#statusText").text("Failed to update inspection!");
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
                    $("#updateBtn").prop("disabled", false);
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
                $("#statusText").text("Inspection updated successfully!");
            } else if (status === "error") {
                $("#statusIcon")
                    .removeClass("fa-check-circle text-success")
                    .addClass("fa-times-circle text-danger");
                $("#statusText").text("Failed to update inspection!");
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