<!-- Content Header -->
<section class="content-header">
  <h1>Vehicle <small>Report</small></h1>
  <ol class="breadcrumb">
    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
    <li class="active">Vehicle Report</li>
  </ol>
</section>
<!-- Search Filters -->
 <section class="content">
  <div class="row">
    <div class="col-md-12">
<div class="box box-primary">
  <div class="box-header with-border">  
    <h3 class="box-title">Search / Report Filters</h3>
  </div>
  <div class="box-body">
    <form id="searchForm" class="form-inline">

      <div class="form-group">
        <label>Vehicle No:</label>
        <input type="text" id="vehicle_no" class="form-control" placeholder="KA01AB1234">
      </div>

      <div class="form-group">
        <label>Make:</label>
        <input type="text" id="make" class="form-control" placeholder="Toyota">
      </div>

      <div class="form-group">
        <label>Fuel:</label>
        <select id="fuelType" class="form-control">
          <option value="">All</option>
          <option value="Petrol">Petrol</option>
          <option value="Diesel">Diesel</option>
          <option value="CNG">CNG</option>
        </select>
      </div>

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
      <button type="button" id="exportBtn" class="btn btn-success">
        <i class="fa fa-file-excel-o"></i> Export Report
      </button>
      <button type="button" id="exportBtn" class="btn btn-danger">
        <i class="fa fa-file-excel-o"></i> Download Report
      </button>
    </form>
  </div>
</div>
 </div>
  </div>
</section>
<script>
$(document).ready(function() {
  // Initialize DataTable
  let table = $("#vehicleTable").DataTable({
    ajax: {
      url: "controller.php",
      type: "POST",
      data: function (d) {
        d.action = "listVehicles";
        d.vehicle_no = $("#vehicle_no").val();
        d.make = $("#make").val();
        d.fuelType = $("#fuelType").val();
        d.motFrom = $("#motFrom").val();
        d.motTo = $("#motTo").val();
      },
      dataSrc: "data"
    },
    columns: [
      { data: "id" },
      { data: "vehicle_no" },
      { data: "make" },
      { data: "model" },
      { data: "colour" },
      { data: "fuelType" },
      { data: "yearOfManufacture" },
      { data: "motDueDate" },
      { data: "taxDueDate" },
      {
        data: null,
        render: function (row) {
          return `
            <a href="vehicle_view.php?id=${row.id}" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
            <a href="vehicle_edit.php?id=${row.id}" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
            <button class="btn btn-danger btn-sm deleteBtn" data-id="${row.id}"><i class="fa fa-trash"></i></button>
          `;
        }
      }
    ]
  });

  // Search button
  $("#searchBtn").click(function () {
    table.ajax.reload();
  });

  // Reset filters
  $("#resetBtn").click(function () {
    $("#searchForm")[0].reset();
    table.ajax.reload();
  });

  // Export button
  $("#exportBtn").click(function () {
    let params = {
      action: "exportVehicles",
      vehicle_no: $("#vehicle_no").val(),
      make: $("#make").val(),
      fuelType: $("#fuelType").val(),
      motFrom: $("#motFrom").val(),
      motTo: $("#motTo").val()
    };
    let query = $.param(params);
    window.location.href = "controller.php?" + query;
  });
});
</script>
