<?php 
require_once('check_login.php');
include('head.php');
include('header.php');
include('sidebar.php');
include('connect.php');

// Function to display success popup
function showPopup($message, $redirectUrl) {
    echo <<<HTML
        <div class="popup popup--icon -success js_success-popup popup--visible">
            <div class="popup__background"></div>
            <div class="popup__content">
                <h3 class="popup__content__title">Success</h3>
                <p>{$message}</p>
                <p>
                    <script>setTimeout("location.href = '{$redirectUrl}';", 1500);</script>
                </p>
            </div>
        </div>
    HTML;
}

// Handle Form Submission
if (isset($_POST['btn_submit'])) {
    $doctorname = mysqli_real_escape_string($conn, $_POST['doctorname']);
    $mobileno = mysqli_real_escape_string($conn, $_POST['mobilenumber']);
    $departmentid = mysqli_real_escape_string($conn, $_POST['department']);
    $loginid = mysqli_real_escape_string($conn, $_POST['loginid']);
    $status = mysqli_real_escape_string($conn, $_POST['status']);
    $education = mysqli_real_escape_string($conn, $_POST['education']);
    $experience = mysqli_real_escape_string($conn, $_POST['experience']);
    $consultancy_charge = mysqli_real_escape_string($conn, $_POST['consultancy_charge']);
    
    if (isset($_GET['editid'])) {
        // Update Doctor
        $editid = intval($_GET['editid']);
        $sql = "UPDATE doctor SET 
                doctorname=?, 
                mobileno=?, 
                departmentid=?, 
                loginid=?, 
                status=?, 
                education=?, 
                experience=?, 
                consultancy_charge=? 
                WHERE doctorid=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssisssssi", $doctorname, $mobileno, $departmentid, $loginid, $status, $education, $experience, $consultancy_charge, $editid);
        if ($stmt->execute()) {
            showPopup("Doctor Record Updated Successfully", "view-doctor.php");
        } else {
            echo $conn->error;
        }
    } else {
        // Insert New Doctor
        $password = hash('sha256', mysqli_real_escape_string($conn, $_POST['password']));
        $salt = '2123293dsj2hu2nikhiljdsd';
        $hashed_password = hash('sha256', $salt . $password);

        $sql = "INSERT INTO doctor (doctorname, mobileno, departmentid, loginid, password, status, education, experience, consultancy_charge) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssissssss", $doctorname, $mobileno, $departmentid, $loginid, $hashed_password, $status, $education, $experience, $consultancy_charge);
        if ($stmt->execute()) {
            showPopup("Doctor Record Inserted Successfully", "view-doctor.php");
        } else {
            echo $conn->error;
        }
    }
}

// Fetch Doctor Data for Editing
if (isset($_GET['editid'])) {
    $editid = intval($_GET['editid']);
    $sql = "SELECT * FROM doctor WHERE doctorid=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $editid);
    $stmt->execute();
    $rsedit = $stmt->get_result()->fetch_assoc();
}

?>

<div class="pcoded-content">
    <div class="pcoded-inner-content">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-header">
                    <h4><?= isset($_GET['editid']) ? "Edit Doctor" : "Add Doctor" ?></h4>
                </div>
                <div class="page-body">
                    <form id="main" method="post" action="" enctype="multipart/form-data">
                        <!-- Doctor Name and Mobile Number -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Doctor Name</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="doctorname" value="<?= $rsedit['doctorname'] ?? '' ?>" required>
                            </div>
                            <label class="col-sm-2 col-form-label">Mobile No</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" name="mobilenumber" value="<?= $rsedit['mobileno'] ?? '' ?>" required>
                            </div>
                        </div>
                        <!-- Department and Login ID -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Department</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="department" required>
                                    <option value="">-- Select One --</option>
                                    <?php
                                    $sqldepartment = "SELECT * FROM department WHERE status='Active'";
                                    $qsqldepartment = mysqli_query($conn, $sqldepartment);
                                    while ($rsdepartment = mysqli_fetch_array($qsqldepartment)) {
                                        $selected = isset($rsedit['departmentid']) && $rsedit['departmentid'] == $rsdepartment['departmentid'] ? 'selected' : '';
                                        echo "<option value='{$rsdepartment['departmentid']}' {$selected}>{$rsdepartment['departmentname']}</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <label class="col-sm-2 col-form-label">Login ID</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="loginid" value="<?= $rsedit['loginid'] ?? '' ?>" required>
                            </div>
                        </div>
                        <!-- Password Fields for Add -->
                        <?php if (!isset($_GET['editid'])) { ?>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                            <label class="col-sm-2 col-form-label">Confirm Password</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="cnfirmpassword" required>
                                <span id="confirm-pw" style="color: red;"></span>
                            </div>
                        </div>
                        <?php } ?>
                        <!-- Other Details -->
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Education</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="education" value="<?= $rsedit['education'] ?? '' ?>" required>
                            </div>
                            <label class="col-sm-2 col-form-label">Experience</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="experience" value="<?= $rsedit['experience'] ?? '' ?>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Consultancy Charge</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="consultancy_charge" value="<?= $rsedit['consultancy_charge'] ?? '' ?>" required>
                            </div>
                            <label class="col-sm-2 col-form-label">Status</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="status" required>
                                    <option value="Active" <?= isset($rsedit['status']) && $rsedit['status'] == 'Active' ? 'selected' : '' ?>>Active</option>
                                    <option value="Inactive" <?= isset($rsedit['status']) && $rsedit['status'] == 'Inactive' ? 'selected' : '' ?>>Inactive</option>
                                </select>
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <div class="form-group row">
                            <div class="col-sm-10 offset-sm-2">
                                <button type="submit" name="btn_submit" class="btn btn-primary">
                                    <?= isset($_GET['editid']) ? "Update" : "Save" ?>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Password Matching Validation
    document.getElementById('cnfirmpassword').addEventListener('input', function () {
        const password = document.getElementById('password').value;
        const confirmPassword = this.value;
        const message = document.getElementById('confirm-pw');
        message.textContent = password !== confirmPassword ? 'Passwords do not match' : '';
    });
</script>
<?php include('footer.php'); ?>
