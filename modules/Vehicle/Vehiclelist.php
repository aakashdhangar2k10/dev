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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

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
                        <tbody style="font-weight: bold;"></tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</section>
<script>
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
                    render: function(data) {
                        return data == 1 ?
                            '<i class="fa fa-flag flag-toggle" style="cursor:pointer; color: red"></i>' :
                            '<i class="fa fa-flag flag-toggle" style="cursor:pointer; color: green"></i>';
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
                        <a href="index.php?view=del_vahan&id=${id}" class="btn btn-danger btn-sm" onclick="deleteVahan(${id})">
                        <i class="fa fa-trash"></i></a>

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