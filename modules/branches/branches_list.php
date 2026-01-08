<!-- Content Header -->
<section class="content-header">
    <h1>Branch <small>List</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Branch List</li>
    </ol>
</section>

<!-- Branch Table -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">All Branches</h3>
                </div>

                <div class="box-body">
                    <div class="table-responsive">
                        <table id="branchTable" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Short Name</th>
                                    <th>Full Name</th>
                                    <th>Address</th>
                                    <th>Post Code</th>
                                    <!-- <th>Code</th> -->
                                    <!-- <th>Year</th> -->
                                    <th>Logo</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                include('controller.php');
                                $branches = get_branches();
                                if (count($branches) > 0) {
                                    $s_no = 1;
                                    foreach ($branches as $branch) {
                                        echo "<tr>";
                                        echo "<td data-label='#'>" . $s_no++ . "</td>";
                                        echo "<td data-label='Short Name'>" . htmlspecialchars($branch['short_name']) . "</td>";
                                        echo "<td data-label='Full Name'>" . htmlspecialchars($branch['full_name']) . "</td>";
                                        echo "<td data-label='Address'>" . htmlspecialchars($branch['address']) . "</td>";
                                        echo "<td data-label='Pin Code'>" . htmlspecialchars($branch['pincode']) . "</td>";
                                        // echo "<td data-label='Code'>" . htmlspecialchars($branch['code']) . "</td>";
                                        // echo "<td data-label='Year'>" . htmlspecialchars($branch['year_established']) . "</td>";
                                        echo "<td data-label='Logo'>";
                                        echo "<img src='" . htmlspecialchars($branch['logo']) . "' style='height:40px;' />";
                                        echo "</td>";
                                        echo "<td data-label='Action'>";
                                        echo "<a href='index.php?view=branch_view&id={$branch['id']}' class='btn btn-info btn-sm'><i class='fa fa-eye'></i></a> ";
                                        echo "<a href='index.php?view=branch_edit&id={$branch['id']}' class='btn btn-warning btn-sm'><i class='fa fa-edit'></i></a>";
                                        echo "</td>";
                                        echo "</tr>";
                                    }
                                } else {
                                    echo "<tr><td colspan='9'>No branches found.</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div><!-- /.table-responsive -->
                </div>
            </div>
        </div>
    </div>
</section>


<script>
$(document).ready(function() {
    $('#branchTable').DataTable({
        "pageLength": 10,
        "lengthMenu": [5, 10, 25, 50, 100],
        "responsive": true,
        "autoWidth": false
    });
});
</script>

<!-- Responsive Table CSS for Card View -->
<style>
@media (max-width: 767px) {
  .table-responsive table thead {
    display: none;
  }
  .table-responsive table tbody tr {
    display: block;
    margin-bottom: 15px;
    border: 1px solid #dee2e6;
    border-radius: .5rem;
    background: #fff;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,.05);
  }
  .table-responsive table tbody td {
    display: flex;
    justify-content: space-between;
    padding: .5rem;
    border: none;
    border-bottom: 1px solid #f1f1f1;
  }
  .table-responsive table tbody td:last-child {
    border-bottom: none;
  }
  .table-responsive table tbody td::before {
    content: attr(data-label);
    font-weight: 600;
    color: #495057;
  }
}
</style>
