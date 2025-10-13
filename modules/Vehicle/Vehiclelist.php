<?php
include('controller.php'); // Make sure this includes your PDO $conn

// --- Handle search ---
$search = isset($_GET['search']) ? trim($_GET['search']) : '';

// --- Rows per page ---
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
if (!in_array($limit, [10, 20, 30, 50, 100])) $limit = 10;

// --- Pagination setup ---
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page - 1) * $limit;

// --- Fetch data using your branch/staff aware function ---
$totalVehicles = totalVehicles($conn, $search); // make sure totalVehicles respects branch filter too
$totalPages = ceil($totalVehicles / $limit);
$vehicles = listVehiclescount($conn, $start, $limit, $search);

// --- Base URL for pagination ---
$baseUrl = "index.php?module=Vehicle&view=Vehiclelist";
if ($search) $baseUrl .= "&search=" . urlencode($search);
if ($limit) $baseUrl .= "&limit=" . urlencode($limit);

// --- Highlight search term ---
function highlight($text, $search) {
    if (!$search) return htmlspecialchars($text);
    return preg_replace('/(' . preg_quote($search, '/') . ')/i', '<mark>$1</mark>', htmlspecialchars($text));
}
?>

<section class="content-header">
  <h1>Vehicle <small>Control Panel</small></h1>
  <ol class="breadcrumb">
    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
    <li class="active">Vehicle List</li>
  </ol>
</section>

<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">All Vehicles</h3>
        </div>

        <!-- Controls -->
        <div class="box-tools clearfix" style="margin:10px 15px;">
          <form method="get" class="form-inline" id="vehicleForm">
            <input type="hidden" name="module" value="Vehicle">
            <input type="hidden" name="view" value="Vehiclelist">

            <!-- Show rows -->
            <div class="form-group" style="float:left; margin-right:15px;">
              <label for="limit">Show</label>
              <select name="limit" id="limit" class="form-control input-sm">
                <?php foreach ([10,20,30,50,100] as $l): 
                  $selected = ($limit==$l)?'selected':'';
                ?>
                  <option value="<?= $l ?>" <?= $selected ?>><?= $l ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <!-- Search -->
            <div class="form-group pull-right">
              <label for="search">Search</label>
              <input type="text" name="search" id="search" class="form-control input-sm" placeholder="Vehicle No, Make, Model, Colour..." value="<?= htmlspecialchars($search) ?>">
            </div>
            <div style="clear:both;"></div>
          </form>
        </div>

        <script>
          document.getElementById('limit').addEventListener('change', () => document.getElementById('vehicleForm').submit());
          let searchTimeout;
          document.getElementById('search').addEventListener('keyup', () => {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(() => document.getElementById('vehicleForm').submit(), 500);
          });
        </script>

        <!-- Table -->
        <div class="box-body table-responsive">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>Vehicle No</th>
                <th>Make</th>
                <th>Model</th>
                <th>Colour</th>
                <th>Fuel</th>
                <th>Year</th>
                <th>MOT Due Date</th>
                <th>Tax Due Date</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <?php
              if (!empty($vehicles)):
                $s_no = $start + 1;
                foreach ($vehicles as $v):
                  $pdfUrl = "generate_vehicle_pdf.php?id=" . $v['id'];
                  $fileName = "REPORT_" . preg_replace("/[^a-z0-9]/i", "_", strtoupper($v['registrationNumber'])) . ".pdf";
              ?>
              <tr>
                <td><?= $s_no ?></td>
                <td><a href="index.php?view=view_vahan&id=<?= $v['id'] ?>"><?= highlight($v['registrationNumber'], $search) ?></a></td>
                <td><?= highlight($v['make'], $search) ?></td>
                <td><?= highlight($v['model'], $search) ?></td>
                <td><?= highlight($v['colour'], $search) ?></td>
                <td><?= htmlspecialchars($v['fuelType']) ?></td>
                <td><?= htmlspecialchars($v['yearOfManufacture']) ?></td>
                <td><?= htmlspecialchars($v['motDueDate']) ?></td>
                <td><?= htmlspecialchars($v['taxDueDate']) ?></td>
                <td>
                  <a href="index.php?view=view_vahan&id=<?= $v['id'] ?>" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
                  <?php if($_SESSION['type']==='Administrator'): ?>
                    <a href="<?= $pdfUrl ?>" download="<?= $fileName ?>" class="btn btn-primary btn-sm" target="_blank"><i class="fa fa-download"></i></a>
                    <button class="btn btn-success btn-sm" onclick="sharePdfFile('<?= $pdfUrl ?>','<?= $fileName ?>')"><i class="fa fa-share-alt"></i></button>
                  <?php endif; ?>
                </td>
              </tr>
              <?php
                  $s_no++;
                endforeach;
              else:
              ?>
              <tr><td colspan="10">No vehicles found.</td></tr>
              <?php endif; ?>
            </tbody>
          </table>
        </div>

        <!-- Pagination -->
        <?php if($totalPages>1): ?>
        <div class="box-footer clearfix">
          <ul class="pagination pagination-sm no-margin pull-right">
            <li class="<?= ($page<=1)?'disabled':'' ?>">
              <a href="<?= ($page<=1)?'#':$baseUrl.'&page='.($page-1) ?>">&laquo; Previous</a>
            </li>
            <?php
              $startPage = max(1,$page-2);
              $endPage = min($totalPages,$page+2);
              if($startPage>1){ echo '<li><a href="'.$baseUrl.'&page=1">1</a></li>'; if($startPage>2) echo '<li class="disabled"><span>...</span></li>'; }
              for($i=$startPage;$i<=$endPage;$i++){ $active = ($i==$page)?'class="active"':''; echo '<li '.$active.'><a href="'.$baseUrl.'&page='.$i.'">'.$i.'</a></li>'; }
              if($endPage<$totalPages){ if($endPage<$totalPages-1) echo '<li class="disabled"><span>...</span></li>'; echo '<li><a href="'.$baseUrl.'&page='.$totalPages.'">'.$totalPages.'</a></li>'; }
            ?>
            <li class="<?= ($page>=$totalPages)?'disabled':'' ?>">
              <a href="<?= ($page>=$totalPages)?'#':$baseUrl.'&page='.($page+1) ?>">Next &raquo;</a>
            </li>
          </ul>
        </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</section>

<style>
.table-responsive{overflow-x:auto;}
@media(max-width:767px){.table-responsive table{width:100%;font-size:12px;} .table-responsive table th,.table-responsive table td{padding:6px;} .box-footer .pagination{float:none !important;text-align:center;margin-top:10px;} .box-footer .pagination li{display:inline-block;margin:2px;}}
mark{background-color:#ffff66;color:#000;}
</style>

<script>
async function sharePdfFile(pdfUrl,fileName){
  try{
    const response = await fetch(pdfUrl);
    const blob = await response.blob();
    const file = new File([blob],fileName,{type:"application/pdf"});
    if(navigator.canShare && navigator.canShare({files:[file]})){
      await navigator.share({title:"Vehicle Report",text:"Here is the vehicle report PDF.",files:[file]});
    } else if(navigator.share){
      await navigator.share({title:"Vehicle Report",text:"Check this vehicle report PDF",url:pdfUrl});
    } else {
      prompt("Copy this link to share:",pdfUrl);
    }
  } catch(err){
    console.error("Share failed:",err);
    alert("Sharing failed. Please copy this link: "+pdfUrl);
  }
}
</script>
