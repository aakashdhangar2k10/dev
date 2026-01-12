<!-- PAGE HEADER -->
<section class="content-header">
    <h1>Vehicle <small>Control Panel</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Vehicle List</li>
    </ol>
</section>

<!-- DATA TABLES CSS + JS -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script> -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->

<!-- MAIN SECTION -->
<section class="content">
    <div class="row">
        <div class="col-md-12">

            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">All Vehicles</h3>
                </div>

                <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=advance_search">Advance Search</a>

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
                        <tbody style="font-weight: bold;"></tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <!-- Delete Model Box -->
    <div class="modal fade" id="deleteModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header bg-red">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <i class="fa fa-trash"></i> Confirm Delete
                    </h4>
                </div>

                <div class="modal-body text-center">
                    Are you sure you want to delete this vehicle?
                </div>

                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">
                        Cancel
                    </button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete()">
                        Yes, Delete
                    </button>
                </div>

            </div>
        </div>
    </div>

    <!------------ Review Model Box --------------->
    <div class="modal fade" id="reviewModal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-warning">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">
          <i class="fa fa-flag"></i> Confirm Review
        </h4>
      </div>

      <div class="modal-body text-center" id="reviewText">
        Are you sure?
      </div>

      <div class="modal-footer text-center">
        <button class="btn btn-default btn-sm" data-dismiss="modal">
          Cancel
        </button>
        <button class="btn btn-warning btn-sm" id="confirmReviewBtn">
          Yes, Continue
        </button>
      </div>

    </div>
  </div>
</div>


    <!-- ************************ -->
</section>
<script>
    // Delete Model Box
    let deleteId = null;

    function openDeleteModal(id) {
        deleteId = id;
        $('#deleteModal').modal('show');
    }

    function confirmDelete() {
        $.ajax({
            url: "vahan_delete.php",
            type: "POST",
            dataType: "json",
            data: {
                id: deleteId
            },
            success: function(res) {
                if (res.status === "success") {
                    $('#deleteModal').modal('hide');

                    // reload DataTable without page refresh
                    $('#vehicleTable').DataTable().ajax.reload(null, false);
                } else {
                    alert(res.message);
                }
            },
            error: function() {
                alert("Server error. Try again.");
            }
        });
    }

    // Reviw Model box  

 let reviewId = null;
let reviewFlag = null;

$(document).on('click', '.review-toggle', function () {

    reviewId   = $(this).data('id');
    reviewFlag = parseInt($(this).data('flag'));

    const message = reviewFlag === 1
        ? 'Do you want to mark this vehicle as NOT reviewed?'
        : 'Do you want to mark this vehicle as Reviewed?';

    $('#reviewText').text(message);

    // ✅ Bootstrap 3 modal open
    $('#reviewModal').modal('show');
});


    $('#confirmReviewBtn').on('click', function () {

    $.ajax({
        url: 'vahan_update_review.php',
        type: 'POST',
        dataType: 'json',
        data: {
            id: reviewId,
            flagged: reviewFlag === 1 ? 0 : 1
        },
        success: function (res) {

            if (res.status === 'success') {

                $('#reviewModal').modal('hide');
                $('#vehicleTable').DataTable().ajax.reload(null, false);

            } else {
                alert(res.message || 'Failed');
            }
        },
        error: function () {
            alert('Server error');
        }
    });
});


    //*******************  For Datatable *****************//////////////////  
    $(document).ready(function() {
        $('#vehicleTable').DataTable({
            processing: true,
            serverSide: true,
            pageLength: 50,
            lengthMenu: [10, 25, 50, 100],
            ajax: {
                url: "vehicle_list_api.php",
                type: "POST"
            },
            order: [
                [1, "desc"]
            ],
            columns: [
                // {
                //     data: "id"
                // },
                {
                    data: null,
                    title: "S.No",
                    render: function(data, type, row, meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {
                    data: "vehicle_no",
                    render: function(vehicle_no, type, row) {
                        return ` <a href="index.php?view=view_vahan&id=${row.id}" >${vehicle_no} </a>`;
                    }
                },
                {
                    data: "make"
                },
                {
                    data: "motDueDate",
                    render: function(data) {
                        if (!data) return "";
                        const [y, m, d] = data.split("-");
                        return `${d}-${m}-${y}`;
                    }
                },
                {
                    data: "inspection_date",
                    render: function(data, type) {

                        if (type === "sort") {
                            return data ? data : "0000-00-00";
                        }

                        if (!data || data === "0000-00-00 00:00:00") {
                            return "No Inspection";
                        }

                        const [y, m, d] = data.split(' ')[0].split('-');
                        return `${d}-${m}-${y}`;
                    }
                },
                {
                    data: "flagged",
                    orderable: false,
                    searchable: false,
                    render: function(data, type, row) {

                        data = parseInt(data); 
                        const color = data == 1 ? 'red' : 'green';
                        const title = data == 1 ? 'Reviewed' : 'Mark as Reviewed';

                        return `
            <i class="fa fa-flag review-toggle"
               data-id="${row.id}" data-flag="${data}" title="${title}" style="cursor:pointer; color:${color}; font-size:16px;"></i>`;
                    }
                }

                <?php if ($_SESSION['type'] === 'Administrator'): ?>,
                    {
                        data: "id",
                        orderable: false,
                        searchable: false,
                        render: function(id) {
                            return ` 
                        <a href="index.php?view=view_vahan&id=${id}" class="btn btn-info btn-sm">
                          <i class="fa fa-eye"></i>
                        </a>
                        <a href="" download="" target="_blank" class="btn btn-primary btn-sm">
                          <i class="fa fa-download"></i>
                        </a>
                        <a href="javascript:void(0);"
   class="btn btn-danger btn-sm"
   onclick="openDeleteModal(${id})">
   <i class="fa fa-trash"></i>
</a>


                        <button class="btn btn-success btn-sm" onclick="sharePdfFile('','')">
                          <i class="fa fa-share-alt"></i>
                        </button>
                    `;
                        }
                    }
                <?php endif; ?>
            ]
        });
    });
</script>