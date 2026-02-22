<?php
include('../../includes/db.php');

$vehicle_id = isset($_GET['vehicle_no']) ? (int)$_GET['vehicle_no'] : 0;
if ($vehicle_id <= 0) {
    die("<div class='alert alert-danger'>Invalid Vehicle ID</div>");
}

// Fetch vehicle details
$stmt = $conn->prepare("
    SELECT v.id, v.vehicle_no, v.branch_id, b.short_name
    FROM vehicle_details_tbl v
    LEFT JOIN branches_tbl b ON v.branch_id = b.id
    WHERE v.id = :id
");
$stmt->execute([":id" => $vehicle_id]);
$vehicle = $stmt->fetch(PDO::FETCH_ASSOC);

// Fetch existing images
$imgStmt = $conn->prepare("SELECT * FROM vehicle_images_tbl WHERE vehicle_id = :vid");
$imgStmt->execute([":vid" => $vehicle_id]);
$images = $imgStmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle Photos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .box {
            background: #fff;
            padding: 20px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
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

        .image-card {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 6px;
            margin-right: 5px;
            margin-bottom: 15px;
            background: #fafafa;
            text-align: center;
        }

        .image-preview {
            max-width: 150px;
            border: 1px solid #ccc;
            padding: 4px;
            border-radius: 4px;
            margin-bottom: 8px;
        }

        .actions {
            margin-top: 10px;
        }

        .btn-right {
            float: right;
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
            <ol class="breadcrumb bg-white px-3 py-2">
                <li class="breadcrumb-item"><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                <li class="breadcrumb-item active">Edit Vehicle Photos</li>
            </ol>
        </section>

        <!-- Vehicle Form -->
        <section class="content">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="box box-info">
                        <div class="box-header with-border d-flex justify-content-between align-items-center">
                            <h4 class="box-title">Edit Vehicle Photos</h4>
                        </div>

                        <form method="POST" action="controller.php" enctype="multipart/form-data" id="vehicleForm">
                            <input type="hidden" name="action" value="update_vehicle_images">
                            <input type="hidden" name="vehicle_id" value="<?= $vehicle_id ?>">

                            <div class="box-body">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Vehicle No.<span style="color:red">*</span></label>
                                        <input type="text" class="form-control bold-select" value="<?= htmlspecialchars($vehicle['vehicle_no']) ?>" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Branch</label>
                                        <input type="text" class="form-control bold-select" value="<?= htmlspecialchars($vehicle['short_name']) ?>" readonly>
                                    </div>
                                </div>

                                <hr>
                                <h5><b><i class="fa fa-images"></i> Existing Vehicle Images</b></h5>
                                <?php if (!empty($images)): ?>
                                    <div class="row">
                                        <?php foreach ($images as $img): ?>
                                            <div class="col-md-4 image-card">
                                                <img src="../../uploads/vehicles/<?= htmlspecialchars($img['image_path']) ?>"
                                                    class="image-preview" alt="<?= htmlspecialchars($img['image_label']) ?>">

                                                <!-- Replace Image -->
                                                <label>Replace Image</label>
                                                <input type="file" name="replace_image[<?= $img['id'] ?>]" class="form-control image-file open-camera" accept="image/*" capture="camera">

                                                <div class="actions">
                                                    <!-- <a href="delete_vehicle_image.php?id=<?= $img['id'] ?>&vehicle_no=<?= $vehicle_id ?>"
                                                        onclick="return confirm('Are you sure to delete this image?')"
                                                        class="btn btn-sm btn-danger">
                                                        <i class="fa fa-trash"></i> Delete
                                                    </a> -->
                                                </div>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                <?php else: ?>
                                    <p class="text-muted">No images uploaded yet.</p>
                                <?php endif; ?>

                                <hr>
                                <h5><b><i class="fa fa-plus"></i> Add New Vehicle Images</b></h5>
                                <div id="imageUploadContainer">
                                    <div class="image-row row">
                                        <div class="col-md-3">
                                            <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*" capture="camera">
                                        </div>

                                        <div class="col-md-2">
                                            <button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" id="addImageRow" class="btn btn-success mt-2"><i class="fa fa-plus"></i> Add More</button>
                            </div>

                            <div class="box-footer text-right mt-3">
                                <button type="submit" class="btn btn-success" id="saveBtn"><i class="fa fa-save"></i> Save Changes</button>
                                <a href="index.php" class="btn btn-secondary" id="backBtn"><i class="fa fa-arrow-left"></i> Back</a>
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
        $(function() {
            const maxImages = 10;
            const existingCount = <?= count($images) ?>;
            const addBtn = $("#addImageRow");
            let formSubmitted = false;

            function toggleAddButton() {
                const newRows = $("#imageUploadContainer .image-row").length;
                if (existingCount + newRows >= maxImages) {
                    addBtn.prop("disabled", true).text("Limit Reached (" + maxImages + ")");
                } else {
                    addBtn.prop("disabled", false).html('<i class="fa fa-plus"></i> Add More');
                }
            }
            toggleAddButton();

            addBtn.on("click", function() {
                const newRows = $("#imageUploadContainer .image-row").length;
                if (existingCount + newRows >= maxImages) return;

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

            $(document).on("click", ".removeImageRow", function() {
                $(this).closest(".image-row").remove();
                toggleAddButton();
            });

            // Handle back button with browser loading
            $("#backBtn").on("click", function(e) {
                e.preventDefault();
                const href = $(this).attr("href");
                
                // Show browser loading overlay
                $("#browserLoading").addClass("active");
                
                // Redirect after a small delay to show loading
                setTimeout(function() {
                    window.location.href = href;
                }, 300);
            });

            // Handle form submission with modal loading
            $("#vehicleForm").on("submit", function(e) {
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
                                $("#statusText").text("Vehicle images updated successfully!");
                            } else {
                                $("#statusIcon")
                                    .removeClass("fa-check-circle text-success")
                                    .addClass("fa-times-circle text-danger");
                                $("#statusText").text(result.message || "Failed to update vehicle images!");
                            }
                        } catch(e) {
                            // If not JSON, check if response contains success/error keywords
                            if (response.includes("success") || response.includes("Success")) {
                                $("#statusIcon")
                                    .removeClass("fa-times-circle text-danger")
                                    .addClass("fa-check-circle text-success");
                                $("#statusText").text("Vehicle images updated successfully!");
                            } else {
                                $("#statusIcon")
                                    .removeClass("fa-check-circle text-success")
                                    .addClass("fa-times-circle text-danger");
                                $("#statusText").text("Failed to update vehicle images!");
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
                    $("#statusText").text("Vehicle images updated successfully!");
                } else if (status === "error") {
                    $("#statusIcon")
                        .removeClass("fa-check-circle text-success")
                        .addClass("fa-times-circle text-danger");
                    $("#statusText").text("Failed to update vehicle images!");
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