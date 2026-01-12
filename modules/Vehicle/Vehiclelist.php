<!-- Content Header -->
<section class="content-header">
    <h1>Vehicle <small>Advance Search</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Advance Search</li>
    </ol>
</section>

<!-- Content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">

            <!-- Search Box -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Advance Search</h3>
                </div>

                <div class="box-body">
                    <form id="searchForm" class="form-inline">

                        <div class="form-group">
                            <label>Vehicle No:</label>
                            <input type="text" id="vehicle_no" class="form-control"
                                placeholder="KA01AB1234">
                        </div>

                        <div class="form-group">
                            <label>Make:</label>
                            <select id="make" class="form-control">
                                <option value="">All</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Fuel:</label>
                            <select id="fuelType" class="form-control">
                                <option value="">All</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Reviewed:</label>
                            <select id="reviewed" class="form-control">
                                <option value="">All</option>
                                <option value="1">Reviewed</option>
                                <option value="0">Not Reviewed</option>
                            </select>
                        </div>
                        <?php if ($_SESSION['type'] === 'Administrator'): ?>
                            <div class="form-group">
                                <label>Archived:</label>
                                <select id="archived" class="form-control">
                                    <option value="0">All</option>
                                    <option value="1">Archived</option>
                                </select>
                            </div>
                        <?php endif; ?>

                        <div class="form-group">
                            <label>MOT Due:</label>
                            <input type="date" id="motFrom" class="form-control">
                            to
                            <input type="date" id="motTo" class="form-control">
                        </div>

                        <button type="button" id="searchBtn" class="btn btn-primary">
                            <i class="fa fa-search"></i> Search
                        </button>

                        <button type="button" id="resetBtn" class="btn btn-default">
                            <i class="fa fa-refresh"></i> Reset
                        </button>

                    </form>
                </div>
            </div>
            <!-- Table -->
            <div class="box box-default">
                <div class="box-body">

                    <!-- Responsive Scroll Wrapper -->
                    <div class="table-responsive vehicle-table-wrapper">
                        <table id="vehicleTable"
                            class="table table-bordered table-striped"
                            style="font-weight:bold; width:100%;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Vehicle No</th>
                                    <th>Make</th>
                                    <th>Fuel</th>
                                    <th>MOT Due</th>
                                    <th>Inspection Date</th>
                                    <th>Reviewed</th>
                                    <?php if ($_SESSION['type'] === 'Administrator'): ?>
                                        <th>Actions</th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- /Responsive Scroll Wrapper -->

                </div>
            </div>


            <!------------ Review Model Box --------------->
            <div class="modal fade" id="reviewModal">
                <div class="modal-dialog modal-sm ">
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

</section>

<!-- Scripts (place at bottom) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

<script>
    let table;

    $(document).ready(function() {

        table = $('#vehicleTable').DataTable({
            processing: true,
            serverSide: true,

            pageLength: 50,
            lengthMenu: [50, 100, 150, 200],
            order: [
                [0, 'desc']
            ],

            ajax: {
                url: "vehicle_list_api_advance_search.php",
                type: "POST",
                data: function(d) {
                    d.vehicle_no = $('#vehicle_no').val();
                    d.make = $('#make').val();
                    d.fuelType = $('#fuelType').val();
                    d.reviewed = $('#reviewed').val();
                    d.archived = $('#archived').val();
                    d.motFrom = $('#motFrom').val();
                    d.motTo = $('#motTo').val();
                }
            },

            columns: [
                // {
                //   data: "id"
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
                    data: "fuelType"
                },
                {
                    data: "motDueDate",
                    render: function(data) {
                        if (!data) return '';

                        // Convert DB date (YYYY-MM-DD) to Date object
                        const motDate = new Date(data);
                        const today = new Date();

                        // Remove time part for accurate comparison
                        today.setHours(0, 0, 0, 0);

                        const [y, m, d] = data.split('-');
                        const formatted = `${d}-${m}-${y}`;

                        // If MOT date is before today → RED
                        if (motDate < today) {
                            return `<span style="color:red; font-weight:bold;">${formatted}</span>`;
                        }

                        // Else normal
                        return formatted;
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
                    orderable: true,
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
                        render: function(id, type, row) {
                            // Build PDF URL dynamically
                            const pdfUrl = `generate_vehicle_pdf.php?id=${id}`;

                            // Build file name safely
                            const regNo = row.vehicle_no || 'VEHICLE';
                            const fileName = `REPORT_${regNo.replace(/[^a-z0-9]/gi, '_').toUpperCase()}.pdf`;

                            return `
            <a href="index.php?view=view_vahan&id=${id}" 
               class="btn btn-info btn-sm">
                <i class="fa fa-eye"></i>
            </a>

            <a href="javascript:void(0);"
               class="btn btn-danger btn-sm"
               onclick="openDeleteModal(${id})">
                <i class="fa fa-trash"></i>
            </a>

            <a href="${pdfUrl}"
               download="${fileName}"
               target="_blank"
               class="btn btn-primary btn-sm">
                <i class="fa fa-download"></i>
            </a>

            <button class="btn btn-success btn-sm"
                    onclick="sharePdfFile('${pdfUrl}','${fileName}')">
                <i class="fa fa-share-alt"></i>
            </button>
        `;
                        }
                    }
                <?php endif; ?>
            ]
        });

        $('#searchBtn').click(function() {
            table.ajax.reload();
        });

        $('#resetBtn').click(function() {
            $('#searchForm')[0].reset();
            table.ajax.reload();
        });

    });

    // Reviw Model box//  

    let reviewId = null;
    let reviewFlag = null;

    $(document).on('click', '.review-toggle', function() {

        reviewId = $(this).data('id');
        reviewFlag = parseInt($(this).data('flag'));

        const message = reviewFlag === 1 ?
            'Do you want to mark this vehicle as NOT reviewed?' :
            'Do you want to mark this vehicle as Reviewed?';

        $('#reviewText').text(message);

        $('#reviewModal').modal('show');
    });


    $('#confirmReviewBtn').on('click', function() {

        $.ajax({
            url: 'vahan_update_review.php',
            type: 'POST',
            dataType: 'json',
            data: {
                id: reviewId,
                flagged: reviewFlag === 1 ? 0 : 1
            },
            success: function(res) {

                if (res.status === 'success') {

                    $('#reviewModal').modal('hide');
                    $('#vehicleTable').DataTable().ajax.reload(null, false);

                } else {
                    alert(res.message || 'Failed');
                }
            },
            error: function() {
                alert('Server error');
            }
        });
    });


    //*************** */ Delete Model Box ***************//
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


    // Get Make // 
    function loadMakeDropdown() {
        $.ajax({
            url: 'get_unique_make.php',
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                if (res.status === 'success') {

                    let options = '<option value="">All</option>';

                    res.data.forEach(function(make) {
                        options += `<option value="${make}">${make}</option>`;
                    });

                    $('#make').html(options);
                }
            },
            error: function() {
                console.error('Failed to load make list');
            }
        });
    }

    $(document).ready(function() {
        loadMakeDropdown();
    });

    // Get Fule Type // 
    function loadFueltypeDropdown() {
        $.ajax({
            url: 'get_unique_fuletype.php',
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                if (res.status === 'success') {

                    let options = '<option value="">All</option>';

                    res.data.forEach(function(fuelType) {
                        options += `<option value="${fuelType}">${fuelType}</option>`;
                    });

                    $('#fuelType').html(options);
                }
            },
            error: function() {
                console.error('Failed to load make list');
            }
        });
    }

    $(document).ready(function() {
        loadFueltypeDropdown();
    });

    // Share PDF Function//
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