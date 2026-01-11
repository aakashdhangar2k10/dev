<?php
include('../../includes/db.php'); // PDO connection

header('Content-Type: application/json');

/*
|--------------------------------------------------------------------------
| DataTables Parameters
|--------------------------------------------------------------------------
*/
$draw   = isset($_POST['draw']) ? (int)$_POST['draw'] : 0;
$start  = isset($_POST['start']) ? (int)$_POST['start'] : 0;
$length = isset($_POST['length']) ? (int)$_POST['length'] : 10;

$searchValue = $_POST['search']['value'] ?? '';

$orderColumnIndex = $_POST['order'][0]['column'] ?? 0;
$orderDir         = $_POST['order'][0]['dir'] ?? 'DESC';

/*
|--------------------------------------------------------------------------
| Column Mapping (MUST MATCH FRONTEND)
|--------------------------------------------------------------------------
*/
$columns = [
    0 => 'vd.id',
    1 => 'vd.vehicle_no',
    2 => 'vd.make',
    3 => 'vd.fuelType',
    4 => 'vd.motDueDate',
    5 => 'vd.flagged',
    6 => 'vd.is_deleted'
];

$orderColumn = $columns[$orderColumnIndex] ?? 'vd.id';

/*
|--------------------------------------------------------------------------
| Advance Search Inputs
|--------------------------------------------------------------------------
*/
$vehicle_no = $_POST['vehicle_no'] ?? '';
$make       = $_POST['make'] ?? '';
$fuelType   = $_POST['fuelType'] ?? '';
$reviewed   = $_POST['reviewed'] ?? '';
$archived   = $_POST['archived'] ?? '';
$motFrom    = $_POST['motFrom'] ?? '';
$motTo      = $_POST['motTo'] ?? '';

/*
|--------------------------------------------------------------------------
| Base WHERE Clause
|--------------------------------------------------------------------------
*/
$where  = " WHERE 1=1 ";

$params = [];

/*
|--------------------------------------------------------------------------
| Advance Filters
|--------------------------------------------------------------------------
*/
if ($vehicle_no !== '') {
    $where .= " AND vd.vehicle_no LIKE :vehicle_no";
    $params[':vehicle_no'] = "%$vehicle_no%";
}

if ($make !== '') {
    $where .= " AND vd.make LIKE :make";
    $params[':make'] = "%$make%";
}

if ($fuelType !== '') {
    $where .= " AND vd.fuelType = :fuelType";
    $params[':fuelType'] = $fuelType;
}

if ($reviewed !== '') {
    $where .= " AND vd.flagged = :reviewed";
    $params[':reviewed'] = $reviewed;
}

// if ($archived !== '') {
//     $where .= " AND vd.is_deleted = :archived";
//     $params[':archived'] = $archived;
// }
// IF archived filter is selected
if ($archived !== '') {
    $where .= " AND vd.is_deleted = :archived";
    $params[':archived'] = (int)$archived;
}

if ($motFrom !== '' && $motTo !== '') {
    $where .= " AND vd.motDueDate BETWEEN :motFrom AND :motTo";
    $params[':motFrom'] = $motFrom;
    $params[':motTo']   = $motTo;
}

/*
|--------------------------------------------------------------------------
| Global Search (DataTables)
|--------------------------------------------------------------------------
*/
if ($searchValue !== '') {
    $where .= " AND (
        vd.vehicle_no LIKE :search
        OR vd.make LIKE :search
        OR vd.model LIKE :search
        OR vd.fuelType LIKE :search
    )";
    $params[':search'] = "%$searchValue%";
}

/*
|--------------------------------------------------------------------------
| Total Records (no filter)
|--------------------------------------------------------------------------
*/
$totalRecords = $conn
    ->query("SELECT COUNT(*) FROM vehicle_details_tbl")
    ->fetchColumn();

/*
|--------------------------------------------------------------------------
| Total Records (with filter)
|--------------------------------------------------------------------------
*/
$stmtFiltered = $conn->prepare("
    SELECT COUNT(*)
    FROM vehicle_details_tbl vd
    LEFT JOIN vehicle_inspection_tbl vi ON vi.vehicle_id = vd.id
    $where
");
$stmtFiltered->execute($params);
$recordsFiltered = $stmtFiltered->fetchColumn();

/*
|--------------------------------------------------------------------------
| Data Query
|--------------------------------------------------------------------------
*/
$sql = "
    SELECT
        vd.id,
        vd.vehicle_no,
        vd.make,
        vd.fuelType,
        vd.motDueDate,
        vd.flagged,
        vd.is_deleted,
        vi.inspection_date
    FROM vehicle_details_tbl vd
    LEFT JOIN vehicle_inspection_tbl vi ON vi.vehicle_id = vd.id
    $where
    ORDER BY $orderColumn $orderDir
    LIMIT :start, :length
";

$stmt = $conn->prepare($sql);

/* Bind dynamic params */
foreach ($params as $key => $val) {
    $stmt->bindValue($key, $val);
}

/* Pagination */
$stmt->bindValue(':start', $start, PDO::PARAM_INT);
$stmt->bindValue(':length', $length, PDO::PARAM_INT);

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

/*
|--------------------------------------------------------------------------
| JSON Response
|--------------------------------------------------------------------------
*/
echo json_encode([
    "draw"            => $draw,
    "recordsTotal"    => (int)$totalRecords,
    "recordsFiltered" => (int)$recordsFiltered,
    "data"            => $data
], JSON_UNESCAPED_UNICODE);
