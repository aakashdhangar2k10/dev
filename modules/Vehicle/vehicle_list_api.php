<?php
include('../../includes/db.php'); // must define $conn (PDO)

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
$orderDir         = $_POST['order'][0]['dir'] ?? 'desc';

/*
|--------------------------------------------------------------------------
| Column Mapping (IMPORTANT)
|--------------------------------------------------------------------------
*/
$columns = [
    0 => 'id',
    1 => 'vehicle_no',
    2 => 'branch_id',
    3 => 'make',
    4 => 'model',
    5 => 'fuelType',
    6 => 'created_at',
    7 => 'flagged'
];

$orderColumn = $columns[$orderColumnIndex] ?? 'id';

/*
|--------------------------------------------------------------------------
| Base WHERE Clause
|--------------------------------------------------------------------------
*/
$delete_status = 0;
$where  = " WHERE flagged IN (0,1) AND is_deleted = $delete_status ";
$params = [];

/*
|--------------------------------------------------------------------------
| Global Search
|--------------------------------------------------------------------------
*/
if (!empty($searchValue)) {
    $where .= " AND (
        vehicle_no LIKE :search
        OR branch_id LIKE :search
        OR make LIKE :search
        OR model LIKE :search
        OR fuelType LIKE :search
    )";
    $params[':search'] = "%$searchValue%";
}

/*
|--------------------------------------------------------------------------
| Total Records (without filter)
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
$stmtFiltered = $conn->prepare(
    "SELECT COUNT(*) FROM vehicle_details_tbl $where"
);
$stmtFiltered->execute($params);
$recordsFiltered = $stmtFiltered->fetchColumn();

/*
|--------------------------------------------------------------------------
| Data Query (LIMIT / OFFSET)
|--------------------------------------------------------------------------
*/
$sql = "
    SELECT 
        vd.id AS id,
        vd.vehicle_no AS vehicle_no,
        vd.branch_id AS branch_id,
        vd.make AS make,
        vd.model AS model,
        vd.motDueDate AS motDueDate,
        vd.fuelType AS fuelType,
        vd.created_at AS created_at,
        vd.flagged AS flagged,
        vi.inspection_date AS inspection_date 
    FROM vehicle_details_tbl vd LEFT JOIN vehicle_inspection_tbl vi ON vi.vehicle_id = vd.id
    $where
    ORDER BY $orderColumn $orderDir
    LIMIT :start, :length
";

$stmt = $conn->prepare($sql);

foreach ($params as $key => $val) {
    $stmt->bindValue($key, $val);
}

$stmt->bindValue(':start', $start, PDO::PARAM_INT);
$stmt->bindValue(':length', $length, PDO::PARAM_INT);

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

/*
|--------------------------------------------------------------------------
| JSON Response (DataTables Format)
|--------------------------------------------------------------------------
*/
echo json_encode([
    "draw"            => $draw,
    "recordsTotal"    => (int)$totalRecords,
    "recordsFiltered" => (int)$recordsFiltered,
    "data"            => $data
], JSON_UNESCAPED_UNICODE);
