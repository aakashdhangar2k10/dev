<?php
include('controller.php'); // includes PDO $conn

// Search term
$search = isset($_GET['search']) ? trim($_GET['search']) : '';

// Fetch all vehicles (DataTables handles pagination)
// $vehicles = listVehiclescount($conn, 0, 10000, $search);

// Search highlight function
function highlight($text, $search)
{
  if (!$search) return htmlspecialchars($text);
  return preg_replace(
    '/' . preg_quote($search, '/') . '/i',
    '<mark>$0</mark>',
    htmlspecialchars($text)
  );
}
?>

<style>
  /* Wrap table inside scroll container on mobile */
  .table-responsive {
    width: 100%;
    overflow-x: auto;
  }

  /* Fix icon size for mobile */
  .flag-toggle {
    font-size: 20px;
  }

  /* Actions buttons responsive */
  .table-actions button,
  .table-actions a {
    margin-bottom: 5px;
  }

  /* Make table text smaller on small screens */
  @media (max-width: 768px) {

    #vehicleTable th,
    #vehicleTable td {
      font-size: 13px;
      white-space: nowrap;
    }

    .flag-toggle {
      font-size: 18px;
    }

    .btn-sm {
      padding: 2px 6px;
      font-size: 12px;
    }
  }

  /* Extra small devices */
  @media (max-width: 480px) {

    #vehicleTable th,
    #vehicleTable td {
      font-size: 12px;
    }

    .btn-sm {
      padding: 1px 5px;
      font-size: 11px;
    }

    .flag-toggle {
      font-size: 17px;
    }
  }
</style>

<!-- PAGE HEADER -->
<section class="content-header">
  <h1>Vehicle <small>Control Panel</small></h1>
  <ol class="breadcrumb">
    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
    <li class="active">Vehicle List</li>
  </ol>
</section>

<!-- DATA TABLES CSS + JS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<script>
  $(document).ready(function() {

    // Create DataTable instance
    var table = $('#vehicleTable').DataTable({
      "pageLength": 50,
      "lengthMenu": [10, 20, 30, 50, 100]
    });

    // Flag Filter Dropdown
    $('#flagFilter').on('change', function() {
      let val = $(this).val();

      if (val === "") {
        // Show all
        table.column(5).search("").draw();
      } else if (val === "1") {
        // Show GREEN flagged items
        table.column(5).search("flag-red", true, false).draw();
      } else if (val === "0") {
        // Show RED flagged items
        table.column(5).search("flag-green", true, false).draw();
      }
    });

  });
</script>


<!-- MAIN SECTION -->
<section class="content">
  <div class="row">
    <div class="col-md-12">

      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">All Vehicles</h3>
        </div>
        <div class="table-responsive">
          <table id="vehicleTable" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Vehicle No</th>
                <th>Make</th>
                <th>MOT Due Date</th>
                <th>Inspection Date</th>
                <th>Review</th>
                <?php if ($_SESSION['type'] === 'Administrator'): ?>
                  <th>Actions</th>
                <?php endif; ?>
              </tr>
            </thead>

            <tbody>
              <?php
              if (!empty($vehicles)):
                $s_no = 1;
                foreach ($vehicles as $v):
                  $pdfUrl   = "generate_vehicle_pdf.php?id=" . $v['id'];
                  $fileName = "REPORT_" . preg_replace("/[^a-z0-9]/i", "_", strtoupper($v['registrationNumber'])) . ".pdf";
              ?>
                  <tr>
                    <td><?= $s_no ?></td>

                    <td>
                      <a href="index.php?view=view_vahan&id=<?= $v['id'] ?>">
                        <b><?= highlight($v['registrationNumber'], $search) ?></b>
                      </a>
                    </td>

                    <td><?= highlight($v['make'], $search) ?></td>
                    <?php
                    $rawDate = $v['motDueDate'];
                    $motDate = strtotime(str_replace('/', '-', $rawDate));

                    // Hidden sortable date (YYYY-MM-DD)
                    $sortableDate = $motDate ? date("Y-m-d", $motDate) : "";

                    // Visible date (DD-MM-YYYY)
                    $formattedDate = $motDate ? date("d-m-Y", $motDate) : "Invalid Date";

                    // Mark expired date in red
                    $isPast = ($motDate && $motDate < strtotime('today'));
                    $style = $isPast ? "color:#FF0000;" : "";
                    ?>
                    <td data-order="<?= $sortableDate ?>">
                      <strong style="<?= $style ?>"><?= htmlspecialchars($formattedDate) ?></strong>
                    </td>

                    <td><strong><?= !empty($v['inspection_date']) ? date("d-m-Y", strtotime($v['inspection_date'])) : 'No Inspection' ?></strong></td>

                    <td>

                      <span style="display:none; visibility:hidden;" hidden>
                        <?= $v['flagged'] == 1 ? 'flag-red' : 'flag-green' ?>
                      </span>

                      <!-- Visible clickable icon -->
                      <i class="fa fa-flag flag-toggle"
                        data-id="<?= $v['id']; ?>"
                        data-flag="<?= $v['flagged']; ?>"
                        style="cursor:pointer; color: <?= ($v['flagged'] == 1) ? 'red' : 'green'; ?>;">
                      </i>
                    </td>
                    <?php if ($_SESSION['type'] === 'Administrator'): ?>
                      <td>
                        <a href="index.php?view=view_vahan&id=<?= $v['id'] ?>" class="btn btn-info btn-sm">
                          <i class="fa fa-eye"></i>
                        </a>

                        <a href="<?= $pdfUrl ?>" download="<?= $fileName ?>" target="_blank" class="btn btn-primary btn-sm">
                          <i class="fa fa-download"></i>
                        </a>

                        <button class="btn btn-success btn-sm" onclick="sharePdfFile('<?= $pdfUrl ?>','<?= $fileName ?>')">
                          <i class="fa fa-share-alt"></i>
                        </button>
                      </td>
                    <?php endif; ?>
                  </tr>
                <?php
                  $s_no++;
                endforeach;
              else:
                ?>
                <tr>
                  <td colspan="10">No vehicles found.</td>
                </tr>
              <?php endif; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- SHARE PDF FUNCTION -->
<script>
  async function sharePdfFile(pdfUrl, fileName) {
    try {
      const response = await fetch(pdfUrl);
      const blob = await response.blob();
      const file = new File([blob], fileName, {
        type: "application/pdf"
      });

      if (navigator.canShare && navigator.canShare({
          files: [file]
        })) {
        await navigator.share({
          title: "Vehicle Report",
          text: "Here is the vehicle report PDF.",
          files: [file]
        });
      } else if (navigator.share) {
        await navigator.share({
          title: "Vehicle Report",
          text: "Check this vehicle report PDF",
          url: pdfUrl
        });
      } else {
        prompt("Copy this link to share:", pdfUrl);
      }
    } catch (err) {
      console.error("Share failed:", err);
      alert("Sharing failed. Please copy this link: " + pdfUrl);
    }
  }
</script>
<script>
  $(document).on("click", ".flag-toggle", function() {

    let icon = $(this);
    let id = icon.data("id");
    let flagged = icon.data("flag");

    // Toggle flag
    let newFlag = flagged == 1 ? 0 : 1;

    $.post("controller.php", {
      action: "updateFlagStatus",
      id: id,
      flagged: newFlag
    }, function(response) {
      console.log(response);

      // Update icon color
      icon.data("flag", newFlag);
      icon.css("color", newFlag == 1 ? "red" : "green");
    });
  });
</script>