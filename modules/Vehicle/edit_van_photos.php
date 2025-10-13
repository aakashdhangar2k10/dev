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
        
    </style>
</head>

<body>

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

                        <form method="POST" action="controller.php" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="update_vehicle_images">
                            <input type="hidden" name="vehicle_id" value="<?= $vehicle_id ?>">

                            <div class="box-body">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Vehicle No.<span style="color:red">*</span></label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($vehicle['vehicle_no']) ?>" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Branch</label>
                                        <input type="text" class="form-control" value="<?= htmlspecialchars($vehicle['short_name']) ?>" readonly>
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
                                                <input type="file" name="replace_image[<?= $img['id'] ?>]" class="form-control image-file" accept="image/*">

                                                <!-- Label Dropdown -->
                                                <label>Label</label>
                                                <select name="image_label[<?= $img['id'] ?>]" class="form-control" required>
                                                    <option value="front" <?= $img['image_label'] == 'front' ? 'selected' : '' ?>>Front View</option>
                                                    <option value="back" <?= $img['image_label'] == 'back' ? 'selected' : '' ?>>Back View</option>
                                                    <option value="left" <?= $img['image_label'] == 'left' ? 'selected' : '' ?>>Left Side</option>
                                                    <option value="right" <?= $img['image_label'] == 'right' ? 'selected' : '' ?>>Right Side</option>
                                                    <option value="interior" <?= $img['image_label'] == 'interior' ? 'selected' : '' ?>>Interior</option>
                                                    <option value="Loading area" <?= $img['image_label'] == 'Loading area' ? 'selected' : '' ?>>Loading Area</option>
                                                    <option value="rc" <?= $img['image_label'] == 'rc' ? 'selected' : '' ?>>RC Book</option>
                                                    <option value="insurance" <?= $img['image_label'] == 'insurance' ? 'selected' : '' ?>>Insurance</option>
                                                    <option value="other" <?= $img['image_label'] == 'other' ? 'selected' : '' ?>>Other</option>
                                                </select>

                                                <!-- Description -->
                                                <label>Description</label>
                                                <input type="text" name="image_description[<?= $img['id'] ?>]" class="form-control" value="<?= htmlspecialchars($img['image_description']) ?>">

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
                                            <input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*">
                                        </div>
                                        <div class="col-md-2">
                                            <select name="image_label_new[]" class="form-control image-label">
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
                                            <input type="text" name="image_description_new[]" class="form-control image-desc" placeholder="Enter custom description">
                                        </div>
                                        <div class="col-md-2">
                                            <button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" id="addImageRow" class="btn btn-success mt-2"><i class="fa fa-plus"></i> Add More</button>
                            </div>

                            <div class="box-footer text-right mt-3">
                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Save Changes</button>
                                <a href="index.php" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function() {
            const maxImages = 10;
            const existingCount = <?= count($images) ?>; // count of existing uploaded images
            const addBtn = $("#addImageRow");

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
                if (existingCount + newRows >= maxImages) return; // prevent adding more than max

                const newRow = `<div class="image-row row">
      <div class="col-md-3"><input type="file" name="vehicle_images[]" class="form-control image-file" accept="image/*"></div>
      <div class="col-md-2">
        <select name="image_label_new[]" class="form-control image-label">
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
      <div class="col-md-3"><input type="text" name="image_description_new[]" class="form-control image-desc" placeholder="Enter custom description"></div>
      <div class="col-md-2"><button type="button" class="btn btn-danger removeImageRow"><i class="fa fa-trash"></i> Remove</button></div>
    </div>`;
                $("#imageUploadContainer").append(newRow);
                toggleAddButton();
            });

            $(document).on("click", ".removeImageRow", function() {
                $(this).closest(".image-row").remove();
                toggleAddButton();
            });
        });
    </script>


</body>

</html>