<?php
session_start();
include('../../includes/db.php');

header('Content-Type: application/json');

/*
|--------------------------------------------------------------------------
| DataTables Parameters
|--------------------------------------------------------------------------
*/
$draw   = (int)($_POST['draw'] ?? 0);
$start  = (int)($_POST['start'] ?? 0);
$length = (int)($_POST['length'] ?? 10);

$searchValue = $_POST['search']['value'] ?? '';

$orderColumnIndex = $_POST['order'][0]['column'] ?? 0;
$orderDir         = $_POST['order'][0]['dir'] ?? 'DESC';

/*
|--------------------------------------------------------------------------
| Column Mapping
|--------------------------------------------------------------------------
*/
$columns = [
    0 => 'vd.id',
    1 => 'vd.vehicle_no',
    2 => 'vd.make',
    3 => 'vd.fuelType',
    4 => 'vd.motDueDate',
    5 => 'vd.flagged'
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
$assigned_staff = $_POST['assigned_staff'] ?? '';
$branch_id  = $_POST['branch_id'] ?? '';

/*
|--------------------------------------------------------------------------
| Logged-in User
|--------------------------------------------------------------------------
*/
$acct_id = $_SESSION['acct_id'] ?? 0;
$type    = $_SESSION['type'] ?? '';

/*
|--------------------------------------------------------------------------
| Base WHERE
|--------------------------------------------------------------------------
*/
$where  = " WHERE 1=1 ";
$params = [];

/*
|--------------------------------------------------------------------------
| ROLE-BASED VISIBILITY (IMPORTANT)
|--------------------------------------------------------------------------
*/
if ($type !== 'Administrator') {
    $where .= " AND vd.assigned_staff = :login_acct_id AND vd.is_deleted = 0";
    $params[':login_acct_id'] = $acct_id;
}

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

if ($archived !== '') {
    $where .= " AND vd.is_deleted = :archived";
    $params[':archived'] = (int)$archived;
}

if ($motFrom !== '' && $motTo !== '') {
    $where .= " AND vd.motDueDate BETWEEN :motFrom AND :motTo";
    $params[':motFrom'] = $motFrom;
    $params[':motTo']   = $motTo;
}

/* Admin-only staff filter */
if ($type === 'Administrator' && $assigned_staff !== '') {
    $where .= " AND vd.assigned_staff = :assigned_staff";
    $params[':assigned_staff'] = $assigned_staff;
}

if ($branch_id !== '') {
    $where .= " AND vd.branch_id = :branch_id";
    $params[':branch_id'] = $branch_id;
}

/*
|--------------------------------------------------------------------------
| Global Search
|--------------------------------------------------------------------------
*/
if ($searchValue !== '') {
    $where .= " AND (
        vd.vehicle_no LIKE :search
        OR vd.make LIKE :search
        OR vd.fuelType LIKE :search
    )";
    $params[':search'] = "%$searchValue%";
}

/*
|--------------------------------------------------------------------------
| Records Count
|--------------------------------------------------------------------------
*/
$totalRecords = $conn->query(
    "SELECT COUNT(*) FROM vehicle_details_tbl"
)->fetchColumn();

$stmtFiltered = $conn->prepare("
    SELECT COUNT(*)
    FROM vehicle_details_tbl vd
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
        vd.branch_id,
        vd.assigned_staff,
        vi.inspection_date
    FROM vehicle_details_tbl vd
    LEFT JOIN vehicle_inspection_tbl vi ON vi.vehicle_id = vd.id
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
| JSON Response
|--------------------------------------------------------------------------
*/
echo json_encode([
    "draw"            => $draw,
    "recordsTotal"    => (int)$totalRecords,
    "recordsFiltered" => (int)$recordsFiltered,
    "data"            => $data
]);
