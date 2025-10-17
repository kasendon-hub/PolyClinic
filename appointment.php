<?php require_once('check_login.php');?>
<?php include('head.php');?>
<?php include('header.php');?>
<?php include('sidebar.php');?>
<?php include('connect.php');

if(isset($_POST['btn_submit']))
{
    if(isset($_GET['editid']))
    {
        $sql = "UPDATE appointment SET patientid='$_POST[patient]',departmentid='$_POST[department]',appointmentdate='$_POST[appointmentdate]',appointmenttime='$_POST[appointmenttime]',doctorid='$_POST[doctor]',status='$_POST[status]',app_reason='$_POST[reason]' WHERE appointmentid='$_GET[editid]'";
        if($qsql = mysqli_query($conn, $sql))
        {
?>
            <div class="popup popup--icon -success js_success-popup popup--visible">
              <div class="popup__background"></div>
              <div class="popup__content">
                <h3 class="popup__content__title">Success</h3>
                <p>Appointment Record Updated Successfully</p>
                <p><?php echo "<script>setTimeout(\"location.href = 'appointment.php';\",1500);</script>"; ?></p>
              </div>
            </div>
<?php
        }
        else
        {
            echo mysqli_error($conn);
        }
    }
    else
    {
        $sql = "INSERT INTO appointment(patientid, departmentid, appointmentdate, appointmenttime, doctorid, status, app_reason) VALUES ('$_POST[patient]', '$_POST[department]', '$_POST[appointmentdate]', '$_POST[appointmenttime]', '$_POST[doctor]', '$_POST[status]', '$_POST[reason]')";
        if($qsql = mysqli_query($conn, $sql))
        {
?>
            <div class="popup popup--icon -success js_success-popup popup--visible">
              <div class="popup__background"></div>
              <div class="popup__content">
                <h3 class="popup__content__title">Success</h3>
                <p>New Appointment Record Inserted Successfully</p>
                <p><?php echo "<script>setTimeout(\"location.href = 'appointment.php';\",1500);</script>"; ?></p>
              </div>
            </div>
<?php
        }
        else
        {
            echo mysqli_error($conn);
        }
    }
}

if(isset($_GET['editid']))
{
    $sql = "SELECT * FROM appointment WHERE appointmentid='$_GET[editid]'";
    $qsql = mysqli_query($conn, $sql);
    $rsedit = mysqli_fetch_array($qsql);
}

?>

<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

<div class="pcoded-content">
<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">

<div class="page-header">
<div class="row align-items-end">
<div class="col-lg-8">
<div class="page-header-title">
<div class="d-inline">
<h4>New Appointment</h4>
</div>
</div>
</div>
<div class="col-lg-4">
<div class="page-header-breadcrumb">
<ul class="breadcrumb-title">
<li class="breadcrumb-item">
<a href="index.php"> <i class="feather icon-home"></i> </a>
</li>
<li class="breadcrumb-item"><a href="appointment.php">Appointments</a></li>
</ul>
</div>
</div>
</div>
</div>

<div class="page-body">
<div class="row">
<div class="col-sm-12">
<div class="card">
<div class="card-block">
<form id="main" method="post" action="" enctype="multipart/form-data">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Patient</label>
        <div class="col-sm-4">
            <select class="form-control" name="patient" id="patient" required="">
                <option value="">-- Select One --</option>
    <?php
        $sqlpatient = "SELECT * FROM patient WHERE status='Active'";
        $qsqlpatient = mysqli_query($conn, $sqlpatient);
        while($rspatient = mysqli_fetch_array($qsqlpatient))
        {
            $selected = isset($rsedit['patientid']) && $rspatient['patientid'] == $rsedit['patientid'] ? 'selected' : '';
            echo "<option value='$rspatient[patientid]' $selected>$rspatient[patientid] - $rspatient[patientname]</option>";
        }
    ?>
            </select>
        </div>

        <label class="col-sm-2 col-form-label">Department</label>
        <div class="col-sm-4">
            <select class="form-control" name="department" id="department" required="">
                <option value="">-- Select One --</option>
                <?php
                    $sqldepartment = "SELECT * FROM department WHERE status='Active'";
                    $qsqldepartment = mysqli_query($conn, $sqldepartment);
                    while($rsdepartment = mysqli_fetch_array($qsqldepartment))
                    {
                        $selected = isset($rsedit['departmentid']) && $rsdepartment['departmentid'] == $rsedit['departmentid'] ? 'selected' : '';
                        echo "<option value='$rsdepartment[departmentid]' $selected>$rsdepartment[departmentname]</option>";
                    }
                ?>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Date</label>
        <div class="col-sm-4">
            <input type="date" class="form-control" name="appointmentdate" id="appointmentdate" value="<?php echo $rsedit['appointmentdate'] ?? ''; ?>" required="">
        </div>

        <label class="col-sm-2 col-form-label">Time</label>
        <div class="col-sm-4">
            <input type="time" class="form-control" name="appointmenttime" id="appointmenttime" value="<?php echo $rsedit['appointmenttime'] ?? ''; ?>" required="">
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Doctor</label>
        <div class="col-sm-4">
            <select name="doctor" id="doctor" class="form-control" required="">
                <option value="">-- Select One --</option>
                <?php
                    $sqldoctor = "SELECT * FROM doctor INNER JOIN department ON department.departmentid = doctor.departmentid WHERE doctor.status='Active'";
                    $qsqldoctor = mysqli_query($conn, $sqldoctor);
                    while($rsdoctor = mysqli_fetch_array($qsqldoctor))
                    {
                        $selected = isset($rsedit['doctorid']) && $rsdoctor['doctorid'] == $rsedit['doctorid'] ? 'selected' : '';
                        echo "<option value='$rsdoctor[doctorid]' $selected>$rsdoctor[doctorname] ($rsdoctor[departmentname])</option>";
                    }
                ?>
            </select>
        </div>

        <label class="col-sm-2 col-form-label">Status</label>
        <div class="col-sm-4">
            <select name="status" id="status" class="form-control" required="">
                <option value="">-- Select One --</option>
                <option value="Active" <?php echo isset($rsedit['status']) && $rsedit['status'] == 'Active' ? 'selected' : ''; ?>>Active</option>
                <option value="Inactive" <?php echo isset($rsedit['status']) && $rsedit['status'] == 'Inactive' ? 'selected' : ''; ?>>Inactive</option>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Reason</label>
        <div class="col-sm-10">
            <textarea class="form-control" name="reason" id="reason" placeholder="Reason..." required=""><?php echo $rsedit['app_reason'] ?? ''; ?></textarea>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" name="btn_submit" class="btn btn-primary">Save</button>
        </div>
    </div>

</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<?php include('footer.php');?>
